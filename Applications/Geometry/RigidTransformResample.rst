Image resampling with a rigid transform
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Resample an image with a rigid transform

Detailed description
--------------------

This application performs a parametric transform on the input image. Scaling, translation and rotation with scaling factor are handled. Parameters of the transform is expressed in physical units, thus particular attention must be paid on pixel size (value, and sign). Moreover transform is expressed from input space to output space (on the contrary ITK Transforms are expressed form output space to input space). 

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{RigidTransformResample_param_table}, page~\pageref{RigidTransformResample_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+RigidTransformResample+.

Parameters table for Image resampling with a rigid transform:

+---------------------------------+--------------------------+-------------------------------------+
|Parameter Key                    |Parameter Type            |Parameter Description                |
+=================================+==========================+=====================================+
|in                               |Input image               |Input image                          |
+---------------------------------+--------------------------+-------------------------------------+
|out                              |Output image              |Output image                         |
+---------------------------------+--------------------------+-------------------------------------+
|transform                        |Group                     |Group                                |
+---------------------------------+--------------------------+-------------------------------------+
|transform.type                   |Choices                   |Choices                              |
+---------------------------------+--------------------------+-------------------------------------+
|transform.type id                | *Choice*                 |id                                   |
+---------------------------------+--------------------------+-------------------------------------+
|transform.type translation       | *Choice*                 |translation                          |
+---------------------------------+--------------------------+-------------------------------------+
|transform.type rotation          | *Choice*                 |rotation                             |
+---------------------------------+--------------------------+-------------------------------------+
|transform.type.id.scalex         |Float                     |Float                                |
+---------------------------------+--------------------------+-------------------------------------+
|transform.type.id.scaley         |Float                     |Float                                |
+---------------------------------+--------------------------+-------------------------------------+
|transform.type.translation.tx    |Float                     |Float                                |
+---------------------------------+--------------------------+-------------------------------------+
|transform.type.translation.ty    |Float                     |Float                                |
+---------------------------------+--------------------------+-------------------------------------+
|transform.type.translation.scalex|Float                     |Float                                |
+---------------------------------+--------------------------+-------------------------------------+
|transform.type.translation.scaley|Float                     |Float                                |
+---------------------------------+--------------------------+-------------------------------------+
|transform.type.rotation.angle    |Float                     |Float                                |
+---------------------------------+--------------------------+-------------------------------------+
|transform.type.rotation.scalex   |Float                     |Float                                |
+---------------------------------+--------------------------+-------------------------------------+
|transform.type.rotation.scaley   |Float                     |Float                                |
+---------------------------------+--------------------------+-------------------------------------+
|interpolator                     |Choices                   |Choices                              |
+---------------------------------+--------------------------+-------------------------------------+
|interpolator nn                  | *Choice*                 |Nearest Neighbor interpolation       |
+---------------------------------+--------------------------+-------------------------------------+
|interpolator linear              | *Choice*                 |Linear interpolation                 |
+---------------------------------+--------------------------+-------------------------------------+
|interpolator bco                 | *Choice*                 |Bicubic interpolation                |
+---------------------------------+--------------------------+-------------------------------------+
|interpolator.bco.radius          |Int                       |Int                                  |
+---------------------------------+--------------------------+-------------------------------------+
|ram                              |Int                       |Int                                  |
+---------------------------------+--------------------------+-------------------------------------+
|inxml                            |XML input parameters file |XML input parameters file            |
+---------------------------------+--------------------------+-------------------------------------+
|outxml                           |XML output parameters file|XML output parameters file           |
+---------------------------------+--------------------------+-------------------------------------+

**Input image**
The input image to translate.

**Output image**
The transformed output image.

**Transform parameters**
This group of parameters allows to set the transformation to apply.

- **Type of transformation:** Type of transformation. Available transformations are spatial scaling, translation and rotation with scaling factor.

 Available choices are: 

- **id** : Spatial scaling

 - **X scaling** : Scaling factor between the output X spacing and the input X spacing.

 - **Y scaling** : Scaling factor between the output Y spacing and the input Y spacing.


- **translation** : translation

 - **The X translation (in physical units)** : The translation value along X axis (in physical units).

 - **The Y translation (in physical units)** : The translation value along Y axis (in physical units).

 - **X scaling** : Scaling factor between the output X spacing and the input X spacing.

 - **Y scaling** : Scaling factor between the output Y spacing and the input Y spacing.


- **rotation** : rotation

 - **Rotation angle** : The rotation angle in degree (values between -180 and 180).

 - **X scaling** : Scale factor between the X spacing of the rotated output image and the X spacing of the unrotated image.

 - **Y scaling** : Scale factor between the Y spacing of the rotated output image and the Y spacing of the unrotated image.



**Interpolation**
This group of parameters allows to define how the input image will be interpolated during resampling. Available choices are: 

- **Nearest Neighbor interpolation** : Nearest neighbor interpolation leads to poor image quality, but it is very fast.

- **Linear interpolation** : Linear interpolation leads to average image quality but is quite fast

- **Bicubic interpolation**

 - **Radius for bicubic interpolation** : This parameter allows to control the size of the bicubic interpolation filter. If the target pixel size is higher than the input pixel size, increasing this parameter will reduce aliasing artefacts.



**Available RAM (Mb)**
This allows to set the maximum amount of RAM available for processing. As the writing task is time consuming, it is better to write large pieces of data, which can be achieved by increasing this parameter (pay attention to your system capabilities).

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_RigidTransformResample -in qb_toulouse_sub.tif -out rigitTransformImage.tif -transform.type rotation -transform.type.rotation.angle 20 -transform.type.rotation.scalex 2. -transform.type.rotation.scaley 2.

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the RigidTransformResample application 
	RigidTransformResample = otbApplication.Registry.CreateApplication("RigidTransformResample")

	# The following lines set all the application parameters:
	RigidTransformResample.SetParameterString("in", "qb_toulouse_sub.tif")

	RigidTransformResample.SetParameterString("out", "rigitTransformImage.tif")

	RigidTransformResample.SetParameterString("transform.type","rotation")

	RigidTransformResample.SetParameterFloat("transform.type.rotation.angle", 20)

	RigidTransformResample.SetParameterFloat("transform.type.rotation.scalex", 2.)

	RigidTransformResample.SetParameterFloat("transform.type.rotation.scaley", 2.)

	# The following line execute the application
	RigidTransformResample.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

Translation

