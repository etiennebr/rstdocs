Cartographic to geographic coordinates conversion
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Convert cartographic coordinates to geographic one.

Detailed description
--------------------

This application computes the geographic coordinates from a cartographic one. User has to give the X and Y coordinate and the cartographic projection (UTM/LAMBERT/LAMBERT2/LAMBERT93/SINUS/ECKERT4/TRANSMERCATOR/MOLLWEID/SVY21).

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{ConvertCartoToGeoPoint_param_table}, page~\pageref{ConvertCartoToGeoPoint_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+ConvertCartoToGeoPoint+.

Parameters table for Cartographic to geographic coordinates conversion:

+--------------------+--------------------------+----------------------------------+
|Parameter Key       |Parameter Type            |Parameter Description             |
+====================+==========================+==================================+
|carto               |Group                     |Group                             |
+--------------------+--------------------------+----------------------------------+
|carto.x             |Float                     |Float                             |
+--------------------+--------------------------+----------------------------------+
|carto.y             |Float                     |Float                             |
+--------------------+--------------------------+----------------------------------+
|mapproj             |Choices                   |Choices                           |
+--------------------+--------------------------+----------------------------------+
|mapproj utm         | *Choice*                 |Universal Trans-Mercator (UTM)    |
+--------------------+--------------------------+----------------------------------+
|mapproj lambert2    | *Choice*                 |Lambert II Etendu                 |
+--------------------+--------------------------+----------------------------------+
|mapproj lambert93   | *Choice*                 |Lambert93                         |
+--------------------+--------------------------+----------------------------------+
|mapproj wgs         | *Choice*                 |WGS 84                            |
+--------------------+--------------------------+----------------------------------+
|mapproj epsg        | *Choice*                 |EPSG Code                         |
+--------------------+--------------------------+----------------------------------+
|mapproj.utm.zone    |Int                       |Int                               |
+--------------------+--------------------------+----------------------------------+
|mapproj.utm.northhem|Boolean                   |Boolean                           |
+--------------------+--------------------------+----------------------------------+
|mapproj.epsg.code   |Int                       |Int                               |
+--------------------+--------------------------+----------------------------------+
|long                |Float                     |Float                             |
+--------------------+--------------------------+----------------------------------+
|lat                 |Float                     |Float                             |
+--------------------+--------------------------+----------------------------------+
|inxml               |XML input parameters file |XML input parameters file         |
+--------------------+--------------------------+----------------------------------+
|outxml              |XML output parameters file|XML output parameters file        |
+--------------------+--------------------------+----------------------------------+

**Input cartographic coordinates**


- **X cartographic coordinates:** X cartographic coordinates in the specified projection.

- **Y cartographic coordinates:** Y cartographic coordinates in the specified projection.



**Output Cartographic Map Projection**
Parameters of the output map projection to be used. Available choices are: 

- **Universal Trans-Mercator (UTM)** : A system of transverse mercator projections dividing the surface of Earth between 80S and 84N latitude.

 - **Zone number** : The zone number ranges from 1 to 60 and allows to define the transverse mercator projection (along with the hemisphere)

 - **Northern Hemisphere** : The transverse mercator projections are defined by their zone number as well as the hemisphere. Activate this parameter if your image is in the northern hemisphere.

- **Lambert II Etendu** : This is a Lambert Conformal Conic projection mainly used in France.

- **Lambert93** : This is a Lambert 93 projection mainly used in France.

- **WGS 84** : This is a Geographical projection

- **EPSG Code** : This code is a generic way of identifying map projections, and allows to specify a large amount of them. See www.spatialreference.org to find which EPSG code is associated to your projection;

 - **EPSG Code** : See www.spatialreference.org to find which EPSG code is associated to your projection

**Output long**
Point longitude coordinates.

**Output lat**
Point latitude coordinates.

**Load otb application from xml file**
Load otb application from xml file

**Save otb application to xml file**
Save otb application to xml file

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_ConvertCartoToGeoPoint -carto.x 367074.625 -carto.y 4835740 -mapproj utm -mapproj.utm.northhem true -mapproj.utm.zone 31

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ConvertCartoToGeoPoint application 
	ConvertCartoToGeoPoint = otbApplication.Registry.CreateApplication("ConvertCartoToGeoPoint")

	# The following lines set all the application parameters:
	ConvertCartoToGeoPoint.SetParameterFloat("carto.x", 367074.625)

	ConvertCartoToGeoPoint.SetParameterFloat("carto.y", 4835740)

	ConvertCartoToGeoPoint.SetParameterString("mapproj","utm")

	ConvertCartoToGeoPoint.SetParameterString("mapproj.utm.northhem","1")

	ConvertCartoToGeoPoint.SetParameterInt("mapproj.utm.zone", 31)

	# The following line execute the application
	ConvertCartoToGeoPoint.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

