#!/bin/bash

# Define the source directory and destination directory
SOURCE_DIR1=""
SOURCE_DIR2=""
DESTINATION_DIR=""

# Define the path to the CSV file
CSV_FILE="list.csv"

# Count the number of search terms (prefixes) in the CSV file
total_prefixes=$(grep -c '' "$CSV_FILE")

# Loop through the file names in the CSV file and copy the corresponding files
total_files=0
while IFS=, read -r PREFIX
do
  echo "Searching for files with prefix $PREFIX..."

  # Use the find command to locate the .fastq.gz or .fq.gz files with the matching prefix. Includes an underscore _ with the prefix to exclude non-exact matches
  FILES=$(find "$SOURCE_DIR1" "$SOURCE_DIR2" -type f \( -name "${PREFIX}_*.fastq.gz" -o -name "${PREFIX}_*.fq.gz" \) -print)

  if [ -z "$FILES" ]
  then
    echo "No files found with prefix $PREFIX"
  else
    # Copy the files to the destination directory
    for FILE in $FILES
    do
      echo "Copying file $FILE..."
      cp "$FILE" "$DESTINATION_DIR"
      total_files=$((total_files+1))
    done
  fi

done < "$CSV_FILE"

# Count the number of files in the destination directory
total_files_in_destination=$(find "$DESTINATION_DIR" -type f | wc -l)

echo "Total prefixes: $total_prefixes"
echo "Total files copied: $total_files"

# Check for potential sequencing number duplicates in retrieved files
if [ $total_files -gt $((2 * total_prefixes)) ]
then
  echo "Warning: the number of files copied is more than double the number of search terms! Sequencing replicates with identical prefixes may be present"
fi

# Check if the number of files copied is odd
if [ $((total_files % 2)) -ne 0 ]
then
  echo "Warning: The number of files in the destination directory is odd, which is unexpected. A forward or reverse (R1 or R2) read may be missing for a sample."
fi
