#!/usr/bin/env bash

dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

# Check if brew is installed
if [ ! -x "$(which brew)" ]; then
	echo "# Installing 'brew'..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
	echo "# Updating 'brew'..."
	brew update
fi 

# Check if jq is installed
if [ ! -x "$(which jq)" ]; then
	echo "# Installing 'jq'..."
	brew install jq
else
	echo "# Updating 'jq'..."
	brew upgrade jq && brew cleanup jq
fi 

# Check if grealpath is installed
if [ ! -x "$(which grealpath)" ]; then
	echo "# Installing 'coreutils'..."
	brew install coreutils
else
	echo "# Updating 'coreutils'..."
	brew upgrade coreutils && brew cleanup coreutils
fi 

# Check if jq is installed
if [ ! -f "/usr/local/bin/svn" ]; then
	echo "# Installing 'svn'..."
	brew install svn
else
	echo "# Updating 'jq'..."
	brew upgrade svn && brew cleanup svn
fi 
