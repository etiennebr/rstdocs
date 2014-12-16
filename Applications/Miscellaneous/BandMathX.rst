Band Math X
^^^^^^^^^^^

This application performs mathematical operations on multiband images.
Mathematical formula interpretation is done via `muParserX library : <http://articles.beltoforion.de/article.php?a=muparserx>`_

Detailed description
--------------------

The goal of this documentation is to give the user some hints about the syntax used in this application.
The syntax is mainly constrained by the muparserx library, which can be considered as the core of the application.


- Fundamentals:

The default prefix name for variables related to the ith input is « im(i+1) » (note the indexing from 1 to N, for N inputs). 
The following list summaries the available variables for input #0 (and so on for every input): 

im1                                -->   a pixel from first input, made of n components (n bands)
im1bj                             -->   jth component of a pixel from first input (first band is indexed by 1)
im1bjNkxp                     -->   a neighbourhood (“N”) of pixels of the jth component from first input, of size kxp
im1PhyX and im1PhyY  -->   spacing of first input in X and Y directions (horizontal and vertical)
im1bjMean im1bjMin im1bjMax im1bjSum im1bjVar  -->   mean, min, max, sum, variance of jth band from first input (global statistics)

Moreover, we also have the following generic variables:
idxX and idxY        -->   indices of the current pixel

Always keep in mind that this application only addresses mathematically well-defined formulas.
For instance, it is not possible to add vectors of different dimensions (this implies the addition of a row vector with a column vector),
or add a scalar to a vector or a matrix, or divide two vectors, and so on...
Thus, it is important to remember that a pixel of n components is always represented as a row vector.

Example :

::

                   im1 + im2       (1)

represents the addition of pixels from first and second inputs. This expression is consistent only if
both inputs have the same number of bands.
Note that it is also possible to use the following expressions to obtain the same result:

::

                   im1b1 + im2b1 
                   im1b2 + im2b2       (2)

Nevertheless, the first expression is by far much pleaseant. We call this new functionnality the 'batch mode'
(performing the same operation in a band-to-band fashion).


- Operations involving neighborhoods of pixels:

Another new fonctionnality is the possibility to perform operations that involve neighborhoods of pixels.
Variable related to such neighborhoods are always defined following the pattern imIbJNKxP, where: 
- I is an number identifying the image input (remember, input #0 = im1, and so on)
- J is an number identifying the band (remember, first band is indexed by 1)
- KxP are two numbers that represent the size of the neighborhood (first one is related to the horizontal direction)
All neighborhood are centred, thus K and P must be odd numbers.
Many operators come with this new functionnality: dotpr, mean var median min max...
For instance, if im1 represents the pixel of 3 bands image:

::

               im1 - mean(im1b1N5x5,im1b2N5x5,im1b3N5x5)       (3)

could represent a high pass filter (Note that by implying three neighborhoods, the operator mean returns a row vector of three components.
It is a typical behaviour for many operators of this application).


- Operators:

In addition to the previous operators, other operators are available:
- existing operators/functions from muParserX, that were not originally defined for vectors and
matrices (for instance cos, sin, ...). These new operators/ functions keep the original names to which we added the prefix ”v” for vector (vcos, vsin, ...).
- mult, div and pow operators, that perform element-wise multiplication, division or exponentiation of vector/matrices (for instance im1 div im2)
- mlt, dv and pw operators, that perform multiplication, division or exponentiation of vector/matrices by a scalar (for instance im1 dv 2.0)
- bands, which is a very usefull operator. It allows to select specific bands from an image, and/or to rearrange them in a new vector;
for instance bands(im1,{1,2,1,1}) produces a vector of 4 components made of band 1, band 2, band 1 and band 1 values from the first input.
Note that curly brackets must be used in order to select the desired band indices. and so on.


- Application itself:

The application takes the following parameters :
- Setting the list of inputs can be done with the 'il' parameter.
- Setting expressions can be done with the 'exp' parameter (see also limitations section below).
- Setting constants can be done with the 'incontext' parameter. User must provide a txt file with a specific syntax: #type name value
An example of such a file is given below:

::

   #F expo 1.1
   #M kernel1 { 0.1 , 0.2 , 0.3; 0.4 , 0.5 , 0.6; 0.7 , 0.8 , 0.9; 1 , 1.1 , 1.2; 1.3 , 1.4 , 1.5 }

As we can see,  #I/#F allows the definition of an integer/float constant, whereas #M allows the definition of a vector/matrix.
In the latter case, elements of a row must be separated by commas, and rows must be separated by semicolons.
It is also possible to define expressions within the same txt file, with the pattern #E expr. For instance (two expressions; see also limitations section below):

::

   #E dotpr(kernel1,im1b1N3x5) ; im2b1^expo

- The 'outcontext' parameter allows to save user's constants and expressions (context).
- Setting the output image can be done with the 'out' parameter (multi-outputs is not implemented yet).


Finally, we strongly recommend that the reader takes a look at the cookbook, where additional information can be found (http://www.orfeo-toolbox.org/packages/OTBCookBook.pdf).


Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *BandMathX* .

.. [#] Table: Parameters table for Band Math X.

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|il           |Input image list          |Input image list                  |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|exp          |String                    |String                            |
+-------------+--------------------------+----------------------------------+
|incontext    |Input File name           |Input File name                   |
+-------------+--------------------------+----------------------------------+
|outcontext   |Output File name          |Output File name                  |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input image list:** Image list to perform computation on.

- **Output Image:** Output image.

- **Available RAM (Mb):** Available memory for processing (in MB).

- **Expressions:** Mathematical expression to apply.

- **Import context:** A txt file containing user's constants and expressions.

- **Export context:** A txt file where to save user's constants and expressions.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_BandMathX -il verySmallFSATSW_r.tif verySmallFSATSW_nir.tif verySmallFSATSW.tif -out apTvUtBandMathOutput.tif -exp "cos(im1b1)+im2b1*im3b1-im3b2+ndvi(im3b3, im3b4)"

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the BandMathX application 
	BandMathX = otbApplication.Registry.CreateApplication("BandMathX")

	# The following lines set all the application parameters:
	BandMathX.SetParameterStringList("il", ['verySmallFSATSW_r.tif', 'verySmallFSATSW_nir.tif', 'verySmallFSATSW.tif'])

	BandMathX.SetParameterString("out", "apTvUtBandMathOutput.tif")

	BandMathX.SetParameterString("exp", "cos(im1b1)+im2b1*im3b1-im3b2+ndvi(im3b3, im3b4)")

	# The following line execute the application
	BandMathX.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

The application is currently unable to produce one output image per expression, contrary to otbBandMathXImageFilter.
Separating expressions by semi-colons (;) will concatenate their results into a unique multiband output image.

Authors
~~~~~~~

This application has been written by OTB-Team.

