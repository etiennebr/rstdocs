Image to KMZ Export
^^^^^^^^^^^^^^^^^^^

Export the input image in a KMZ product.

Detailed description
--------------------

This application exports the input image in a kmz product that can be display in the Google Earth software. The user can set the size of the product size, a logo and a legend to the product. Furthemore, to obtain a product that fits the relief, a DEM can be used.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *KmzExport* .

.. [#] Table: Parameters table for Image to KMZ Export.

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output File name          |Output File name                  |
+-------------+--------------------------+----------------------------------+
|tilesize     |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|logo         |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|legend       |Input image               |Input image                       |
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

**Input image**
Input image.

**Output .kmz product**
Output Kmz product directory (with .kmz extension).

**Tile Size**
Size of the tiles in the kmz product, in number of pixels (default = 512).

**Image logo**
Path to the image logo to add to the KMZ product.

**Image legend**
Path to the image legend to add to the KMZ product.

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

	otbcli_KmzExport -in qb_RoadExtract2.tif -out otbKmzExport.kmz -logo otb_big.png

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the KmzExport application 
	KmzExport = otbApplication.Registry.CreateApplication("KmzExport")

	# The following lines set all the application parameters:
	KmzExport.SetParameterString("in", "qb_RoadExtract2.tif")

	KmzExport.SetParameterString("out", "otbKmzExport.kmz")

	KmzExport.SetParameterString("logo", "otb_big.png")

	# The following line execute the application
	KmzExport.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

None

Authors
~~~~~~~

This application has been written by OTB-Team.

See Also
~~~~~~~~

These additional ressources can be useful for further information: 

Conversion

