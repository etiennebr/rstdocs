Homologous Points Extraction
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Allows to compute homologous points between images using keypoints

Detailed description
--------------------

This application allows to compute homologous points between images using keypoints.  SIFT or SURF keypoints can be used and the band on which keypoints are computed can be set independantly for both images. The application offers two modes : the first is the full mode where keypoints are extracted from the full extent of both images (please note that in this mode large image file are not supported). The second mode, called geobins, allows to set-up spatial binning to get fewer points spread accross the entire image. In this mode, the corresponding spatial bin in the second image is estimated using geographical transform or sensor modelling, and is padded according to the user defined precision. Last, in both modes the application can filter matches whose colocalisation in first image exceed this precision. The elevation parameters are to deal more precisely with sensor modelling in case of sensor geometry data. The outvector option allows to create a vector file with segments corresponding to the localisation error between the matches. It can be useful to assess the precision of a registration for instance. The vector file is always reprojected to EPSG:4326 to allow display in a GIS. This is done via reprojection or by applying the image sensor models.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{HomologousPointsExtraction_param_table}, page~\pageref{HomologousPointsExtraction_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+HomologousPointsExtraction+.

Parameters table for Homologous Points Extraction:

+---------------------+--------------------------+---------------------------------------------------------------------------+
|Parameter Key        |Parameter Type            |Parameter Description                                                      |
+=====================+==========================+===========================================================================+
|in1                  |Input image               |Input image                                                                |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|band1                |Int                       |Int                                                                        |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|in2                  |Input image               |Input image                                                                |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|band2                |Int                       |Int                                                                        |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|algorithm            |Choices                   |Choices                                                                    |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|algorithm surf       | *Choice*                 |SURF algorithm                                                             |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|algorithm sift       | *Choice*                 |SIFT algorithm                                                             |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|threshold            |Float                     |Float                                                                      |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|backmatching         |Boolean                   |Boolean                                                                    |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|mode                 |Choices                   |Choices                                                                    |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|mode full            | *Choice*                 |Extract and match all keypoints (no streaming)                             |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|mode geobins         | *Choice*                 |Search keypoints in small spatial bins regularly spread accross first image|
+---------------------+--------------------------+---------------------------------------------------------------------------+
|mode.geobins.binsize |Int                       |Int                                                                        |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|mode.geobins.binsizey|Int                       |Int                                                                        |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|mode.geobins.binstep |Int                       |Int                                                                        |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|mode.geobins.binstepy|Int                       |Int                                                                        |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|mode.geobins.margin  |Int                       |Int                                                                        |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|precision            |Float                     |Float                                                                      |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|mfilter              |Boolean                   |Boolean                                                                    |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|2wgs84               |Boolean                   |Boolean                                                                    |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|elev                 |Group                     |Group                                                                      |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|elev.dem             |Directory                 |Directory                                                                  |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|elev.geoid           |Input File name           |Input File name                                                            |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|elev.default         |Float                     |Float                                                                      |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|out                  |Output File name          |Output File name                                                           |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|outvector            |Output File name          |Output File name                                                           |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|inxml                |XML input parameters file |XML input parameters file                                                  |
+---------------------+--------------------------+---------------------------------------------------------------------------+
|outxml               |XML output parameters file|XML output parameters file                                                 |
+---------------------+--------------------------+---------------------------------------------------------------------------+

**Input Image 1**
 First input image.

**Input band 1**
Index of the band from input image 1 to use for keypoints extraction.

**Input Image 2**
 Second input image.

**Input band 2**
Index of the band from input image 1 to use for keypoints extraction.

**Keypoints detection algorithm**
Choice of the detection algorithm to use. Available choices are: 

- **SURF algorithm**


- **SIFT algorithm**



**Distance threshold for matching**
The distance threshold for matching.

**Use back-matching to filter matches.**
If set to true, matches should be consistent in both ways.

**Keypoints search mode**
 Available choices are: 

- **Extract and match all keypoints (no streaming)** : Extract and match all keypoints, loading both images entirely into memory


- **Search keypoints in small spatial bins regularly spread accross first image** : This method allows to retrieve a set of tie points regulary spread accross image 1. Corresponding bins in image 2 are retrieved using sensor and geographical information if available. The first bin position takes into account the margin parameter. Bins are cropped to the largest image region shrinked by the margin parameter for both in1 and in2 images.


 - **Size of bin** : Radius of the spatial bin in pixels.

 - **Size of bin (y direction)** : Radius of the spatial bin in pixels (y direction). If not set, the mode.geobins.binsize value is used.

 - **Steps between bins** : Steps between bins in pixels.

 - **Steps between bins (y direction)** : Steps between bins in pixels (y direction). If not set, the mode.geobins.binstep value is used.

 - **Margin from image border to start/end bins (in pixels)** : Margin from image border to start/end bins (in pixels).



**Estimated precision of the colocalisation function (in pixels).**
Estimated precision of the colocalisation function in pixels.

**Filter points according to geographical or sensor based colocalisation**
If enabled, this option allows to filter matches according to colocalisation from sensor or geographical information, using the given tolerancy expressed in pixels.

**If enabled, points from second image will be exported in WGS84**


**Elevation management**
This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles.

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**Output file with tie points**
File containing the list of tie points.

**Output vector file with tie points**
File containing segments representing matches .

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_HomologousPointsExtraction -in1 sensor_stereo_left.tif -in2 sensor_stereo_right.tif -mode full -out homologous.txt

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the HomologousPointsExtraction application 
	HomologousPointsExtraction = otbApplication.Registry.CreateApplication("HomologousPointsExtraction")

	# The following lines set all the application parameters:
	HomologousPointsExtraction.SetParameterString("in1", "sensor_stereo_left.tif")

	HomologousPointsExtraction.SetParameterString("in2", "sensor_stereo_right.tif")

	HomologousPointsExtraction.SetParameterString("mode","full")

	HomologousPointsExtraction.SetParameterString("out", "homologous.txt")

	# The following line execute the application
	HomologousPointsExtraction.ExecuteAndWriteOutput()

Limitations
-----------

Full mode does not handle large images.

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

RefineSensorModel

