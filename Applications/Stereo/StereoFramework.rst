Stereo Framework
^^^^^^^^^^^^^^^^

Compute the ground elevation based on one or multiple stereo pair(s)

Detailed description
--------------------

Compute the ground elevation with a stereo block matching algorithm between one or mulitple stereo pair in sensor geometry. The output is projected in desired geographic or cartographic map projection (UTM by default). The pipeline is made of the following steps:for each sensor pair :	 compute the epipolar displacement grids from the stereo pair (direct and inverse)	 resample the stereo pair into epipolar geometry using BCO interpolation	 create masks for each epipolar image : remove black borders and resample input masks	 compute horizontal disparities with a block matching algorithm	 refine disparities to subpixel precision with a dichotomy algorithm	 apply an optional median filter	 filter disparities based on the correlation score  and exploration bounds	 translate disparities in sensor geometry	  convert disparity to 3D Map.Then fuse all 3D maps to produce DSM.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{StereoFramework_param_table}, page~\pageref{StereoFramework_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+StereoFramework+.

Parameters table for Stereo Framework:

+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|Parameter Key            |Parameter Type            |Parameter Description                                                                       |
+=========================+==========================+============================================================================================+
|input                    |Group                     |Group                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|input.il                 |Input image list          |Input image list                                                                            |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|input.co                 |String                    |String                                                                                      |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|input.channel            |Int                       |Int                                                                                         |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|elev                     |Group                     |Group                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|elev.dem                 |Directory                 |Directory                                                                                   |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|elev.geoid               |Input File name           |Input File name                                                                             |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|elev.default             |Float                     |Float                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output                   |Group                     |Group                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.res               |Float                     |Float                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.nodata            |Float                     |Float                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.fusionmethod      |Choices                   |Choices                                                                                     |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.fusionmethod max  | *Choice*                 |The cell is filled with the maximum measured elevation values                               |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.fusionmethod min  | *Choice*                 |The cell is filled with the minimum measured elevation values                               |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.fusionmethod mean | *Choice*                 |The cell is filled with the mean of measured elevation values                               |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.fusionmethod acc  | *Choice*                 |accumulator mode. The cell is filled with the the number of values (for debugging purposes).|
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.out               |Output image              |Output image                                                                                |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.mode              |Choices                   |Choices                                                                                     |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.mode fit          | *Choice*                 |Fit to sensor image                                                                         |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.mode user         | *Choice*                 |User Defined                                                                                |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.mode.user.ulx     |Float                     |Float                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.mode.user.uly     |Float                     |Float                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.mode.user.sizex   |Int                       |Int                                                                                         |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.mode.user.sizey   |Int                       |Int                                                                                         |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.mode.user.spacingx|Float                     |Float                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|output.mode.user.spacingy|Float                     |Float                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|map                      |Choices                   |Choices                                                                                     |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|map utm                  | *Choice*                 |Universal Trans-Mercator (UTM)                                                              |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|map lambert2             | *Choice*                 |Lambert II Etendu                                                                           |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|map lambert93            | *Choice*                 |Lambert93                                                                                   |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|map wgs                  | *Choice*                 |WGS 84                                                                                      |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|map epsg                 | *Choice*                 |EPSG Code                                                                                   |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|map.utm.zone             |Int                       |Int                                                                                         |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|map.utm.northhem         |Boolean                   |Boolean                                                                                     |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|map.epsg.code            |Int                       |Int                                                                                         |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|stereorect               |Group                     |Group                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|stereorect.fwdgridstep   |Int                       |Int                                                                                         |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|stereorect.invgridssrate |Int                       |Int                                                                                         |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|bm                       |Group                     |Group                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|bm.metric                |Choices                   |Choices                                                                                     |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|bm.metric ssdmean        | *Choice*                 |Sum of Squared Distances divided by mean of block                                           |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|bm.metric ssd            | *Choice*                 |Sum of Squared Distances                                                                    |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|bm.metric ncc            | *Choice*                 |Normalized Cross-Correlation                                                                |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|bm.metric lp             | *Choice*                 |Lp pseudo-norm                                                                              |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|bm.metric.lp.p           |Float                     |Float                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|bm.radius                |Int                       |Int                                                                                         |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|bm.minhoffset            |Float                     |Float                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|bm.maxhoffset            |Float                     |Float                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|postproc                 |Group                     |Group                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|postproc.bij             |Boolean                   |Boolean                                                                                     |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|postproc.med             |Boolean                   |Boolean                                                                                     |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|postproc.metrict         |Float                     |Float                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|mask                     |Group                     |Group                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|mask.left                |Input image               |Input image                                                                                 |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|mask.right               |Input image               |Input image                                                                                 |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|mask.variancet           |Float                     |Float                                                                                       |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|ram                      |Int                       |Int                                                                                         |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|inxml                    |XML input parameters file |XML input parameters file                                                                   |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+
|outxml                   |XML output parameters file|XML output parameters file                                                                  |
+-------------------------+--------------------------+--------------------------------------------------------------------------------------------+

**Input parameters**
This group of parameters allows to parametrize input data.

- **Input images list:** The list of images.

- **Couples list:** List of index of couples im image list. Couples must be separated by a comma. (index start at 0). for example : 0 1,1 2 will process a first couple composed of the first and the second image in image list, then the first and the third image . note that images are handled by pairs. if left empty couples are created from input index i.e. a first couple will be composed of the first and second image, a second couple with third and fourth image etc. (in this case image list must be even).

- **Image channel used for the block matching:** Used channel for block matching (used for all images).



**Elevation management**
This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles.

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**Output parameters**
This group of parameters allows to choose the DSM resolution, nodata value, and projection parameters.

- **Output resolution:** Spatial sampling distance of the output elevation : the cell size (in m).

- **NoData value:** DSM empty cells are filled with this value (optional -32768 by default).

- **Method to fuse measures in each DSM cell:** This parameter allows to choose the method used to fuse elevation measurements in each output DSM cell.

 Available choices are: 

- **The cell is filled with the maximum measured elevation values**

- **The cell is filled with the minimum measured elevation values**

- **The cell is filled with the mean of measured elevation values**

- **accumulator mode. The cell is filled with the the number of values (for debugging purposes).**
- **Output DSM:** Output elevation image.

- **Parameters estimation modes:** 

 Available choices are: 

- **Fit to sensor image** : Fit the size, origin and spacing to an existing ortho image (uses the value of outputs.ortho)

- **User Defined** : This mode allows you to fully modify default values.

 - **Upper Left X** : Cartographic X coordinate of upper-left corner (meters for cartographic projections, degrees for geographic ones).

 - **Upper Left Y** : Cartographic Y coordinate of the upper-left corner (meters for cartographic projections, degrees for geographic ones).

 - **Size X** : Size of projected image along X (in pixels).

 - **Size Y** : Size of projected image along Y (in pixels).

 - **Pixel Size X** : Size of each pixel along X axis (meters for cartographic projections, degrees for geographic ones).

 - **Pixel Size Y** : Size of each pixel along Y axis (meters for cartographic projections, degrees for geographic ones).



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



**Stereorectification Grid parameters**
This group of parameters allows to choose direct and inverse grid subsampling. These parameters are very useful to tune time and memory consumption.

- **Step of the displacement grid (in pixels):** Stereo-rectification displacement grid only varies slowly. Therefore, it is recommended to use a coarser grid (higher step value) in case of large images.

- **Sub-sampling rate for epipolar grid inversion:** Grid inversion is an heavy process that implies spline regression on control points. To avoid eating to much memory, this parameter allows to first sub-sample the field to invert.



**Block matching parameters**
This group of parameters allow to tune the block-matching behavior.

- **Block-matching metric:** 

 Available choices are: 

- **Sum of Squared Distances divided by mean of block** : derived version of Sum of Squared Distances between pixels value in the metric window (SSD divided by mean over window)

- **Sum of Squared Distances** : Sum of squared distances between pixels value in the metric window

- **Normalized Cross-Correlation** : Normalized CrossCorrelation between the left and right windows

- **Lp pseudo-norm** : Lp pseudonorm between the left and right windows

 - **p value** : Value of the p parameter in Lp pseudo-norm (must be positive).

- **Radius of blocks for matching filter (in pixels):** The radius of blocks in Block-Matching (in pixels).

- **Minimum altitude offset (in meters):** Minimum altitude below the selected elevation source (in meters).

- **Maximum altitude offset (in meters):** Maximum altitude above the selected elevation source (in meters).



**Postprocessing parameters**
This group of parameters allow use optional filters.

- **Use bijection consistency in block matching strategy:** use bijection consistency. Right to Left correlation is computed to validate Left to Right disparities. If bijection is not found pixel is rejected.

- **Use median disparities filtering:** disparities output can be filtered using median post filtering (disabled by default).

- **Correlation metric threshold:** Use block matching metric output to discard pixels with low correlation value (disabled by default, float value).



**Masks**


- **Input left mask:** Mask for left input image.

- **Input right mask:** Mask for right input image.

- **Discard pixels with low local variance:** This parameter allows to discard pixels whose local variance is too small (the size of the neighborhood is given by the radius parameter).



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

	otbcli_StereoFramework -input.il sensor_stereo_left.tif sensor_stereo_right.tif -elev.default 200 -stereorect.fwdgridstep 8 -stereorect.invgridssrate 4 -postproc.med 1 -output.res 2.5 -output.out dem.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the StereoFramework application 
	StereoFramework = otbApplication.Registry.CreateApplication("StereoFramework")

	# The following lines set all the application parameters:
	StereoFramework.SetParameterStringList("input.il", ['sensor_stereo_left.tif', 'sensor_stereo_right.tif'])

	StereoFramework.SetParameterFloat("elev.default", 200)

	StereoFramework.SetParameterInt("stereorect.fwdgridstep", 8)

	StereoFramework.SetParameterInt("stereorect.invgridssrate", 4)

	StereoFramework.SetParameterString("postproc.med","1")

	StereoFramework.SetParameterFloat("output.res", 2.5)

	StereoFramework.SetParameterString("output.out", "dem.tif")

	# The following line execute the application
	StereoFramework.ExecuteAndWriteOutput()

Authors
-------

This application has been written by OTB-Team.

