Connected Component Segmentation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Connected component segmentation and object based image filtering of the input image according to user-defined criterions.

Detailed description
--------------------

This application allows to perform a masking, connected components segmentation and object based image filtering. First and optionally, a mask can be built based on user-defined criterions to select pixels of the image which will be segmented. Then a connected component segmentation is performed with a user defined criterion to decide whether two neighbouring pixels belong to the same segment or not. After this segmentation step, an object based image filtering is applied using another user-defined criterion reasoning on segment properties, like shape or radiometric attributes. Criterions are mathematical expressions analysed by the MuParser library (http://muparser.sourceforge.net/). For instance, expression "((b1>80) and intensity>95)" will merge two neighbouring pixel in a single segment if their intensity is more than 95 and their value in the first image band is more than 80. See parameters documentation for a list of available attributes. The output of the object based image filtering is vectorized and can be written in shapefile or KML format. If the input image is in raw geometry, resulting polygons will be transformed to WGS84 using sensor modelling before writing, to ensure consistency with GIS softwares. For this purpose, a Digital Elevation Model can be provided to the application. The whole processing is done on a per-tile basis for large images, so this application can handle images of arbitrary size.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *ConnectedComponentSegmentation* .

.. [#] Table: Parameters table for Connected Component Segmentation.

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output vector data        |Output vector data                |
+-------------+--------------------------+----------------------------------+
|mask         |String                    |String                            |
+-------------+--------------------------+----------------------------------+
|expr         |String                    |String                            |
+-------------+--------------------------+----------------------------------+
|minsize      |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|obia         |String                    |String                            |
+-------------+--------------------------+----------------------------------+
|elev         |Group                     |Group                             |
+-------------+--------------------------+----------------------------------+
|elev.dem     |Directory                 |Directory                         |
+-------------+--------------------------+----------------------------------+
|elev.geoid   |Input File name           |Input File name                   |
+-------------+--------------------------+----------------------------------+
|elev.default |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

**Input Image**
The image to segment.

**Output Shape**
The segmentation shape.

**Mask expression**
Mask mathematical expression (only if support image is given).

**Connected Component Expression**
Formula used for connected component segmentation.

**Minimum Object Size**
Min object size (area in pixel).

**OBIA Expression**
OBIA mathematical expression.

**Elevation management**
This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles.

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_ConnectedComponentSegmentation -in ROI_QB_MUL_4.tif -mask "((b1>80)*intensity>95)" -expr "distance<10" -minsize 15 -obia "SHAPE_Elongation>8" -out ConnectedComponentSegmentation.shp

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ConnectedComponentSegmentation application 
	ConnectedComponentSegmentation = otbApplication.Registry.CreateApplication("ConnectedComponentSegmentation")

	# The following lines set all the application parameters:
	ConnectedComponentSegmentation.SetParameterString("in", "ROI_QB_MUL_4.tif")

	ConnectedComponentSegmentation.SetParameterString("mask", "((b1>80)*intensity>95)")

	ConnectedComponentSegmentation.SetParameterString("expr", "distance<10")

	ConnectedComponentSegmentation.SetParameterInt("minsize", 15)

	ConnectedComponentSegmentation.SetParameterString("obia", "SHAPE_Elongation>8")

	ConnectedComponentSegmentation.SetParameterString("out", "ConnectedComponentSegmentation.shp")

	# The following line execute the application
	ConnectedComponentSegmentation.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

Due to the tiling scheme in case of large images, some segments can be arbitrarily split across multiple tiles.

Authors
~~~~~~~

This application has been written by OTB-Team.

