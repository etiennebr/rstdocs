Stereo-rectification deformation grid generator
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Generates two deformation fields to stereo-rectify (i.e. resample in epipolar geometry) a pair of stereo images up to the sensor model precision

Detailed description
--------------------

This application generates a pair of deformation grid to stereo-rectify a pair of stereo images according to sensor modelling and a mean elevation hypothesis. The deformation grids can be passed to the StereoRectificationGridGenerator application for actual resampling in epipolar geometry.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{StereoRectificationGridGenerator_param_table}, page~\pageref{StereoRectificationGridGenerator_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+StereoRectificationGridGenerator+.

Parameters table for Stereo-rectification deformation grid generator:

+----------------------------+--------------------------+-----------------------------------------------+
|Parameter Key               |Parameter Type            |Parameter Description                          |
+============================+==========================+===============================================+
|io                          |Group                     |Group                                          |
+----------------------------+--------------------------+-----------------------------------------------+
|io.inleft                   |Input image               |Input image                                    |
+----------------------------+--------------------------+-----------------------------------------------+
|io.inright                  |Input image               |Input image                                    |
+----------------------------+--------------------------+-----------------------------------------------+
|io.outleft                  |Output image              |Output image                                   |
+----------------------------+--------------------------+-----------------------------------------------+
|io.outright                 |Output image              |Output image                                   |
+----------------------------+--------------------------+-----------------------------------------------+
|epi                         |Group                     |Group                                          |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.elevation               |Group                     |Group                                          |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.elevation.dem           |Directory                 |Directory                                      |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.elevation.geoid         |Input File name           |Input File name                                |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.elevation.default       |Float                     |Float                                          |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.elevation.avgdem        |Group                     |Group                                          |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.elevation.avgdem.step   |Int                       |Int                                            |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.elevation.avgdem.value  |Float                     |Float                                          |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.elevation.avgdem.mindisp|Float                     |Float                                          |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.elevation.avgdem.maxdisp|Float                     |Float                                          |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.scale                   |Float                     |Float                                          |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.step                    |Int                       |Int                                            |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.rectsizex               |Int                       |Int                                            |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.rectsizey               |Int                       |Int                                            |
+----------------------------+--------------------------+-----------------------------------------------+
|epi.baseline                |Float                     |Float                                          |
+----------------------------+--------------------------+-----------------------------------------------+
|inverse                     |Group                     |Group                                          |
+----------------------------+--------------------------+-----------------------------------------------+
|inverse.outleft             |Output image              |Output image                                   |
+----------------------------+--------------------------+-----------------------------------------------+
|inverse.outright            |Output image              |Output image                                   |
+----------------------------+--------------------------+-----------------------------------------------+
|inverse.ssrate              |Int                       |Int                                            |
+----------------------------+--------------------------+-----------------------------------------------+
|inxml                       |XML input parameters file |XML input parameters file                      |
+----------------------------+--------------------------+-----------------------------------------------+
|outxml                      |XML output parameters file|XML output parameters file                     |
+----------------------------+--------------------------+-----------------------------------------------+

**Input and output data**
This group of parameters allows to set the input and output images.

- **Left input image:** The left input image to resample.

- **Right input image:** The right input image to resample.

- **Left output deformation grid:** The output deformation grid to be used to resample the left input image.

- **Right output deformation grid:** The output deformation grid to be used to resample the right input image.



**Epipolar  geometry and grid parameters**
Parameters of the epipolar geometry and output grids.

- **Elevation management:** This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles.

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.

- **Average elevation computed from DEM:** Average elevation computed from the provided DEM.

- **Sub-sampling step:** Step of sub-sampling for average elevation estimation.

- **Average elevation value:** Average elevation value estimated from DEM.

- **Minimum disparity from DEM:** Disparity corresponding to estimated minimum elevation over the left image.

- **Maximum disparity from DEM:** Disparity corresponding to estimated maximum elevation over the left image.





- **Scale of epipolar images:** The scale parameter allows to generated zoomed-in (scale < 1) or zoomed-out (scale > 1) epipolar images.

- **Step of the deformation grid (in nb. of pixels):** Stereo-rectification deformation grid only varies slowly. Therefore, it is recommanded to use a coarser grid (higher step value) in case of large images.

- **Rectified image size X:** The application computes the optimal rectified image size so that the whole left input image fits into the rectified area. However, due to the scale and step parameter, this size may not match the size of the deformation field output. In this case, one can use these output values.

- **Rectified image size Y:** The application computes the optimal rectified image size so that the whole left input image fits into the rectified area. However, due to the scale and step parameter, this size may not match the size of the deformation field output. In this case, one can use these output values.

- **Mean baseline ratio:** This parameter is the mean value, in pixels.meters^-1, of the baseline to sensor altitude ratio. It can be used to convert disparities to physical elevation, since a disparity of one pixel will correspond to an elevation offset of the invert of this value with respect to the mean elevation.



**Write inverse fields**
This group of parameter allows to generate the inverse fields as well.

- **Left inverse deformation grid:** The output deformation grid to be used to resample the epipolar left image.

- **Right inverse deformation grid:** The output deformation grid to be used to resample the epipolar right image.

- **Sub-sampling rate for inversion:** Grid inversion is an heavy process that implies spline regression on control points. To avoid eating to much memory, this parameter allows to first sub-sample the field to invert.



**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_StereoRectificationGridGenerator -io.inleft wv2_xs_left.tif -io.inright wv2_xs_left.tif -io.outleft wv2_xs_left_epi_field.tif -io.outright wv2_xs_right_epi_field.tif -epi.elevation.default 400

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the StereoRectificationGridGenerator application 
	StereoRectificationGridGenerator = otbApplication.Registry.CreateApplication("StereoRectificationGridGenerator")

	# The following lines set all the application parameters:
	StereoRectificationGridGenerator.SetParameterString("io.inleft", "wv2_xs_left.tif")

	StereoRectificationGridGenerator.SetParameterString("io.inright", "wv2_xs_left.tif")

	StereoRectificationGridGenerator.SetParameterString("io.outleft", "wv2_xs_left_epi_field.tif")

	StereoRectificationGridGenerator.SetParameterString("io.outright", "wv2_xs_right_epi_field.tif")

	StereoRectificationGridGenerator.SetParameterFloat("epi.elevation.default", 400)

	# The following line execute the application
	StereoRectificationGridGenerator.ExecuteAndWriteOutput()

Limitations
-----------

Generation of the deformation grid is not streamable, pay attention to this fact when setting the grid step.

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

otbGridBasedImageResampling

