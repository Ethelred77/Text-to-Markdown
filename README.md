# Text-to-Markdown

The purpose of this script is to automate the process of converting text(.txt) files to Markdown(.md) files. The script is a work in progress, and its author is open to recommendations for improvement, cleaner coding techniques, etc. 

## History

I have been slowly working my way through the journey of learning to code, and Markdown was something I learned early on. While taking various online courses, I was keeping notes in Markdown format in Notepad documents, and saving them as .txt files. When reviewing my notes, I prefer the view offered by Markdown, but this would require me to manually convert all .txt files to .md files. 

After searching online, I didn't find any premade scripts to accomplish this, so I created my own based on the Bash programming I had learned. This became a huge time investment for a simple bit of code, but I've learned a lot since beginning it, and was surprised at how enjoyable the experience was. I will continue to modify and add features when I have ideas and can find the time to do so. 

## Changes

A changelog is included at the bottom of the code, which lists all changes since the previous version. Also included are personal recommendations for changes to include in the next version. 

Anyone who wishes to contribute to this code may do so. I have only performed pull requests for training exercises, so I don't have enough experience to implement a procedure for pull requests for this code. 

## Additional Files

Basic repository documents, including this README, are provided as good standard practice, according to various Open Source courses I have taken. If any modifications are needed or recommended, please feel free to contribute. 

In addition to standard repo documents, I have included a short script to automatically delete all Markdown files within the parent and all child directories. This is useful when testing various aspects of the Text-to-Markdown script; just beware that **ALL** Markdown files will be completely deleted from the directories without a user prompt. The files will not be in the Recycle Bin or retrievable in any way (that I know of). 

Previous versions of the Text-to-Markdown script will be kept in a separate folder. This is for historical documentation purposes, to see how the code has progresses, and honestly, because I don't have enough experience to know the best procedure for keeping track of revision changes. Again, I'm open to recommendations for better ways to do this. 

## Dependencies

This script uses the Bash shell (`#!/bin/bash`).
