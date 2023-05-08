#!/bin/bash

echo "Check release notes"
#sed -i'' -e 's/\r$//' deploy/release_notes.txt

echo "============================"
# Check if any release notes has been added
git fetch origin main 

if [[ `git diff origin/main deploy/release_notes.txt` ]]; then
  echo "Release notes are updated. Good job!" 
else
  echo "Release notes are NOT updated"
  exit 2
fi

if [[ `git diff origin/main pubspec.yaml` ]]; then
  echo "Version is updated. Good job!"
else
  echo "Version is NOT updated"  && exit 3
fi

PUBSPEC_VERSION=$(cat pubspec.yaml | grep "version:" | awk '{print $2}' | cut -d '+' -f 1)
RELEASE_NOTES_VERSION=$(head -n 1 deploy/release_notes.txt | grep -e "[0-9.]")
echo "..$PUBSPEC_VERSION.."
echo "..$RELEASE_NOTES_VERSION.."
if [[ "$PUBSPEC_VERSION" == "$RELEASE_NOTES_VERSION" ]]; 
    then echo "Matching versions"
fi
echo "===="
if [[ "$PUBSPEC_VERSION" != "$RELEASE_NOTES_VERSION" ]]; then
    echo "Not matching versions"
    exit 1
fi
