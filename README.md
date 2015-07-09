rstdocs
=======

RST docs for Orfeo Toolbox CookBook

This file is renamed to README.md even though the syntax is rst and not markdown. The motive is to prevent it from including in the Cookbook

Introduction
============

This is an alternative/replacement of current OTB Cookbook which is written in Latex. This version is completely deviate from existing Latex format to reStructured format (rst).
Home page of rst says, reStructuredText is an easy-to-read, what-you-see-is-what-you-get plaintext markup syntax and parser system. Indeed, every bit is true from our experience.
You can find more about rst, and its syntax from here http://docutils.sourceforge.net/rst.html. Using sphinx build tools, rst can be converted to formats including but not limited to html, pdf, latex!.

Converting existing latex to rst is not that straightforward. All rst files for OTB applications are generated using python script otbGenerateWrappersRstDoc.py.
For others in recipes, we used a tool called pandoc to get an inital rst and then edited out errors manually. You do not have to generate them again. 


HowTo generate OTB CookBook in RST
==================================

1. cd $HOME
   
2. clone this repository
   git clone http://github.com/rashadkm/rstdocs
   
3. Go to rstdocs directory
   cd rstdocs

4. install sphinx-quickstart to configure and build rst docs.
   1. you can install it via pip
      - pip install sphinx
   2. use your favourite package manager
      
5. run sphinx-quickstart

   sphinx-quickstart

   This is an interactive configuration tool. prefer all default options expect listed below.
   > Project name: OTBCookBook
   > Author name(s): OTB-Team
   > Please enter a new file name, or rename the existing file and press Enter [index]: index2
   > mathjax: include math, rendered in the browser by MathJax (y/n) [n]: y
   > viewcode: include links to the source code of documented Python objects (y/n) [n]: y

Re-create/update rst docs for OTB applications
==============================================

NOTE: you can easily update these files manually. Do not try to generate these files again unless,

1. if you have major change in application documentation which is currently updated in the sources.
   
2. If you really want to do so

1. python otbGenerateWrappersRstDoc.py

   4.1 If you get below error:
   
   Traceback (most recent call last):
   File "otbGenerateWrappersRstDoc.py", line 2, in <module>
   import otbApplication
   ImportError: No module named otbApplication

   please add path to otbApplication.py to your PYTHONPATH and relauch python scirpt
   export PYTHONPATH=$PYTHONPATH:$HOME/install/OTB/
   python otbGenerateWrappersRstDoc.py
    
 
