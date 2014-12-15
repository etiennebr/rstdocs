Split Image
^^^^^^^^^^^

Split a N multiband image into N images

Detailed description
--------------------

This application splits a N-bands image into N mono-band images. The output images filename will be generated from the output parameter. Thus if the input image has 2 channels, and the user has set an output outimage.tif, the generated images will be outimage_0.tif and outimage_1.tif

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{SplitImage_param_table}, page~\pageref{SplitImage_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+SplitImage+.

Parameters table for Split Image:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Image:** Input multiband image filename.

- **Output Image:** Output filename that will be used to get the prefix and the extension of the output images to write.

- **Available RAM (Mb):** Available memory for processing (in MB).

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_SplitImage -in VegetationIndex.hd -out splittedImage.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the SplitImage application 
	SplitImage = otbApplication.Registry.CreateApplication("SplitImage")

	# The following lines set all the application parameters:
	SplitImage.SetParameterString("in", "VegetationIndex.hd")

	SplitImage.SetParameterString("out", "splittedImage.tif")

	# The following line execute the application
	SplitImage.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

