#!/bin/bash
SCENE_FILE="$1"
OUTPUT_DIR="$2"
RENDER_ENGINE="$3"
DEVICE_TYPE="$4"

if [ -z "$SCENE_FILE" ] || [ -z "$OUTPUT_DIR" ] || [ -z "$RENDER_ENGINE" ] || [ -z "$DEVICE_TYPE" ]; then
    echo "Usage: ./entrypoint.sh <scene_file> <output_dir> <render_engine> <device_type>"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Run Blender with the specified settings
blender -b "$SCENE_FILE" -o "$OUTPUT_DIR/render_" -F PNG -x 1 -E "$RENDER_ENGINE" --cycles-device "$DEVICE_TYPE" -f 1
