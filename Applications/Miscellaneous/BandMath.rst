Band Math
^^^^^^^^^

Perform a mathematical operation on monoband images

Detailed description
--------------------

This application performs a mathematical operation on monoband images. Mathematical formula interpretation is done via MuParser libraries http://muparser.sourceforge.net/.For MuParser version prior to v2 use 'and' and 'or' logical operators, and ternary operator 'if(; ; )'.For MuParser version superior to 2.0 uses '&&' and '||' logical operators, and C++ like ternary ifthenelse operator.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{BandMath_param_table}, page~\pageref{BandMath_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+BandMath+.

Parameters table for Band Math:

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
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input image list:** Image list to perform computation on.

- **Output Image:** Output image.

- **Available RAM (Mb):** Available memory for processing (in MB).

- **Expression:** The mathematical expression to apply.  Use im1b1 for the first band, im1b2 for the second one...

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_BandMath -il verySmallFSATSW_r.tif verySmallFSATSW_nir.tif verySmallFSATSW.tif -out apTvUtBandMathOutput.tif -exp "cos(im1b1)+im2b1*im3b1-im3b2+ndvi(im3b3, im3b4)"

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the BandMath application 
	BandMath = otbApplication.Registry.CreateApplication("BandMath")

	# The following lines set all the application parameters:
	BandMath.SetParameterStringList("il", ['verySmallFSATSW_r.tif', 'verySmallFSATSW_nir.tif', 'verySmallFSATSW.tif'])

	BandMath.SetParameterString("out", "apTvUtBandMathOutput.tif")

	BandMath.SetParameterString("exp", "cos(im1b1)+im2b1*im3b1-im3b2+ndvi(im3b3, im3b4)")

	# The following line execute the application
	BandMath.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

