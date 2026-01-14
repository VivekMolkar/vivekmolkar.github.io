#!/bin/bash

# Image Optimization Script for PNG files
# This script optimizes PNG images using optipng and pngquant for lossless/near-lossless compression.
# Usage: ./scripts/optimize-images.sh [file.png | directory] (default: assets/)

set -e

# Function to optimize a single PNG file
optimize_png() {
  local file="$1"
  if [[ ! -f "$file" ]]; then
    echo "Error: $file is not a file"
    return 1
  fi
  echo "Optimizing $file"
  # First, optimize with optipng at maximum level
  optipng -o7 "$file"
  # Then, quantize with pngquant (safe quality range)
  pngquant --quality=75-85 --ext=.png --force "$file"
}

# Main logic
if [ $# -eq 0 ]; then
  # Default: optimize all PNGs in assets/
  echo "Optimizing all PNG files in assets/"
  find assets/ -type f -iname "*.png" -exec "$0" {} \;
elif [ -f "$1" ] && [[ "$1" =~ \.png$ ]]; then
  # Single PNG file
  optimize_png "$1"
elif [ -d "$1" ]; then
  # Directory: optimize all PNGs recursively
  echo "Optimizing all PNG files in $1/"
  find "$1" -type f -iname "*.png" -exec "$0" {} \;
else
  echo "Usage: $0 [file.png | directory] (default: assets/)"
  echo "Examples:"
  echo "  $0                           # Optimize assets/"
  echo "  $0 image.png                 # Optimize single file"
  echo "  $0 _site/assets/             # Optimize directory"
  exit 1
fi
