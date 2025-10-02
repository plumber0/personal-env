#!/usr/bin/env bash
# ^ Shebang line: tells the OS to run this script with bash
# /usr/bin/env finds bash in your PATH (more portable than hardcoding /bin/bash)

# Get the directory where this script is located
# BASH_SOURCE[0] = the current script's filepath
# dirname = extracts the directory path from a filepath
# $(...) = command substitution: runs the command inside and returns its output
# && = logical AND operator: runs the second command only if the first succeeds
# The whole line: navigate to script's directory and get its absolute path
script_dir=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Initialize variables with default values
# "" = empty string
filter=""
dry="0"

# Change directory to the script's location
# $ prefix accesses the value of a variable
cd $script_dir

# Find all executable files in the ./runs directory
# find = searches for files
# -type f = only files (not directories)
# -perm +111 = files with execute permission for someone
# -mindepth 1 = don't include ./runs itself
# -maxdepth 1 = only search one level deep (don't recurse into subdirectories)
scripts=$(find ./runs -type f -perm +111 -mindepth 1 -maxdepth 1)

# Parse command-line arguments
# [[ ]] = test command for conditionals (more modern than [ ])
# $# = number of arguments passed to the script
# while loop continues as long as there are arguments left
# $# decrements by 1 each time a shift happens
while [[ $# > 0 ]]; do
    # $1 = first argument
    # == = string equality comparison
    if [[ $1 == "--dry" ]]; then
        dry="1"
    else
        # If not --dry, treat the argument as a filter string
        filter="$1"
    fi
    # shift = removes the first argument and shifts all others down
    # so $2 becomes $1, $3 becomes $2, etc.
    shift
done

# Define a logging function
# () after name defines a function
log () {
    # Check if dry run mode is enabled
    if [[ $dry == "1" ]]; then
        # echo = prints text to the console
        # $@ = all arguments passed to this function
        echo "[DRY_RUN]: $@"
    else
        echo "$@"
    fi
}

# Define an execution function that respects dry-run mode
execute() {
    log "execute: $@"
    if [[ $dry == "1" ]]; then
        # return = exit the function early
        return
    fi
    # "$@" = execute all arguments as a command
    # Quotes preserve arguments with spaces
    "$@"

}

# Log the current filter setting
log "run: filter=$filter"

# Loop through each script found earlier
# for loop iterates over space-separated values in $scripts
for script in $scripts; do
    # | = pipe: sends output of one command as input to the next
    # grep = searches for text patterns
    # -q = quiet mode (no output, just exit status)
    # -v = invert match (returns true if pattern NOT found)
    # This checks if the script path does NOT contain the filter string
    if echo "$script" | grep -qv "$filter"; then
        log "filtered: $filter -- $script"
        # continue = skip to next iteration of the loop
        continue
    fi
    log "running script: $script"
    # Execute the script using our execute function
    # ./ = current directory prefix
    execute ./$script
done
