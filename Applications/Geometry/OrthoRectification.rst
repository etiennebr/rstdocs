Ortho-rectification
^^^^^^^^^^^^^^^^^^^

This application allows to ortho-rectify optical images from supported sensors.

Detailed description
--------------------

An inverse sensor model is built from the input image metadata to convert geographical to raw geometry coordinates. This inverse sensor model is then combined with the chosen map projection to build a global coordinate mapping grid. Last, this grid is used to resample using the chosen interpolation algorithm. A Digital Elevation Model can be specified to account for terrain deformations. In case of SPOT5 images, the sensor model can be approximated by an RPC model in order to speedup computation.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{OrthoRectification_param_table}, page~\pageref{OrthoRectification_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+OrthoRectification+.

Parameters table for Ortho-rectification:

+------------------------+--------------------------+----------------------------------------------+
|Parameter Key           |Parameter Type            |Parameter Description                         |
+========================+==========================+==============================================+
|io                      |Group                     |Group                                         |
+------------------------+--------------------------+----------------------------------------------+
|io.in                   |Input image               |Input image                                   |
+------------------------+--------------------------+----------------------------------------------+
|io.out                  |Output image              |Output image                                  |
+------------------------+--------------------------+----------------------------------------------+
|map                     |Choices                   |Choices                                       |
+------------------------+--------------------------+----------------------------------------------+
|map utm                 | *Choice*                 |Universal Trans-Mercator (UTM)                |
+------------------------+--------------------------+----------------------------------------------+
|map lambert2            | *Choice*                 |Lambert II Etendu                             |
+------------------------+--------------------------+----------------------------------------------+
|map lambert93           | *Choice*                 |Lambert93                                     |
+------------------------+--------------------------+----------------------------------------------+
|map wgs                 | *Choice*                 |WGS 84                                        |
+------------------------+--------------------------+----------------------------------------------+
|map epsg                | *Choice*                 |EPSG Code                                     |
+------------------------+--------------------------+----------------------------------------------+
|map.utm.zone            |Int                       |Int                                           |
+------------------------+--------------------------+----------------------------------------------+
|map.utm.northhem        |Boolean                   |Boolean                                       |
+------------------------+--------------------------+----------------------------------------------+
|map.epsg.code           |Int                       |Int                                           |
+------------------------+--------------------------+----------------------------------------------+
|outputs                 |Group                     |Group                                         |
+------------------------+--------------------------+----------------------------------------------+
|outputs.mode            |Choices                   |Choices                                       |
+------------------------+--------------------------+----------------------------------------------+
|outputs.mode auto       | *Choice*                 |User Defined                                  |
+------------------------+--------------------------+----------------------------------------------+
|outputs.mode autosize   | *Choice*                 |Automatic Size from Spacing                   |
+------------------------+--------------------------+----------------------------------------------+
|outputs.mode autospacing| *Choice*                 |Automatic Spacing from Size                   |
+------------------------+--------------------------+----------------------------------------------+
|outputs.mode outputroi  | *Choice*                 |Automatic Size from Spacing and output corners|
+------------------------+--------------------------+----------------------------------------------+
|outputs.mode orthofit   | *Choice*                 |Fit to ortho                                  |
+------------------------+--------------------------+----------------------------------------------+
|outputs.ulx             |Float                     |Float                                         |
+------------------------+--------------------------+----------------------------------------------+
|outputs.uly             |Float                     |Float                                         |
+------------------------+--------------------------+----------------------------------------------+
|outputs.sizex           |Int                       |Int                                           |
+------------------------+--------------------------+----------------------------------------------+
|outputs.sizey           |Int                       |Int                                           |
+------------------------+--------------------------+----------------------------------------------+
|outputs.spacingx        |Float                     |Float                                         |
+------------------------+--------------------------+----------------------------------------------+
|outputs.spacingy        |Float                     |Float                                         |
+------------------------+--------------------------+----------------------------------------------+
|outputs.lrx             |Float                     |Float                                         |
+------------------------+--------------------------+----------------------------------------------+
|outputs.lry             |Float                     |Float                                         |
+------------------------+--------------------------+----------------------------------------------+
|outputs.ortho           |Input image               |Input image                                   |
+------------------------+--------------------------+----------------------------------------------+
|outputs.isotropic       |Boolean                   |Boolean                                       |
+------------------------+--------------------------+----------------------------------------------+
|outputs.default         |Float                     |Float                                         |
+------------------------+--------------------------+----------------------------------------------+
|elev                    |Group                     |Group                                         |
+------------------------+--------------------------+----------------------------------------------+
|elev.dem                |Directory                 |Directory                                     |
+------------------------+--------------------------+----------------------------------------------+
|elev.geoid              |Input File name           |Input File name                               |
+------------------------+--------------------------+----------------------------------------------+
|elev.default            |Float                     |Float                                         |
+------------------------+--------------------------+----------------------------------------------+
|interpolator            |Choices                   |Choices                                       |
+------------------------+--------------------------+----------------------------------------------+
|interpolator bco        | *Choice*                 |Bicubic interpolation                         |
+------------------------+--------------------------+----------------------------------------------+
|interpolator nn         | *Choice*                 |Nearest Neighbor interpolation                |
+------------------------+--------------------------+----------------------------------------------+
|interpolator linear     | *Choice*                 |Linear interpolation                          |
+------------------------+--------------------------+----------------------------------------------+
|interpolator.bco.radius |Int                       |Int                                           |
+------------------------+--------------------------+----------------------------------------------+
|opt                     |Group                     |Group                                         |
+------------------------+--------------------------+----------------------------------------------+
|opt.rpc                 |Int                       |Int                                           |
+------------------------+--------------------------+----------------------------------------------+
|opt.ram                 |Int                       |Int                                           |
+------------------------+--------------------------+----------------------------------------------+
|opt.gridspacing         |Float                     |Float                                         |
+------------------------+--------------------------+----------------------------------------------+
|inxml                   |XML input parameters file |XML input parameters file                     |
+------------------------+--------------------------+----------------------------------------------+
|outxml                  |XML output parameters file|XML output parameters file                    |
+------------------------+--------------------------+----------------------------------------------+

**Input and output data**
This group of parameters allows to set the input and output images.

- **Input Image:** The input image to ortho-rectify

- **Output Image:** The ortho-rectified output image



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

**Output Image Grid**
This group of parameters allows to define the grid on which the input image will be resampled.

- **Parameters estimation modes:** 

 Available choices are: 

- **User Defined** : This mode allows you to fully modify default values.

- **Automatic Size from Spacing** : This mode allows you to automatically compute the optimal image size from given spacing (pixel size) values

- **Automatic Spacing from Size** : This mode allows you to automatically compute the optimal image spacing (pixel size) from the given size

- **Automatic Size from Spacing and output corners** : This mode allows you to automatically compute the optimal image size from spacing (pixel size) and output corners

- **Fit to ortho** : Fit the size, origin and spacing to an existing ortho image (uses the value of outputs.ortho)
- **Upper Left X:** Cartographic X coordinate of upper-left corner (meters for cartographic projections, degrees for geographic ones)

- **Upper Left Y:** Cartographic Y coordinate of the upper-left corner (meters for cartographic projections, degrees for geographic ones)

- **Size X:** Size of projected image along X (in pixels)

- **Size Y:** Size of projected image along Y (in pixels)

- **Pixel Size X:** Size of each pixel along X axis (meters for cartographic projections, degrees for geographic ones)

- **Pixel Size Y:** Size of each pixel along Y axis (meters for cartographic projections, degrees for geographic ones)

- **Lower right X:** Cartographic X coordinate of the lower-right corner (meters for cartographic projections, degrees for geographic ones)

- **Lower right Y:** Cartographic Y coordinate of the lower-right corner (meters for cartographic projections, degrees for geographic ones)

- **Model ortho-image:** A model ortho-image that can be used to compute size, origin and spacing of the output

- **Force isotropic spacing by default:** Default spacing (pixel size) values are estimated from the sensor modeling of the image. It can therefore result in a non-isotropic spacing. This option allows you to force default values to be isotropic (in this case, the minimum of spacing in both direction is applied. Values overriden by user are not affected by this option.

- **Default pixel value:** Default value to write when outside of input image.



**Elevation management**
This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**Interpolation**
This group of parameters allows to define how the input image will be interpolated during resampling. Available choices are: 

- **Bicubic interpolation**

 - **Radius for bicubic interpolation** : This parameter allows to control the size of the bicubic interpolation filter. If the target pixel size is higher than the input pixel size, increasing this parameter will reduce aliasing artefacts.

- **Nearest Neighbor interpolation** : Nearest neighbor interpolation leads to poor image quality, but it is very fast.

- **Linear interpolation** : Linear interpolation leads to average image quality but is quite fast

**Speed optimization parameters**
This group of parameters allows to optimize processing time.

- **RPC modeling (points per axis):** Enabling RPC modeling allows to speed-up SPOT5 ortho-rectification. Value is the number of control points per axis for RPC estimation

- **Available RAM (Mb):** This allows to set the maximum amount of RAM available for processing. As the writing task is time consuming, it is better to write large pieces of data, which can be achieved by increasing this parameter (pay attention to your system capabilities)

- **Resampling grid spacing:** Resampling is done according to a coordinate mapping deformation grid, whose pixel size is set by this parameter, and expressed in the coordinate system of the output image The closer to the output spacing this parameter is, the more precise will be the ortho-rectified image,but increasing this parameter will reduce processing time.



**Load otb application from xml file**
Load otb application from xml file

**Save otb application to xml file**
Save otb application to xml file

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_OrthoRectification -io.in QB_TOULOUSE_MUL_Extract_500_500.tif -io.out QB_Toulouse_ortho.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the OrthoRectification application 
	OrthoRectification = otbApplication.Registry.CreateApplication("OrthoRectification")

	# The following lines set all the application parameters:
	OrthoRectification.SetParameterString("io.in", "QB_TOULOUSE_MUL_Extract_500_500.tif")

	OrthoRectification.SetParameterString("io.out", "QB_Toulouse_ortho.tif")

	# The following line execute the application
	OrthoRectification.ExecuteAndWriteOutput()

Limitations
-----------

Supported sensors are Pleiades, SPOT5 (TIF format), Ikonos, Quickbird, Worldview2, GeoEye.

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

`Ortho-rectification chapter from the OTB Software Guide <http://www.readthedocs.org/Ortho-rectification chapter from the OTB Software Guide.html>`_

