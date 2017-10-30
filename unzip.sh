#!/bin/sh

mkdir data/source_unzip/

for f in data/source/*.zip ; do
    b=`basename $f .zip`
    d=data/source_unzip/"$b"
    mkdir -p $d
    unzip -d $d $f
done
