#!/bin/bash

# Enable globstar to utilize double asterisk for recursive directory actions
shopt -s globstar

# Create variables for file extensions
old_ext=".txt"
new_ext=".md"

# Create variable to hold a value when user responds with Y or N, automating the remaining responses
auto_response=""

# Begin with notification to user for manually quitting the script
echo
echo "----------------------------------------------------"
echo "In case of issues or to quit early, press Ctrl + C"
echo "----------------------------------------------------"
echo

# Iterate through parent and child directories
for file in **/*"$old_ext"
  do

    # For each file in the loop, create variables for filename, path, & new_file placeholder
    filename=$(basename "$file" "$old_ext")
	directory=$(dirname "$file")
    new_file="$filename$new_ext"

	# Prompt user when a file already exists, and the auto_response variable is empty
	if [ -e "$directory"/"$filename$new_ext" -a "$auto_response" = "" ]; then
	  echo "'$filename$new_ext' already exists; overwrite?"
	  read -p "Options: y(es this file), n(o this file), Y(es ALL files), N(o ALL files)" response

    # When user responds with Y or N, assigns y or n to the auto_response variable, to automatically answer future if statements
	  if [ "$response" = "Y" ]; then
	    auto_response="y"
      elif [ "$response" = "N" ]; then
	    auto_response="n"
	  else
	    :
	  fi
	fi
   
    # When duplicate exists & auto_response has a value assigned (Y or N), replaces the response variable with auto_response variable y or n
	if [ -f "$directory"/"$filename$new_ext" -a "$auto_response" != "" ]; then
	  response="$auto_response"
	fi

	# When response is y, copy contents of this file and write to the new file type
	# Move new file out of parent directy, into its respective child directory
	if [ "$response" = "y" ]; then	    
      cp "$file" "$new_file"	    
	  mv "$new_file" "$directory"
	  echo "Created Markdown copy of '$filename'."
	  echo
	fi

	# When response is n, do nothing for this file
	if [ "$response" = "n" ]; then        
	  echo "'$filename' not copied."
	  echo
	fi
	
    # Quit the script when user inputs an invalid response to the prompt
    if [ "$response" != "" -a "$response" != "y" -a "$response" != "n" ]; then
      echo "Invalid response: exiting script. Relaunch script to try again."
	  break
	fi
	
    # Continue with same copy operation as response=y, since file does not already exist
	if [ -e "$directory"/"$filename$new_ext" ]; then
	  :
	elif [ ! -s "$directory"/"$filename$old_ext" ]; then
	  echo "File is empty; '$filename' not copied."
	else
	  cp "$file" "$new_file"
	  mv "$new_file" "$directory"
	  echo "Created Markdown copy of '$filename'."
	  echo
	fi
 
  done
  
echo
echo "Finished copying text to Markdown. Press Enter to close this window."

# Allow user to view what was printed in terminal before closing window
read

# changelog:
# ------
# - Added lines 73 & 74; do not create Markdown copy if original text file is blank.
# - Future revision should still address what happens when user inputs an invalid response.
# - Future revision should address when the mv command fails due to attempting mv from parent directory back into parent directory.
