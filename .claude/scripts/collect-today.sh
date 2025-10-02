#!/bin/bash

# Function to collect files for a specific date
collect_date() {
    local FULL_DATE=$1

    echo "Searching for files changed on: $FULL_DATE"
    echo "---"

    for dir in "$CODE_DIR"/*; do
        if [ -d "$dir" ]; then
            HISTORY_DIR="$dir/.specstory/history"

            if [ -d "$HISTORY_DIR" ]; then
                echo "Checking: $HISTORY_DIR"

                # Find files in history directory whose filename matches the target date
                FILES=$(find "$HISTORY_DIR" -type f -name "${FULL_DATE}*" 2>/dev/null)

                if [ -n "$FILES" ]; then
                    echo "Found files in $HISTORY_DIR:"
                    echo "$FILES"
                    echo ""

                    # Copy files to destination
                    echo "$FILES" | while read -r file; do
                        if [ -f "$file" ]; then
                            # Preserve directory structure relative to .specstory/history
                            REL_PATH="${file#$HISTORY_DIR/}"
                            DEST_FILE="$DEST_DIR/$REL_PATH"
                            DEST_SUBDIR=$(dirname "$DEST_FILE")

                            mkdir -p "$DEST_SUBDIR"
                            cp "$file" "$DEST_FILE"
                            echo "Copied: $file -> $DEST_FILE"
                        fi
                    done
                    echo "---"
                fi
            fi
        fi
    done
}

# Parse arguments
SINCE_DATE=""
TARGET_DATE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --since)
            SINCE_DATE="$2"
            shift 2
            ;;
        *)
            TARGET_DATE="$1"
            shift
            ;;
    esac
done

# Find all directories in ~/Code
CODE_DIR="$HOME/Code"
DEST_DIR="$HOME/Code/aomi-teamspace/.specstory/history"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

YEAR=$(date +%Y)

# If --since flag is provided, loop through dates
if [ -n "$SINCE_DATE" ]; then
    START_DATE="${YEAR}-${SINCE_DATE}"
    END_DATE=$(date +%Y-%m-%d)

    echo "Collecting files from $START_DATE to $END_DATE"
    echo "==="

    CURRENT_DATE="$START_DATE"
    while [ "$CURRENT_DATE" != "$(date -j -v+1d -f '%Y-%m-%d' "$END_DATE" '+%Y-%m-%d' 2>/dev/null)" ]; do
        collect_date "$CURRENT_DATE"
        CURRENT_DATE=$(date -j -v+1d -f '%Y-%m-%d' "$CURRENT_DATE" '+%Y-%m-%d' 2>/dev/null)
    done
elif [ -n "$TARGET_DATE" ]; then
    # Single date provided
    FULL_DATE="${YEAR}-${TARGET_DATE}"
    collect_date "$FULL_DATE"
else
    # Use today's date
    FULL_DATE=$(date +%Y-%m-%d)
    collect_date "$FULL_DATE"
fi

echo "Done! Files copied to: $DEST_DIR"
