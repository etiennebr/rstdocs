Grid Based Image Resampling
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Resamples an image according to a resampling grid

Detailed description
--------------------

This application allows to perform image resampling from an input resampling grid.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{GridBasedImageResampling_param_table}, page~\pageref{GridBasedImageResampling_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+GridBasedImageResampling+.

Parameters table for Grid Based Image Resampling:

+-----------------------+--------------------------+---------------------------------------------------------------+
|Parameter Key          |Parameter Type            |Parameter Description                                          |
+=======================+==========================+===============================================================+
|io                     |Group                     |Group                                                          |
+-----------------------+--------------------------+---------------------------------------------------------------+
|io.in                  |Input image               |Input image                                                    |
+-----------------------+--------------------------+---------------------------------------------------------------+
|io.out                 |Output image              |Output image                                                   |
+-----------------------+--------------------------+---------------------------------------------------------------+
|grid                   |Group                     |Group                                                          |
+-----------------------+--------------------------+---------------------------------------------------------------+
|grid.in                |Input image               |Input image                                                    |
+-----------------------+--------------------------+---------------------------------------------------------------+
|grid.type              |Choices                   |Choices                                                        |
+-----------------------+--------------------------+---------------------------------------------------------------+
|grid.type def          | *Choice*                 |Displacement  grid: $G(x_out,y_out) = (x_in-x_out, y_in-y_out)$|
+-----------------------+--------------------------+---------------------------------------------------------------+
|grid.type loc          | *Choice*                 |Localisation grid: $G(x_out,y_out) = (x_in, y_in)$             |
+-----------------------+--------------------------+---------------------------------------------------------------+
|out                    |Group                     |Group                                                          |
+-----------------------+--------------------------+---------------------------------------------------------------+
|out.ulx                |Float                     |Float                                                          |
+-----------------------+--------------------------+---------------------------------------------------------------+
|out.uly                |Float                     |Float                                                          |
+-----------------------+--------------------------+---------------------------------------------------------------+
|out.sizex              |Int                       |Int                                                            |
+-----------------------+--------------------------+---------------------------------------------------------------+
|out.sizey              |Int                       |Int                                                            |
+-----------------------+--------------------------+---------------------------------------------------------------+
|out.spacingx           |Float                     |Float                                                          |
+-----------------------+--------------------------+---------------------------------------------------------------+
|out.spacingy           |Float                     |Float                                                          |
+-----------------------+--------------------------+---------------------------------------------------------------+
|out.default            |Float                     |Float                                                          |
+-----------------------+--------------------------+---------------------------------------------------------------+
|interpolator           |Choices                   |Choices                                                        |
+-----------------------+--------------------------+---------------------------------------------------------------+
|interpolator nn        | *Choice*                 |Nearest Neighbor interpolation                                 |
+-----------------------+--------------------------+---------------------------------------------------------------+
|interpolator linear    | *Choice*                 |Linear interpolation                                           |
+-----------------------+--------------------------+---------------------------------------------------------------+
|interpolator bco       | *Choice*                 |Bicubic interpolation                                          |
+-----------------------+--------------------------+---------------------------------------------------------------+
|interpolator.bco.radius|Int                       |Int                                                            |
+-----------------------+--------------------------+---------------------------------------------------------------+
|ram                    |Int                       |Int                                                            |
+-----------------------+--------------------------+---------------------------------------------------------------+
|inxml                  |XML input parameters file |XML input parameters file                                      |
+-----------------------+--------------------------+---------------------------------------------------------------+
|outxml                 |XML output parameters file|XML output parameters file                                     |
+-----------------------+--------------------------+---------------------------------------------------------------+

**Input and output data**
This group of parameters allows to set the input and output images.

- **Input image:** The input image to resample.

- **Output Image:** The resampled output image.



**Resampling grid parameters**


- **Input resampling grid:** The resampling grid.

- **Grid Type:** Allows to choose between two grid types.

 Available choices are: 

- **Displacement  grid: $G(x_out,y_out) = (x_in-x_out, y_in-y_out)$** : A deformation grid contains at each grid position the offset to apply to this position in order to get to the corresponding point in the input image to resample

- **Localisation grid: $G(x_out,y_out) = (x_in, y_in)$** : A localisation grid contains at each grid position the corresponding position in the input image to resample


**Output Image parameters**
Parameters of the output image.

- **Upper Left X:** X Coordinate of the upper-left pixel of the output resampled image.

- **Upper Left Y:** Y Coordinate of the upper-left pixel of the output resampled image.

- **Size X:** Size of the output resampled image along X (in pixels).

- **Size Y:** Size of the output resampled image along Y (in pixels).

- **Pixel Size X:** Size of each pixel along X axis.

- **Pixel Size Y:** Size of each pixel along Y axis.

- **Default value:** The default value to give to pixel that falls outside of the input image.



**Interpolation**
This group of parameters allows to define how the input image will be interpolated during resampling. Available choices are: 

- **Nearest Neighbor interpolation** : Nearest neighbor interpolation leads to poor image quality, but it is very fast.

- **Linear interpolation** : Linear interpolation leads to average image quality but is quite fast

- **Bicubic interpolation**

 - **Radius for bicubic interpolation** : This parameter allows to control the size of the bicubic interpolation filter. If the target pixel size is higher than the input pixel size, increasing this parameter will reduce aliasing artefacts.



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

	otbcli_GridBasedImageResampling -io.in ROI_IKO_PAN_LesHalles_sub.tif -io.out ROI_IKO_PAN_LesHalles_sub_resampled.tif uint8 -grid.in ROI_IKO_PAN_LesHalles_sub_deformation_field.tif -out.sizex 256 -out.sizey 256 -grid.type def

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the GridBasedImageResampling application 
	GridBasedImageResampling = otbApplication.Registry.CreateApplication("GridBasedImageResampling")

	# The following lines set all the application parameters:
	GridBasedImageResampling.SetParameterString("io.in", "ROI_IKO_PAN_LesHalles_sub.tif")

	GridBasedImageResampling.SetParameterString("io.out", "ROI_IKO_PAN_LesHalles_sub_resampled.tif")
	GridBasedImageResampling.SetParameterOutputImagePixelType("io.out", 1)

	GridBasedImageResampling.SetParameterString("grid.in", "ROI_IKO_PAN_LesHalles_sub_deformation_field.tif")

	GridBasedImageResampling.SetParameterInt("out.sizex", 256)

	GridBasedImageResampling.SetParameterInt("out.sizey", 256)

	GridBasedImageResampling.SetParameterString("grid.type","def")

	# The following line execute the application
	GridBasedImageResampling.ExecuteAndWriteOutput()

:Limitations:

None

:Authors:

This application has been written by OTB-Team.

:See Also:

These additional ressources can be useful for further information: 

otbStereorecificationGridGeneration

