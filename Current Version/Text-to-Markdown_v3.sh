#!/bin/bash

# Create variables for file extensions
old_ext=".txt"
new_ext=".md"

# Enable globstar to utilize double asterisk for recursive directory actions
shopt -s globstar

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
	
	# Prompt user when a file already exists
	if [ -e "$directory"/"$filename$new_ext" ]; then
	  echo "'$filename$new_ext' already exists; overwrite?"
	  read -p "Options: y (yes), n (no)" response
	  
      # Iterate through if statements, performing actions based on user response to prompt
	  
	  # Copy contents of this file and write to the new file type
	  # Move new file out of parent directy, into its respective child directory
	  if [ $response = "y" ]; then	    
        cp "$file" "$new_file"	    
	    mv "$new_file" "$directory"
	    echo "Created Markdown copy of '$file'."

	  # Do nothing for this file
	  elif [ $response = "n" ]; then        
	    :

      # Quit the script when user inputs an invalid response to the prompt
	  else
	    echo "Invalid response: exiting script. Relaunch script to try again."
		break
	  fi

    # Continue with copy operation when file does not already exist
	else
      cp "$file" "$new_file"
	  mv "$new_file" "$directory"
      echo "Created Markdown copy of '$file'."
	fi
  done
  
echo
echo "Finished copying text to Markdown. Please press Enter to close this window."
echo

# Allow user to view what was printed in terminal before closing window
read

# changelog:
# ------
# - Added lines 10-15; notify user that Ctrl + C will quit the script if needed.
# - Updated line 20; condensed comments into one.
# - Added lines 24-42; prompt user for action to perform when duplicate files are detected.
#   - Future revision should add "yes to all" and "no to all" option, and do something more useful than quit the script if an invalid response is entered.
# - Added various spaces throughout code to help with asthetics here and in the terminal.
