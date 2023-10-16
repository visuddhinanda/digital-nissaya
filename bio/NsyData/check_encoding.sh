#!/bin/bash
# Loop through all .txt files in the current directory
for file in *.txt; do
    # Check if the file exists and is a regular file
    if [[ -f "$file" ]]; then
        # Get the current encoding of the file
        current_encoding=$(file -b --mime-encoding "$file")

        echo "File: $file"
        echo "Encoding: $current_encoding"
        echo
    fi
done