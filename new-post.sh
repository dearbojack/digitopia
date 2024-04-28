# #!/bin/bash

# # Ask for post title
# read -p "Enter post title: " title

# # Ask for post tags (comma-separated)
# read -p "Enter post tags (comma-separated): " tags

# # Format tags as an array
# IFS=',' read -ra tags_array <<< "$tags"

# # Generate file name with date, post title, and extension
# file_name=$(date +"%Y-%m-%d")-$(echo "$title" | tr " " "-" | tr '[:upper:]' '[:lower:]').md

# # Create the post file with front matter
# echo "+++
# title = '$title'
# date = $(date +"%Y-%m-%dT%H:%M:%S%:z")
# author = '胸毛齐腰'
# tags = ["${tags_array[@]}"]
# draft = false
# +++" > "content/posts/$file_name"

# # Inform the user
# echo "New post '$title' created successfully at 'content/posts/$file_name'"

#!/bin/bash

# Ask for post title
read -p "Enter post title: " title

# Ask for post tags (space separated)
read -p "Enter post tags (space separated): " tags

# Format tags as an array
IFS=',' read -ra tags_array <<< "$tags"

# Generate file name with date, post title, and extension
file_name=$(date +"%Y-%m-%d")-$(echo "$title" | tr " " "-" | tr '[:upper:]' '[:lower:]').md

# Create the post file with front matter
echo "+++
title = '$title'
date = $(date +"%Y-%m-%d")
author = '胸毛齐腰'
tags = [\"${tags_array[@]// /\", \"}\"]
draft = false
+++
<!-- created at $(date +"%Y-%m-%dT%H:%M:%S%:z") -->
" > "content/posts/$file_name"

# Inform the user
echo "New post '$title' created successfully at 'content/posts/$file_name'"

