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
	if [ -e "$directory"/"$filename$new_ext" ]; then
	  echo "'$filename$new_ext' already exists."
	else
	  # Copy contents of each file in loop and write them to the new file type
      cp "$file" "$new_file"
	  # Move new file out of parent directy, into its respective child directory
	  mv "$new_file" "$directory"
	  # Print in terminal the original filename, new filename, and which directory
      echo "Copied '$file'."
	fi
  done
  
echo "Finished copying text to Markdown. Please press Enter to close this window."

# Allow user to view what was printed in terminal before closing window
read

# changelog:
# ------
# - Added lines 19-21, 28; if statement to skip copying/moving if the Markdown file already exists.
#   - Future revision should prompt user to overwrite; otherwise updates to text files will never have changes reflected in their respective Markdown files.
# - Added line 31; notify the user that the script is finished and prompt them to exit.
# - Updated line 27; output of which file was copied is now less cumbersome and easier to read.
