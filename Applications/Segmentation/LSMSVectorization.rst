Exact Large-Scale Mean-Shift segmentation, step 4
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Fourth step of the exact Large-Scale Mean-Shift segmentation workflow.

Detailed description
--------------------

This application performs the fourth step of the exact LargeScale MeanShift segmentation workflow (LSMS). Given a segmentation result (label image), that may have been processed for small regions merging or not, it will convert it to a GIS vector file containing one polygon per segment. Each polygon contains additional fields: mean and variance of each channels from input image (in parameter), segmentation image label, number of pixels in the polygon. For large images one can use the nbtilesx and nbtilesy parameters for tilewise processing, with the guarantees of identical results.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{LSMSVectorization_param_table}, page~\pageref{LSMSVectorization_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+LSMSVectorization+.

Parameters table for Exact Large-Scale Mean-Shift segmentation, step 4:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|inseg        |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output File name          |Output File name                  |
+-------------+--------------------------+----------------------------------+
|tilesizex    |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|tilesizey    |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Image:** The input image.

- **Segmented image:**  The segmented image input. Segmented image input is the segmentation of the input image.

- **Output GIS vector file:** The output GIS vector file, representing the vectorized version of the segmented image where the features of the polygons are the radiometric means and variances.

- **Size of tiles in pixel (X-axis):** Size of tiles along the X-axis.

- **Size of tiles in pixel (Y-axis):** Size of tiles along the Y-axis.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_LSMSVectorization -in avions.tif -inseg merged.tif -out vector.shp -tilesizex 256 -tilesizey 256

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the LSMSVectorization application 
	LSMSVectorization = otbApplication.Registry.CreateApplication("LSMSVectorization")

	# The following lines set all the application parameters:
	LSMSVectorization.SetParameterString("in", "avions.tif")

	LSMSVectorization.SetParameterString("inseg", "merged.tif")

	LSMSVectorization.SetParameterString("out", "vector.shp")

	LSMSVectorization.SetParameterInt("tilesizex", 256)

	LSMSVectorization.SetParameterInt("tilesizey", 256)

	# The following line execute the application
	LSMSVectorization.ExecuteAndWriteOutput()

:Limitations:

This application is part of the Large-Scale Mean-Shift segmentation workflow (LSMS) and may not be suited for any other purpose.

:Authors:

This application has been written by David Youssefi.

:See Also:

These additional ressources can be useful for further information: 

MeanShiftSmoothing, LSMSSegmentation, LSMSSmallRegionsMerging

