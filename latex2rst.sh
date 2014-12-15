#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Insufficient args "
    exit -1;
fi
rstdir=$1
pandoc=/usr/bin/pandoc
for texfile in "Monteverdi.rst" "stereo.rst" "featextract.rst" ; do 
    fname=`basename $texfile`
    rstfile=$rstdir/"${fname%.*}".rst
    echo "Converting $texfile ---> $rstfile"
    $pandoc $texfile -t rst -o $rstfile
done
