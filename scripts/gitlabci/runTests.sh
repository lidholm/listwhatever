#!/bin/bash

# Use an if-else statement to check if the file exists.
if [ -f ".skipTests" ]
then
    echo "Skipping tests"
else
    echo "Running tests"
    flutter test -r expanded
fi
