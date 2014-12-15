#!/bin/bash

for rstfile in "Monteverdi.rst" "stereo.rst" "featextract.rst" ; do 
    perl -pi -e 's/\|image\|\ image::/"image".++$i/ge' $rstfile
    perl -pi -e 's/\|image\|/"image".++$i/ge' $rstfile
    perl -pi -e 's|\.\.\/Art|"./Art"|ge' $rstfile
    perl -pi -e 's|`__|"`_"|ge' $rstfile
done
