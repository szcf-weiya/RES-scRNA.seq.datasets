#!/bin/bash

mkdir res

mkdir scater-objects
# process files and create scater objects
for f in `ls bash | grep .sh`; do
    name=(${f//./ })
    echo "processing $name..."
    mkdir $name
    cd $name
    # download and process a dataset; create scater object
    bash ../bash/$name.sh
    Rscript ../R/$name.R
    cp *.rds ../scater-objects
    cd ..
    mv $name res/
done

