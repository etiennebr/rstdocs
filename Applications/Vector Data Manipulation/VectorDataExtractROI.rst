VectorData Extract ROI
^^^^^^^^^^^^^^^^^^^^^^

Perform an extract ROI on the input vector data according to the input image extent

Detailed description
--------------------

This application extracts the vector data features belonging to a region specified by the support image envelope. Any features intersecting the support region is copied to output. The output geometries are NOT cropped.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{VectorDataExtractROI_param_table}, page~\pageref{VectorDataExtractROI_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+VectorDataExtractROI+.

Parameters table for VectorData Extract ROI:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|io           |Group                     |Group                             |
+-------------+--------------------------+----------------------------------+
|io.vd        |Input vector data         |Input vector data                 |
+-------------+--------------------------+----------------------------------+
|io.in        |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|io.out       |Output vector data        |Output vector data                |
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

**Input and output data**
Group containing input and output parameters.

- **Input Vector data:** Input vector data.

- **Support image:** Support image that specifies the extracted region.

- **Output Vector data:** Output extracted vector data.



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

	otbcli_VectorDataExtractROI -io.in qb_RoadExtract.tif -io.vd qb_RoadExtract_classification.shp -io.out apTvUtVectorDataExtractROIApplicationTest.shp

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the VectorDataExtractROI application 
	VectorDataExtractROI = otbApplication.Registry.CreateApplication("VectorDataExtractROI")

	# The following lines set all the application parameters:
	VectorDataExtractROI.SetParameterString("io.in", "qb_RoadExtract.tif")

	VectorDataExtractROI.SetParameterString("io.vd", "qb_RoadExtract_classification.shp")

	VectorDataExtractROI.SetParameterString("io.out", "apTvUtVectorDataExtractROIApplicationTest.shp")

	# The following line execute the application
	VectorDataExtractROI.ExecuteAndWriteOutput()

:Limitations:

None

:Authors:

This application has been written by OTB-Team.

