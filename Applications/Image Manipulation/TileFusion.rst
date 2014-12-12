Image Tile Fusion
^^^^^^^^^^^^^^^^^

Fusion of an image made of several tile files.

Detailed description
--------------------

Concatenate several tile files into a single image file.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{TileFusion_param_table}, page~\pageref{TileFusion_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+TileFusion+.

Parameters table for Image Tile Fusion:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|il           |Input image list          |Input image list                  |
+-------------+--------------------------+----------------------------------+
|cols         |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|rows         |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Tile Images:** Input tiles to concatenate (in lexicographic order : (0,0) (1,0) (0,1) (1,1)).
- **Number of tile columns:** Number of columns in the tile array
- **Number of tile rows:** Number of rows in the tile array
- **Output Image:** Output entire image
- **Load otb application from xml file:** Load otb application from xml file
- **Save otb application to xml file:** Save otb application to xml file


Example
-------

To run this example in command-line, use the following: 
::

	otbcli_TileFusion -il Scene_R1C1.tif Scene_R1C2.tif Scene_R2C1.tif Scene_R2C2.tif -cols 2 -rows 2 -out EntireImage.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the TileFusion application 
	TileFusion = otbApplication.Registry.CreateApplication("TileFusion")

	# The following lines set all the application parameters:
	TileFusion.SetParameterStringList("il", ['Scene_R1C1.tif', 'Scene_R1C2.tif', 'Scene_R2C1.tif', 'Scene_R2C2.tif'])

	TileFusion.SetParameterInt("cols", 2)

	TileFusion.SetParameterInt("rows", 2)

	TileFusion.SetParameterString("out", "EntireImage.tif")

	# The following line execute the application
	TileFusion.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

