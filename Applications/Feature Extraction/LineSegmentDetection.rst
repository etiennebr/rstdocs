Line segment detection
^^^^^^^^^^^^^^^^^^^^^^

Detect line segments in raster

Detailed description
--------------------

This application detects locally straight contours in a image. It is based on Burns, Hanson, and Riseman method and use an a contrario validation approach (Desolneux, Moisan, and Morel). The algorithm was published by Rafael Gromponevon Gioi, Jérémie Jakubowicz, JeanMichel Morel and Gregory Randall. The given approach computes gradient and level lines of the image and detects aligned points in line support region. The application allows to export the detected lines in a vector data.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{LineSegmentDetection_param_table}, page~\pageref{LineSegmentDetection_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+LineSegmentDetection+.

Parameters table for Line segment detection:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output vector data        |Output vector data                |
+-------------+--------------------------+----------------------------------+
|elev         |Group                     |Group                             |
+-------------+--------------------------+----------------------------------+
|elev.dem     |Directory                 |Directory                         |
+-------------+--------------------------+----------------------------------+
|elev.geoid   |Input File name           |Input File name                   |
+-------------+--------------------------+----------------------------------+
|elev.default |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|norescale    |Boolean                   |Boolean                           |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

**Input Image**
 Input image on which lines will be detected.

**Output Detected lines**
 Output detected line segments (vector data).

**Elevation management**
This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles.

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**No rescaling in [0, 255]**
By default, the input image amplitude is rescaled between [0,255]. Turn on this parameter to skip rescaling.

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_LineSegmentDetection -in QB_Suburb.png -out LineSegmentDetection.shp

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the LineSegmentDetection application 
	LineSegmentDetection = otbApplication.Registry.CreateApplication("LineSegmentDetection")

	# The following lines set all the application parameters:
	LineSegmentDetection.SetParameterString("in", "QB_Suburb.png")

	LineSegmentDetection.SetParameterString("out", "LineSegmentDetection.shp")

	# The following line execute the application
	LineSegmentDetection.ExecuteAndWriteOutput()

:Limitations:

None

:Authors:

This application has been written by OTB-Team.

:See Also:

These additional ressources can be useful for further information: 

On Line demonstration of the LSD algorithm is available here: http://www.ipol.im/pub/algo/gjmr_line_segment_detector/

