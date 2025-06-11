#!/bin/bash

# Create variables for file extensions
old_ext=".txt"
new_ext=".md"

# Enable globstar to utilize double asterisk for recursive directory actions
shopt -s globstar

# Iterate through parent and child directories
for file in **/*"$old_ext"
  do
    # Create variable for filename of each file in loop
    filename=$(basename "$file" "$old_ext")
	# Create variable for path to each file in loop
	directory=$(dirname "$file")
	# Create variable to act as placeholder for each file in loop
    new_file="$filename$new_ext"
	# Copy contents of each file in loop and write them to the new file type
    cp "$file" "$new_file"
	# Move new file out of parent directy, into its respective child directory
	mv "$new_file" "$directory"
	# Print in terminal the original filename, new filename, and which directory
    echo "Copied '$file' as '$new_file' into '$directory'"
  done

# Allow user to view what was printed in terminal before closing window
read

