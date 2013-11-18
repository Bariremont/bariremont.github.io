#!/bin/bash

DIRS=`ls $1/`

cd $1;
for d in $DIRS; do
    echo "dir=$d";
    cd "$d";
    rm *preview*;
    for i in `ls *.jpg`; do
       echo "-- file=$i"
       convert "$i" -resize $2 "preview.$i";
    done;
    rename 's/preview\.(\d+)/$1.preview/' preview.*.jpg;
    cd ..;
done;

