#!/bin/bash

# Makeshiftfile - A Makefile, but it's makeshift (*nix Edition)
# Copyright (c) Arsalan "Velocity" Kazmi <https://that1m8head.github.io>
# This Bash script compiles every source file in the CWD and runs them one at a time.

# == Configuration
compiler=g++
compile_flags="-O3 -Wall"
execute_cmd=sh
file_type=cpp
require_confirmation=1

# == Debug info
echo "We're in $PWD."
echo "We're compiling $file_type files."
echo "We're using the compiler '$compiler' with flags '$compile_flags'."
echo "We're running "$execute_cmd" on every executable file in $PWD."
if [ $require_confirmation -eq 1 ]; then
    echo "We'll ask for confirmation before running executables."
else
    echo "We'll just run everything without asking."
fi

# == Detect Windows
if [[ "$OSTYPE" == "msys" ]]; then
    echo "Sorry, this is the *nix Edition of Makeshiftfile."
    echo "You need to use the Windows Edition, 'makeshift.bat'."
    exit 1
fi

# == Functionality
if [ -n "$(find . -maxdepth 1 -type f -name "*.$file_type")" ]; then
    for file in *.$file_type; do
        source_file=$file
        base_name=${source_file%.*}
        echo "Compiling $source_file..."
        $compiler $compile_flags $source_file -o $base_name
        if [ $? -ne 0 ]; then
            echo "Failed to compile $source_file."
        else
            echo "Successfully compiled $source_file."
        fi
    done
else
    echo "No $file_type files found for compilation."
    exit 1
fi

if [ $require_confirmation -eq 1 ]; then
    read -p "Finished running all executables. Press enter to continue."
fi

for file in *; do
    if [ -x "$file" ]; then
        echo "Running '$file'..."
        $execute_cmd "$file"
        if [ "$require_confirmation" -eq 1 ]; then
            read -p "Finished running '$file'. Press enter to continue."
        fi
    fi
done

# Bash scripting is less fricking confusing. Still, Python better lel