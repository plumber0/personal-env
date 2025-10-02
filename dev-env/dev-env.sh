#!/usr/bin/env bash

# Get the absolute path of the directory where this script is located
script_dir=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)

# Initialize dry run flag (0 = execute commands, 1 = dry run mode)
dry="0"

# Parse command-line arguments
while [[ $# > 0 ]]; do
    # If --dry flag is passed, enable dry run mode (show what would happen without executing)
    if [[ $1 == "--dry" ]]; then
        dry="1"
    fi
    # Move to the next argument
    shift
done


# Logging function: prints messages with optional [DRY_RUN] prefix
log () {
    if [[ $dry == "1" ]]; then
        echo "[DRY_RUN]: $@"
    else
        echo "$@"
    fi
}

# Execute function: runs commands and respects dry run mode
execute() {
    # Log what command will be executed
    log "execute: $@"
    # If in dry run mode, don't actually execute the command
    if [[ $dry == "1" ]]; then
        return
    fi
    # Execute the command with all its arguments
    "$@"
}

log "-----------dev-env-----------"


# Change to the script's directory to work with relative paths
cd $script_dir

# Function to copy all directories from source to destination
# Usage: copy_dir <source_dir> <destination_dir>
copy_dir() {
    # pushd: Changes to the source directory AND saves current location on a directory stack
    # This is like 'cd' but with memory - it remembers where we came from
    # Why use pushd instead of cd? So we can easily return to where we started
    # without manually saving the current directory path in a variable
    # Note: redirect to /dev/null to suppress directory stack output on macOS
    pushd $1 > /dev/null
    to=$2

    # Find all directories (one level deep) in the current location
    dirs=$(find . -mindepth 1 -maxdepth 1 -type d)
    # Loop through each directory found
    for dir in $dirs; do
        # Remove the existing directory at the destination (if it exists)
        execute rm -rf $to/$dir
        # Copy the directory and its contents to the destination
        execute cp -r $dir $to/$dir
    done
    # popd: Returns to the directory we were in before the 'pushd' command
    # This automatically restores our original location from the directory stack
    # ensuring we end up back where we started, regardless of what happened in between
    # Note: redirect to /dev/null to suppress directory stack output on macOS
    popd > /dev/null
}

copy_dir configs ~


# Function to copy a single file to a destination directory
# Usage: copy_file <source_file> <destination_dir>
copy_file() {
    from=$1
    to=$2
    # Extract just the filename from the full path
    name=$(basename $from)
    # Remove the existing file at the destination (if it exists)
    execute rm $to/$name
    # Copy the file to the destination directory
    execute cp $from $to/$name
}

# Copy .specialrc file to the home directory (~)
copy_file configs/.zshrc ~