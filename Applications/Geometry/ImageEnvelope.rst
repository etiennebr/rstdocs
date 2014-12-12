Image Envelope
^^^^^^^^^^^^^^

Extracts an image envelope.

Detailed description
--------------------

Build a vector data containing the polygon of the image envelope.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{ImageEnvelope_param_table}, page~\pageref{ImageEnvelope_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+ImageEnvelope+.

Parameters table for Image Envelope:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output vector data        |Output vector data                |
+-------------+--------------------------+----------------------------------+
|sr           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|elev         |Group                     |Group                             |
+-------------+--------------------------+----------------------------------+
|elev.dem     |Directory                 |Directory                         |
+-------------+--------------------------+----------------------------------+
|elev.geoid   |Input File name           |Input File name                   |
+-------------+--------------------------+----------------------------------+
|elev.default |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|proj         |String                    |String                            |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

**Input Image**
Input image.

**Output Vector Data**
Vector data file containing the envelope.

**Sampling Rate**
Sampling rate for image edges (in pixel).

**Elevation management**
This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles.

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**Projection**
Projection to be used to compute the envelope (default is WGS84).

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_ImageEnvelope -in QB_TOULOUSE_MUL_Extract_500_500.tif -out ImageEnvelope.shp

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ImageEnvelope application 
	ImageEnvelope = otbApplication.Registry.CreateApplication("ImageEnvelope")

	# The following lines set all the application parameters:
	ImageEnvelope.SetParameterString("in", "QB_TOULOUSE_MUL_Extract_500_500.tif")

	ImageEnvelope.SetParameterString("out", "ImageEnvelope.shp")

	# The following line execute the application
	ImageEnvelope.ExecuteAndWriteOutput()

:Limitations:

None

:Authors:

This application has been written by OTB-Team.

