Quick Look
^^^^^^^^^^

Generates a subsampled version of an image extract

Detailed description
--------------------

Generates a subsampled version of an extract of an image defined by ROIStart and ROISize. This extract is subsampled using the ratio OR the output image Size.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{Quicklook_param_table}, page~\pageref{Quicklook_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+Quicklook+.

Parameters table for Quick Look:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|cl           |List                      |List                              |
+-------------+--------------------------+----------------------------------+
|rox          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|roy          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|rsx          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|rsy          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|sr           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|sx           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|sy           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Image:** The image to read
- **Output Image:** The subsampled image
- **Channel List:** Selected channels
- **ROI Origin X:** first point of ROI in x-direction
- **ROI Origin Y:** first point of ROI in y-direction
- **ROI Size X:** size of ROI in x-direction
- **ROI Size Y:** size of ROI in y-direction
- **Sampling ratio:** Sampling Ratio, default is 2
- **Size X:** quicklook size in x-direction (used if no sampling ration is given)
- **Size Y:** quicklook size in y-direction (used if no sampling ration is given)
- **Load otb application from xml file:** Load otb application from xml file
- **Save otb application to xml file:** Save otb application to xml file


Example
-------

To run this example in command-line, use the following: 
::

	otbcli_Quicklook -in qb_RoadExtract.tif -out quicklookImage.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the Quicklook application 
	Quicklook = otbApplication.Registry.CreateApplication("Quicklook")

	# The following lines set all the application parameters:
	Quicklook.SetParameterString("in", "qb_RoadExtract.tif")

	Quicklook.SetParameterString("out", "quicklookImage.tif")

	# The following line execute the application
	Quicklook.ExecuteAndWriteOutput()

Limitations
-----------

This application does not provide yet the optimal way to decode coarser level of resolution from JPEG2000 images (like in Monteverdi).
Trying to subsampled huge JPEG200 image with the application will lead to poor performances for now.

Authors
-------

This application has been written by OTB-Team.

