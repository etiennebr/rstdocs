Vector Data reprojection
^^^^^^^^^^^^^^^^^^^^^^^^

This application allows to reproject a vector data using support image projection reference, or a user specified map projection

Detailed description
--------------------

 This application allows to reproject a vector data using support image projection reference, or a user given map projection. If given, image keywordlist can be added to reprojected vectordata.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{VectorDataReprojection_param_table}, page~\pageref{VectorDataReprojection_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+VectorDataReprojection+.

Parameters table for Vector Data reprojection:

+------------------------------+--------------------------+----------------------------------+
|Parameter Key                 |Parameter Type            |Parameter Description             |
+==============================+==========================+==================================+
|in                            |Group                     |Group                             |
+------------------------------+--------------------------+----------------------------------+
|in.vd                         |Input File name           |Input File name                   |
+------------------------------+--------------------------+----------------------------------+
|in.kwl                        |Input image               |Input image                       |
+------------------------------+--------------------------+----------------------------------+
|out                           |Group                     |Group                             |
+------------------------------+--------------------------+----------------------------------+
|out.vd                        |Output File name          |Output File name                  |
+------------------------------+--------------------------+----------------------------------+
|out.proj                      |Choices                   |Choices                           |
+------------------------------+--------------------------+----------------------------------+
|out.proj image                | *Choice*                 |Use image projection ref          |
+------------------------------+--------------------------+----------------------------------+
|out.proj user                 | *Choice*                 |User defined projection           |
+------------------------------+--------------------------+----------------------------------+
|out.proj.image.in             |Input image               |Input image                       |
+------------------------------+--------------------------+----------------------------------+
|out.proj.user.map             |Choices                   |Choices                           |
+------------------------------+--------------------------+----------------------------------+
|out.proj.user.map utm         | *Choice*                 |Universal Trans-Mercator (UTM)    |
+------------------------------+--------------------------+----------------------------------+
|out.proj.user.map lambert2    | *Choice*                 |Lambert II Etendu                 |
+------------------------------+--------------------------+----------------------------------+
|out.proj.user.map lambert93   | *Choice*                 |Lambert93                         |
+------------------------------+--------------------------+----------------------------------+
|out.proj.user.map wgs         | *Choice*                 |WGS 84                            |
+------------------------------+--------------------------+----------------------------------+
|out.proj.user.map epsg        | *Choice*                 |EPSG Code                         |
+------------------------------+--------------------------+----------------------------------+
|out.proj.user.map.utm.zone    |Int                       |Int                               |
+------------------------------+--------------------------+----------------------------------+
|out.proj.user.map.utm.northhem|Boolean                   |Boolean                           |
+------------------------------+--------------------------+----------------------------------+
|out.proj.user.map.epsg.code   |Int                       |Int                               |
+------------------------------+--------------------------+----------------------------------+
|elev                          |Group                     |Group                             |
+------------------------------+--------------------------+----------------------------------+
|elev.dem                      |Directory                 |Directory                         |
+------------------------------+--------------------------+----------------------------------+
|elev.geoid                    |Input File name           |Input File name                   |
+------------------------------+--------------------------+----------------------------------+
|elev.default                  |Float                     |Float                             |
+------------------------------+--------------------------+----------------------------------+
|inxml                         |XML input parameters file |XML input parameters file         |
+------------------------------+--------------------------+----------------------------------+
|outxml                        |XML output parameters file|XML output parameters file        |
+------------------------------+--------------------------+----------------------------------+

**Input data**


- **Input vector data:** The input vector data to reproject

- **Use image keywords list:** Optional input image to fill vector data with image kwl.



**Output data**


- **Output vector data:** The reprojected vector data

- **Output Projection choice:** 

 Available choices are: 

- **Use image projection ref** : Vector data will be reprojected in image projection ref.

 - **Image used to get projection map** : Projection map will be found using image metadata

- **User defined projection**

 - **Output Cartographic Map Projection** : Parameters of the output map projection to be used.

 - **Zone number** : The zone number ranges from 1 to 60 and allows to define the transverse mercator projection (along with the hemisphere)

 - **Northern Hemisphere** : The transverse mercator projections are defined by their zone number as well as the hemisphere. Activate this parameter if your image is in the northern hemisphere.

 - **EPSG Code** : See www.spatialreference.org to find which EPSG code is associated to your projection


**Elevation management**
This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**Load otb application from xml file**
Load otb application from xml file

**Save otb application to xml file**
Save otb application to xml file

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_VectorDataReprojection -in.vd VectorData_QB1.shp -out.proj image -out.proj.image.in ROI_QB_MUL_1.tif -out.vd reprojected_vd.shp

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the VectorDataReprojection application 
	VectorDataReprojection = otbApplication.Registry.CreateApplication("VectorDataReprojection")

	# The following lines set all the application parameters:
	VectorDataReprojection.SetParameterString("in.vd", "VectorData_QB1.shp")

	VectorDataReprojection.SetParameterString("out.proj","image")

	VectorDataReprojection.SetParameterString("out.proj.image.in", "ROI_QB_MUL_1.tif")

	VectorDataReprojection.SetParameterString("out.vd", "reprojected_vd.shp")

	# The following line execute the application
	VectorDataReprojection.ExecuteAndWriteOutput()

Authors
-------

This application has been written by OTB-Team.

