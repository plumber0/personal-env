#!/usr/bin/env bash

# Get the absolute path of the directory where this script is located
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Initialize dry run flag (0 = execute commands, 1 = dry run mode)
dry="0"

# Parse command-line arguments
while [[ $# -gt 0 ]]; do
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
cd "$script_dir"

# Function to copy all managed files and directories from source to destination.
# Only entries that exist in the repo are touched; unrelated destination entries are preserved.
# Usage: copy_managed_entries <source_dir> <destination_dir> [skip_name ...]
copy_managed_entries() {
    from=$1
    to=$2
    shift 2
    skip_names=("$@")

    if [[ ! -d "$from" ]]; then
        return
    fi

    execute mkdir -p "$to"
    pushd "$from" > /dev/null

    while IFS= read -r -d '' entry; do
        rel=${entry#./}
        skip_entry="0"

        for skip_name in "${skip_names[@]}"; do
            if [[ "$rel" == "$skip_name" ]]; then
                skip_entry="1"
                break
            fi
        done

        if [[ "$skip_entry" == "1" ]]; then
            continue
        fi

        if [[ -d "$entry" ]]; then
            execute rm -rf "$to/$rel"
            execute cp -R "$entry" "$to/$rel"
        else
            execute rm -f "$to/$rel"
            execute cp "$entry" "$to/$rel"
        fi
    done < <(find . -mindepth 1 -maxdepth 1 -print0)

    popd > /dev/null
}

copy_managed_entries configs ~ .config
copy_managed_entries configs/.config ~/.config
