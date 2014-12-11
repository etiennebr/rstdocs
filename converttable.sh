#!/bin/sh
/usr/bin/latexml table.tex  -out table.xml
/usr/bin/latexmlpost --format=html --destination=table.html table.xml
/usr/bin/pandoc table.html -t rst -o table.rst
/bin/rm -f table.xml table.html table.tex

####echo "\documentclass{article}\begin{document}\end{document}" > table.tex
