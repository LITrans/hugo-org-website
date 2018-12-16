#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# add the config files
git add config.toml deploy.sh

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push build repos.
git push origin master

# Come Back up to the Project Root
cd ..

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding hugo backend `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push sourcerepos.
git push origin master