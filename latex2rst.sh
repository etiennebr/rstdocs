#!/bin/bash
if [ "$#" -ne 2 ]; then
    echo "Insufficient args "
    exit -1;
fi
texdir=$1
rstdir=$2
pandoc=/usr/bin/pandoc
declare -a texfiles=('featextract' 'improc' 'Monteverdi2' 'Monteverdi' 'optpreproc' 'pbclassif' 'pleiades' 'stereo' 'OTB-Applications');
###declare -a texfiles=('residual_registration');

for texfile in "${texfiles[@]}" ; do 
    #append newcommand to begining
    texfile1="/tmp/$texfile-1.tex"
    sed -e '1s|^|\\newcommand{\\googleearth}{\\textbf{Google Earth\\copyright}\ }\n\n|' $texdir/$texfile.tex  > $texfile1
    sed -i -e '1s|^|\\newcommand{\\download}{\\href{http://sourceforge.net/projects/orfeo-toolbox/}{OTB download page}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\osgeow}{\\href{http://trac.osgeo.org/osgeo4w/}{OSGeo4W}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\gdal}{\\href{http://www.gdal.org/}{GDAL}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\qgis}{\\href{http://www.qgis.org/}{Quantum GIS}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\website}{\\href{http://orfeo-toolbox.org}{Orfeo ToolBox website}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\dox}{\\href{http://orfeo-toolbox.org/doxygen/}{Doxygen}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\sg}{\\href{http://orfeo-toolbox.org/SoftwareGuide}{OTB Software Guide}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\ossim}{\\href{http://www.ossim.org/}{OSSIM}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\application}[1]{\\emph{\#1}\\index{\#1}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\mmod}[1]{\\emph{\#1}\\index{\#1}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\phr}{\\href{http://smsc.cnes.fr/PLEIADES/index.htm}{Pleiades}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\jpg}{\\href{http://en.wikipedia.org/wiki/JPEG_2000}{Jpeg2000}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\montNew}{\\textbf{Monteverdi2}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\mont}{\\textbf{Monteverdi}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\app}{\\textbf{OTB\ Applications}\ }\n|' $texfile1
    sed -i -e '1s|^|\\newcommand{\\otb}{\\textbf{Orfeo\ Toolbox}\ }\n|' $texfile1

    rstfile=$rstdir/$texfile.rst
    echo "Converting $texfile1 ---> $rstfile"
    #convert using pandoc
    $pandoc $texfile1 -t rst -o $rstfile
    #cleanup .1 files
    rm -f $texfile1
done
