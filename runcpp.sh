#!/bin/bash

# Check if g++ exists
command -v g++ >/dev/null 2>&1 || {
    echo >&2 "g++ is not installed. Please run sudo apt install g++";
    exit 1;
}

usage(){
cat <<EOF
Usage: runcpp [arguments if any] <file.cpp>
Arguments:
   	-h  or  --help	Print Help and exit
EOF
}

# read args
case $1 in
	-h | --help | "")
		usage
		exit
		;;
	*) filePath=$1
		;;
esac

fileName="$(basename $filePath)"
fileNameWithoutExtension="$(basename $filePath .cpp)"
extension="${fileName#*.}"
objectFile="${fileNameWithoutExtension}.o"

if [  "$extension" != "cpp" ]; then
	usage
	exit
fi

if [ ! -d "compiledFiles" ]; then
	echo "Compiled code will be moved to compiledFiles folder."
	mkdir compiledFiles
fi

# compile and execute
g++ -std=c++14 -Wshadow -Wall "$filePath" -o "$objectFile" -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
./"$objectFile"

mv "$objectFile" compiledFiles
