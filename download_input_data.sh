#!/bin/sh

while read line
do
    file=$(basename $line)
    folder=$(dirname $line)

    if [ ! -e $folder ]
    then
        mkdir -p $folder
    fi

    if [ ! -e $folder/$file ]
    then
        pushd $folder > /dev/null
        svn export --username guestuser https://svn-ccsm-inputdata.cgd.ucar.edu/trunk/$folder/$file
        popd > /dev/null
    fi

done <  files_needed.txt
