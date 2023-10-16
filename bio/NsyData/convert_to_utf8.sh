#!/bin/bash

# Loop through all .txt files in the current directory
for file in *.txt; do
    # Check if the file exists and is a regular file
    if [[ -f "$file" ]]; then
        # Get the current encoding of the file
        current_encoding=$(file -b --mime-encoding "$file")

        # Check if the current encoding is not UTF-8
        if [[ "$current_encoding" != "utf-8" ]]; then
            echo "Converting $file to UTF-8..."
            
            # Create a backup of the original file
            cp "$file" "$file.bak"

            # Convert the file to UTF-8
            iconv -f "$current_encoding" -t utf-8 "$file" > "$file.utf8"

            # Overwrite the original file with the UTF-8 version
            mv "$file.utf8" "$file"

            echo "Conversion complete."
        fi
    fi
done