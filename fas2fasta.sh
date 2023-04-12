#!/bin/bash

# loop through all files ending in .fas
for file in *.fas; do
    # check if file exists
    if [ -e "$file" ]; then
        # rename file to replace .fas with .fasta
        mv "$file" "${file%.fas}.fasta"
        echo "Renamed $file to ${file%.fas}.fasta"
    fi
done