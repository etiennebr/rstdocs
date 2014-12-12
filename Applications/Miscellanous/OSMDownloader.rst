Open Street Map layers importations applications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Generate a vector data from OSM on the input image extend

Detailed description
--------------------

Generate a vector data from Open Street Map data. A DEM could be use. By default, the entire layer is downloaded, an image can be use as support for the OSM data. The application can provide also available classes in layers . This application required an Internet access. Informations about the OSM project : http://www.openstreetmap.fr/

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{OSMDownloader_param_table}, page~\pageref{OSMDownloader_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+OSMDownloader+.

Parameters table for Open Street Map layers importations applications:

+-------------+--------------------------+---------------------------------------------+
|Parameter Key|Parameter Type            |Parameter Description                        |
+=============+==========================+=============================================+
|out          |Output vector data        |Output vector data                           |
+-------------+--------------------------+---------------------------------------------+
|support      |Input image               |Input image                                  |
+-------------+--------------------------+---------------------------------------------+
|key          |String                    |String                                       |
+-------------+--------------------------+---------------------------------------------+
|value        |String                    |String                                       |
+-------------+--------------------------+---------------------------------------------+
|elev         |Group                     |Group                                        |
+-------------+--------------------------+---------------------------------------------+
|elev.dem     |Directory                 |Directory                                    |
+-------------+--------------------------+---------------------------------------------+
|elev.geoid   |Input File name           |Input File name                              |
+-------------+--------------------------+---------------------------------------------+
|elev.default |Float                     |Float                                        |
+-------------+--------------------------+---------------------------------------------+
|printclasses |Boolean                   |Boolean                                      |
+-------------+--------------------------+---------------------------------------------+
|inxml        |XML input parameters file |XML input parameters file                    |
+-------------+--------------------------+---------------------------------------------+
|outxml       |XML output parameters file|XML output parameters file                   |
+-------------+--------------------------+---------------------------------------------+

**Output vector data**
Generated output vector data path

**Support image**
Image used as support to estimate the models

**OSM tag key**
OSM tag key to extract (highway, building...)

**OSM tag value**
OSM tag value to extract (motorway, footway...)

**Elevation management**
This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**option to display available key/value classes**
Print the key/value classes available for the bounding box of the input image 

  ** If not used : Note that the options OSMKey (-key) and Output (-out) become mandatory

**Load otb application from xml file**
Load otb application from xml file

**Save otb application to xml file**
Save otb application to xml file

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_OSMDownloader -support qb_RoadExtract.tif -key highway -out apTvUtOSMDownloader.shp

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the OSMDownloader application 
	OSMDownloader = otbApplication.Registry.CreateApplication("OSMDownloader")

	# The following lines set all the application parameters:
	OSMDownloader.SetParameterString("support", "qb_RoadExtract.tif")

	OSMDownloader.SetParameterString("key", "highway")

	OSMDownloader.SetParameterString("out", "apTvUtOSMDownloader.shp")

	# The following line execute the application
	OSMDownloader.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

`Convertion <http://www.readthedocs.org/Convertion.html>`_

