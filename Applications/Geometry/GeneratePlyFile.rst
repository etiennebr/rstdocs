Ply 3D files generation
^^^^^^^^^^^^^^^^^^^^^^^

Generate a 3D Ply file from a DEM and a color image.

Detailed description
--------------------

Generate a 3D Ply file from a DEM and a color image.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{GeneratePlyFile_param_table}, page~\pageref{GeneratePlyFile_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+GeneratePlyFile+.

Parameters table for Ply 3D files generation:

+----------------+--------------------------+----------------------------------+
|Parameter Key   |Parameter Type            |Parameter Description             |
+================+==========================+==================================+
|indem           |Input image               |Input image                       |
+----------------+--------------------------+----------------------------------+
|mode            |Choices                   |Choices                           |
+----------------+--------------------------+----------------------------------+
|mode dem        | *Choice*                 |DEM                               |
+----------------+--------------------------+----------------------------------+
|mode 3dgrid     | *Choice*                 |3D grid                           |
+----------------+--------------------------+----------------------------------+
|map             |Choices                   |Choices                           |
+----------------+--------------------------+----------------------------------+
|map utm         | *Choice*                 |Universal Trans-Mercator (UTM)    |
+----------------+--------------------------+----------------------------------+
|map lambert2    | *Choice*                 |Lambert II Etendu                 |
+----------------+--------------------------+----------------------------------+
|map lambert93   | *Choice*                 |Lambert93                         |
+----------------+--------------------------+----------------------------------+
|map wgs         | *Choice*                 |WGS 84                            |
+----------------+--------------------------+----------------------------------+
|map epsg        | *Choice*                 |EPSG Code                         |
+----------------+--------------------------+----------------------------------+
|map.utm.zone    |Int                       |Int                               |
+----------------+--------------------------+----------------------------------+
|map.utm.northhem|Boolean                   |Boolean                           |
+----------------+--------------------------+----------------------------------+
|map.epsg.code   |Int                       |Int                               |
+----------------+--------------------------+----------------------------------+
|incolor         |Input image               |Input image                       |
+----------------+--------------------------+----------------------------------+
|out             |Output File name          |Output File name                  |
+----------------+--------------------------+----------------------------------+
|inxml           |XML input parameters file |XML input parameters file         |
+----------------+--------------------------+----------------------------------+
|outxml          |XML output parameters file|XML output parameters file        |
+----------------+--------------------------+----------------------------------+

**The input DEM**
The input DEM.

**Conversion Mode**
 Available choices are: 

- **DEM** : DEM conversion mode

- **3D grid** : 3D grid conversion mode


**Output Cartographic Map Projection**
Parameters of the output map projection to be used. Available choices are: 

- **Universal Trans-Mercator (UTM)** : A system of transverse mercator projections dividing the surface of Earth between 80S and 84N latitude.

 - **Zone number** : The zone number ranges from 1 to 60 and allows to define the transverse mercator projection (along with the hemisphere).

 - **Northern Hemisphere** : The transverse mercator projections are defined by their zone number as well as the hemisphere. Activate this parameter if your image is in the northern hemisphere.


- **Lambert II Etendu** : This is a Lambert Conformal Conic projection mainly used in France.

- **Lambert93** : This is a Lambert 93 projection mainly used in France.

- **WGS 84** : This is a Geographical projection

- **EPSG Code** : This code is a generic way of identifying map projections, and allows to specify a large amount of them. See www.spatialreference.org to find which EPSG code is associated to your projection;

 - **EPSG Code** : See www.spatialreference.org to find which EPSG code is associated to your projection.



**The input color image**
The input color image.

**The output Ply file**
The output Ply file.

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_GeneratePlyFile -indem image_dem.tif -out out.ply -incolor image_color.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the GeneratePlyFile application 
	GeneratePlyFile = otbApplication.Registry.CreateApplication("GeneratePlyFile")

	# The following lines set all the application parameters:
	GeneratePlyFile.SetParameterString("indem", "image_dem.tif")

	GeneratePlyFile.SetParameterString("out", "out.ply")

	GeneratePlyFile.SetParameterString("incolor", "image_color.tif")

	# The following line execute the application
	GeneratePlyFile.ExecuteAndWriteOutput()

Authors
-------

This application has been written by OTB-Team.

