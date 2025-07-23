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

    # Quit the script when user inputs an invalid response to the prompt
    if [ "$response" != "" -a "$response" != "y" -a "$response" != "n" ]; then
	  echo "Invalid response: exiting script. Relaunch script to try again."
	  break
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
	
    # Continue with same copy operation as response=y, since file does not already exist
	if [ -e "$directory"/"$filename$new_ext" ]; then
	  :
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
# - Added line 11; auto_response variable to be used when ALL files response is chosen.
# - Updated lines 21-68; overhaul of entire for loop, adding response options that affect all files.
# - Added GNU license info at bottom of code.
# - Future revision should still address what happens when user inputs an invalid response.
# - Future revision should address when the mv command fails due to attempting mv from parent directory back into parent directory.



    # Copyright (C) 2025  Ethelred77

    # This program is free software: you can redistribute it and/or modify
    # it under the terms of the GNU General Public License as published by
    # the Free Software Foundation, either version 3 of the License, or
    # (at your option) any later version.

    # This program is distributed in the hope that it will be useful,
    # but WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    # GNU General Public License for more details.

    # You should have received a copy of the GNU General Public License
    # along with this program.  If not, see <https://www.gnu.org/licenses/>.
