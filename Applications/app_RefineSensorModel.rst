Refine Sensor Model
^^^^^^^^^^^^^^^^^^^

Perform least-square fit of a sensor model to a set of tie points

Detailed description
--------------------

This application reads a geom file containing a sensor model and a text file containing a list of ground control point, and performs a least-square fit of the sensor model adjustable parameters to these tie points. It produces an updated geom file as output, as well as an optional ground control points based statistics file and a vector file containing residues. The output geom file can then be used to ortho-rectify the data more accurately. Plaease note that for a proper use of the application, elevation must be correctly set (including DEM and geoid file). The map parameters allows to choose a map projection in which the accuracy will be estimated in meters.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *RefineSensorModel* .

.. [#] Table: Parameters table for Refine Sensor Model.

+----------------+--------------------------+--------------------------------------------------+
|Parameter Key   |Parameter Type            |Parameter Description                             |
+================+==========================+==================================================+
|ingeom          |Input File name           |Input File name                                   |
+----------------+--------------------------+--------------------------------------------------+
|outgeom         |Output File name          |Output File name                                  |
+----------------+--------------------------+--------------------------------------------------+
|inpoints        |Input File name           |Input File name                                   |
+----------------+--------------------------+--------------------------------------------------+
|outstat         |Output File name          |Output File name                                  |
+----------------+--------------------------+--------------------------------------------------+
|outvector       |Output File name          |Output File name                                  |
+----------------+--------------------------+--------------------------------------------------+
|map             |Choices                   |Choices                                           |
+----------------+--------------------------+--------------------------------------------------+
|map utm         | *Choice*                 |Universal Trans-Mercator (UTM)                    |
+----------------+--------------------------+--------------------------------------------------+
|map lambert2    | *Choice*                 |Lambert II Etendu                                 |
+----------------+--------------------------+--------------------------------------------------+
|map lambert93   | *Choice*                 |Lambert93                                         |
+----------------+--------------------------+--------------------------------------------------+
|map wgs         | *Choice*                 |WGS 84                                            |
+----------------+--------------------------+--------------------------------------------------+
|map epsg        | *Choice*                 |EPSG Code                                         |
+----------------+--------------------------+--------------------------------------------------+
|map.utm.zone    |Int                       |Int                                               |
+----------------+--------------------------+--------------------------------------------------+
|map.utm.northhem|Boolean                   |Boolean                                           |
+----------------+--------------------------+--------------------------------------------------+
|map.epsg.code   |Int                       |Int                                               |
+----------------+--------------------------+--------------------------------------------------+
|elev            |Group                     |Group                                             |
+----------------+--------------------------+--------------------------------------------------+
|elev.dem        |Directory                 |Directory                                         |
+----------------+--------------------------+--------------------------------------------------+
|elev.geoid      |Input File name           |Input File name                                   |
+----------------+--------------------------+--------------------------------------------------+
|elev.default    |Float                     |Float                                             |
+----------------+--------------------------+--------------------------------------------------+
|inxml           |XML input parameters file |XML input parameters file                         |
+----------------+--------------------------+--------------------------------------------------+
|outxml          |XML output parameters file|XML output parameters file                        |
+----------------+--------------------------+--------------------------------------------------+

**Input geom file**
Geom file containing the sensor model to refine.

**Output geom file**
Geom file containing the refined sensor model.

**Input file containing tie points**
Input file containing tie points. Points are stored in following format: row col lon lat. Line beginning with # are ignored.

**Output file containing output precision statistics**
Output file containing the following info: ref_lon ref_lat elevation predicted_lon predicted_lat x_error_ref(meters) y_error_ref(meters) global_error_ref(meters) x_error(meters) y_error(meters) overall_error(meters).

**Output vector file with residues**
File containing segments representing residues.

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

	otbcli_RefineSensorModel -ingeom input.geom -outgeom output.geom -inpoints points.txt -map epsg -map.epsg.code 32631

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the RefineSensorModel application 
	RefineSensorModel = otbApplication.Registry.CreateApplication("RefineSensorModel")

	# The following lines set all the application parameters:
	RefineSensorModel.SetParameterString("ingeom", "input.geom")

	RefineSensorModel.SetParameterString("outgeom", "output.geom")

	RefineSensorModel.SetParameterString("inpoints", "points.txt")

	RefineSensorModel.SetParameterString("map","epsg")

	RefineSensorModel.SetParameterInt("map.epsg.code", 32631)

	# The following line execute the application
	RefineSensorModel.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

None

Authors
~~~~~~~

This application has been written by OTB-Team.

See Also
~~~~~~~~

These additional ressources can be useful for further information: 

OrthoRectification,HomologousPointsExtraction

