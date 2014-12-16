#!/bin/bash

declare -a rstfiles=('featextract' 'improc' 'Monteverdi2' 'Monteverdi' 'optpreproc' 'pbclassif' 'pleiades' 'stereo' 'OTB-Applications');
for rstfile in "${rstfiles[@]}" ; do 
    perl -pi -e 's/\|image\|\ image::/"image".++$i/ge' $rstfile.rst
    perl -pi -e 's/\|image\|/"image".++$i/ge' $rstfile.rst
    perl -pi -e 's|\.\.\/Art|"./Art"|ge' $rstfile.rst

    #the below perl must be fixed within the latex file. For now it rests here
    perl -pi -e 's|\`__|"`_ "|ge' $rstfile.rst
    perl -pi -e 's|\< http|"<http"|ge' $rstfile.rst
done

##hacks hacks hacks!!!!
perl -pi -e 's|math:\`\ |"math:`"|ge' featextract.rst
perl -pi -e 's|\ \`|"`"|ge' featextract.rst

