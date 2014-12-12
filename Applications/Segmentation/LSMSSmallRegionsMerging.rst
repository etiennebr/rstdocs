Exact Large-Scale Mean-Shift segmentation, step 3 (optional)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Third (optional) step of the exact Large-Scale Mean-Shift segmentation workflow.

Detailed description
--------------------

This application performs the third step of the exact LargeScale MeanShift segmentation workflow (LSMS). Given a segmentation result (label image) and the original image, it will merge regions whose size in pixels is lower than minsize parameter with the adjacent regions with the adjacent region with closest radiometry and acceptable size. Small regions will be processed by size: first all regions of area, which is equal to 1 pixel will be merged with adjacent region, then all regions of area equal to 2 pixels, until regions of area minsize. For large images one can use the nbtilesx and nbtilesy parameters for tilewise processing, with the guarantees of identical results.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{LSMSSmallRegionsMerging_param_table}, page~\pageref{LSMSSmallRegionsMerging_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+LSMSSmallRegionsMerging+.

Parameters table for Exact Large-Scale Mean-Shift segmentation, step 3 (optional):

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|inseg        |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|minsize      |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|tilesizex    |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|tilesizey    |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input image:** The input image.

- **Segmented image:**  The segmented image input. Segmented image input is the segmentation of the input image.

- **Output Image:** The output image. The output image is the input image where the minimal regions have been merged.

- **Minimum Region Size:** Minimum Region Size. If, after the segmentation, a region is of size lower than this criterion, the region is merged with the "nearest" region (radiometrically).

- **Size of tiles in pixel (X-axis):** Size of tiles along the X-axis.

- **Size of tiles in pixel (Y-axis):** Size of tiles along the Y-axis.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_LSMSSmallRegionsMerging -in smooth.tif -inseg segmentation.tif -out merged.tif -minsize 20 -tilesizex 256 -tilesizey 256

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the LSMSSmallRegionsMerging application 
	LSMSSmallRegionsMerging = otbApplication.Registry.CreateApplication("LSMSSmallRegionsMerging")

	# The following lines set all the application parameters:
	LSMSSmallRegionsMerging.SetParameterString("in", "smooth.tif")

	LSMSSmallRegionsMerging.SetParameterString("inseg", "segmentation.tif")

	LSMSSmallRegionsMerging.SetParameterString("out", "merged.tif")

	LSMSSmallRegionsMerging.SetParameterInt("minsize", 20)

	LSMSSmallRegionsMerging.SetParameterInt("tilesizex", 256)

	LSMSSmallRegionsMerging.SetParameterInt("tilesizey", 256)

	# The following line execute the application
	LSMSSmallRegionsMerging.ExecuteAndWriteOutput()

Limitations
-----------

This application is part of the Large-Scale Mean-Shift segmentation workflow (LSMS) and may not be suited for any other purpose.

Authors
-------

This application has been written by David Youssefi.

See Also
--------

These additional ressources can be useful for further information: 

LSMSSegmentation, LSMSVectorization, MeanShiftSmoothing

