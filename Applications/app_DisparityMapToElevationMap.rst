Disparity map to elevation map
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Projects a disparity map into a regular elevation map

Detailed description
--------------------

This application uses a disparity map computed from a stereo image pair to produce an elevation map on the ground area covered by the stereo pair. The needed inputs are : the disparity map, the stereo pair (in original geometry) and the epipolar deformation grids. These grids have to link the original geometry (stereo pair) and the epipolar geometry (disparity map). 

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *DisparityMapToElevationMap* .

.. [#] Table: Parameters table for Disparity map to elevation map.

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|io           |Group                     |Group                             |
+-------------+--------------------------+----------------------------------+
|io.in        |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|io.left      |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|io.right     |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|io.lgrid     |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|io.rgrid     |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|io.out       |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|io.mask      |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|step         |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|hmin         |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|hmax         |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|elev         |Group                     |Group                             |
+-------------+--------------------------+----------------------------------+
|elev.dem     |Directory                 |Directory                         |
+-------------+--------------------------+----------------------------------+
|elev.geoid   |Input File name           |Input File name                   |
+-------------+--------------------------+----------------------------------+
|elev.default |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

**Input and output data**
This group of parameters allows to set the input and output images and grids.

- **Input disparity map:** The input disparity map (horizontal disparity in first band, vertical in second).

- **Left sensor image:** Left image in original (sensor) geometry.

- **Right sensor image:** Right image in original (sensor) geometry.

- **Left Grid:** Left epipolar grid (deformation grid between sensor et disparity spaces).

- **Right Grid:** Right epipolar grid (deformation grid between sensor et disparity spaces).

- **Output elevation map:** Output elevation map in ground projection.

- **Disparity mask:** Masked disparity cells won't be projected.



**DEM step**
Spacing of the output elevation map (in meters).

**Minimum elevation expected**
Minimum elevation expected (in meters).

**Maximum elevation expected**
Maximum elevation expected (in meters).

**Elevation management**
This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles.

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**Available RAM (Mb)**
Available memory for processing (in MB).

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_DisparityMapToElevationMap -io.in disparity.tif -io.left sensor_left.tif -io.right sensor_right.tif -io.lgrid grid_epi_left.tif -io.rgrid grid_epi_right.tif -io.out dem.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the DisparityMapToElevationMap application 
	DisparityMapToElevationMap = otbApplication.Registry.CreateApplication("DisparityMapToElevationMap")

	# The following lines set all the application parameters:
	DisparityMapToElevationMap.SetParameterString("io.in", "disparity.tif")

	DisparityMapToElevationMap.SetParameterString("io.left", "sensor_left.tif")

	DisparityMapToElevationMap.SetParameterString("io.right", "sensor_right.tif")

	DisparityMapToElevationMap.SetParameterString("io.lgrid", "grid_epi_left.tif")

	DisparityMapToElevationMap.SetParameterString("io.rgrid", "grid_epi_right.tif")

	DisparityMapToElevationMap.SetParameterString("io.out", "dem.tif")

	# The following line execute the application
	DisparityMapToElevationMap.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

None

Authors
~~~~~~~

This application has been written by OTB-Team.

See Also
~~~~~~~~

These additional ressources can be useful for further information: 

otbStereoRectificationGridGenerator otbBlockMatching

