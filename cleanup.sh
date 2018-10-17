#!/bin/bash

# The path that will be seached
declare -r filepath="/home/dozerman/testdir"
# Filetypes we expect to be extracted from rar
declare -a extractedtypes=("mkv" "mp4" "avi")
#

# for each directory in filepath
for DIR in `find $filepath -mindepth 1 -type d | sort -d`
do
    rarcount=`ls -1 $DIR/*.rar 2>/dev/null | wc -l`
    if [ $rarcount != 0 ]
    then
        # there is a rar in this directory
        echo "rar found in $DIR"

        # find files that might be extracted from a rar (ignoring files with 'sample' in their name - case insensitive)
        extractedfiles=()
        for type in ${extractedtypes[*]}
        do 
            files=($(ls -1 $DIR/*.$type 2>/dev/null | grep -vi sample))
            extractedfiles=(${extractedfiles[*]} ${files[*]}) 
        done
        
        if [ ${#extractedfiles[*]} -eq 0 ]
        then
            # there are no files that could've been extracted here, continue to next directory
            echo "no potentially extracted files found in $DIR"
            continue
        fi
        
        # delete the files that might've been extracted here
        echo "deleting the file(s): ${extractedfiles[*]}"
        rm -f ${extractedfiles[*]}
    else
        # no rar found in here, skipping this directory
        echo "No rar found in $DIR"
    fi
done
