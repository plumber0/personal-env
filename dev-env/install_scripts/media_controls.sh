#!/usr/bin/env bash

# Compile media control scripts
# These are Objective-C programs that use native macOS frameworks
# No external dependencies required - everything is built into macOS

echo "Compiling media control scripts..."

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
scripts_dir="$script_dir/scripts"

# Create ~/bin directory if it doesn't exist
mkdir -p ~/bin

cd "$scripts_dir"

# Compile each media control script as a universal binary
# -arch arm64 -arch x86_64 = works on both Apple Silicon and Intel Macs
# Frameworks are all built-in to macOS

echo "  → Compiling media_play_pause..."
clang -arch arm64 -arch x86_64 \
    -framework Foundation \
    -framework AppKit \
    -framework ApplicationServices \
    -o ~/bin/media_play_pause \
    media_play_pause.m

echo "  → Compiling media_volume_up..."
clang -arch arm64 -arch x86_64 \
    -framework Foundation \
    -framework AppKit \
    -framework ApplicationServices \
    -o ~/bin/media_volume_up \
    media_volume_up.m

echo "  → Compiling media_volume_down..."
clang -arch arm64 -arch x86_64 \
    -framework Foundation \
    -framework AppKit \
    -framework ApplicationServices \
    -o ~/bin/media_volume_down \
    media_volume_down.m

echo "✓ Media control scripts compiled successfully!"
echo "  Binaries installed to ~/bin/"
echo "  Binaries are universal (Intel + Apple Silicon)"

