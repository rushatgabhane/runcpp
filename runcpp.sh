#!/bin/bash
path="$1"
filename="${path##*/}"

# g++ -std=c++14 -Wshadow -Wall -o "%e" "%f" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
echo "$path"
echo "$filename"
