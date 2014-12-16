Compute Polyline Feature From Image
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This application compute for each studied polyline, contained in the input VectorData, the choosen descriptors.

Detailed description
--------------------

The first step in the classifier fusion based validation is to compute, for each studied polyline, the choosen descriptors. 

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *ComputePolylineFeatureFromImage* .

.. [#] Table: Parameters table for Compute Polyline Feature From Image.

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|vd           |Input vector data         |Input vector data                 |
+-------------+--------------------------+----------------------------------+
|elev         |Group                     |Group                             |
+-------------+--------------------------+----------------------------------+
|elev.dem     |Directory                 |Directory                         |
+-------------+--------------------------+----------------------------------+
|elev.geoid   |Input File name           |Input File name                   |
+-------------+--------------------------+----------------------------------+
|elev.default |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|expr         |String                    |String                            |
+-------------+--------------------------+----------------------------------+
|field        |String                    |String                            |
+-------------+--------------------------+----------------------------------+
|out          |Output vector data        |Output vector data                |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

**Input Image**
An image to compute the descriptors on.

**Vector Data**
Vector data containing the polylines where the features will be computed.

**Elevation management**
This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles.

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**Feature expression**
The feature formula (b1 < 0.3) where b1 is the standard name of input image first band.

**Feature name**
The field name corresponding to the feature codename (NONDVI, ROADSA...).

**Output Vector Data**
The output vector data containing polylines with a new field.

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_ComputePolylineFeatureFromImage -in NDVI.TIF -vd roads_ground_truth.shp -expr "(b1 > 0.4)" -field NONDVI -out PolylineFeatureFromImage_LI_NONDVI_gt.shp

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ComputePolylineFeatureFromImage application 
	ComputePolylineFeatureFromImage = otbApplication.Registry.CreateApplication("ComputePolylineFeatureFromImage")

	# The following lines set all the application parameters:
	ComputePolylineFeatureFromImage.SetParameterString("in", "NDVI.TIF")

	ComputePolylineFeatureFromImage.SetParameterString("vd", "roads_ground_truth.shp")

	ComputePolylineFeatureFromImage.SetParameterString("expr", "(b1 > 0.4)")

	ComputePolylineFeatureFromImage.SetParameterString("field", "NONDVI")

	ComputePolylineFeatureFromImage.SetParameterString("out", "PolylineFeatureFromImage_LI_NONDVI_gt.shp")

	# The following line execute the application
	ComputePolylineFeatureFromImage.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

Since it does not rely on streaming process, take care of the size of input image before launching application.

Authors
~~~~~~~

This application has been written by OTB-Team.

