Haralick Texture Extraction
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Computes textures on every pixel of the input image selected channel

Detailed description
--------------------

This application computes Haralick, advanced and higher order textures on a mono band image

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{HaralickTextureExtraction_param_table}, page~\pageref{HaralickTextureExtraction_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+HaralickTextureExtraction+.

Parameters table for Haralick Texture Extraction:

+----------------+--------------------------+----------------------------------+
|Parameter Key   |Parameter Type            |Parameter Description             |
+================+==========================+==================================+
|in              |Input image               |Input image                       |
+----------------+--------------------------+----------------------------------+
|channel         |Int                       |Int                               |
+----------------+--------------------------+----------------------------------+
|ram             |Int                       |Int                               |
+----------------+--------------------------+----------------------------------+
|parameters      |Group                     |Group                             |
+----------------+--------------------------+----------------------------------+
|parameters.xrad |Int                       |Int                               |
+----------------+--------------------------+----------------------------------+
|parameters.yrad |Int                       |Int                               |
+----------------+--------------------------+----------------------------------+
|parameters.xoff |Int                       |Int                               |
+----------------+--------------------------+----------------------------------+
|parameters.yoff |Int                       |Int                               |
+----------------+--------------------------+----------------------------------+
|parameters.min  |Float                     |Float                             |
+----------------+--------------------------+----------------------------------+
|parameters.max  |Float                     |Float                             |
+----------------+--------------------------+----------------------------------+
|parameters.nbbin|Int                       |Int                               |
+----------------+--------------------------+----------------------------------+
|texture         |Choices                   |Choices                           |
+----------------+--------------------------+----------------------------------+
|texture simple  | *Choice*                 |Simple Haralick Texture Features  |
+----------------+--------------------------+----------------------------------+
|texture advanced| *Choice*                 |Advanced Texture Features         |
+----------------+--------------------------+----------------------------------+
|texture higher  | *Choice*                 |Higher Order Texture Features     |
+----------------+--------------------------+----------------------------------+
|out             |Output image              |Output image                      |
+----------------+--------------------------+----------------------------------+
|inxml           |XML input parameters file |XML input parameters file         |
+----------------+--------------------------+----------------------------------+
|outxml          |XML output parameters file|XML output parameters file        |
+----------------+--------------------------+----------------------------------+

**Input Image**
The input image to compute the features on.

**Selected Channel**
The selected channel index.

**Available RAM (Mb)**
Available memory for processing (in MB).

**Texture feature parameters**
This group of parameters allows to define texture parameters.

- **X Radius:** X Radius.

- **Y Radius:** Y Radius.

- **X Offset:** X Offset.

- **Y Offset:** Y Offset.

- **Image Minimum:** Image Minimum.

- **Image Maximum:** Image Maximum.

- **Histogram number of bin:** Histogram number of bin.



**Texture Set Selection**
Choice of The Texture Set. Available choices are: 

- **Simple Haralick Texture Features** : This group of parameters defines the 8 local Haralick texture feature output image.    The image channels are: Energy, Entropy, Correlation, Inverse Difference Moment,    Inertia, Cluster Shade, Cluster Prominence and Haralick Correlation


- **Advanced Texture Features** : This group of parameters defines the 9 advanced texture feature output image.    The image channels are: Mean, Variance, Sum Average, Sum Variance,    Sum Entropy, Difference of Entropies, Difference of Variances, IC1 and IC2


- **Higher Order Texture Features** : This group of parameters defines the 11 higher order texture feature output image.    The image channels are: Short Run Emphasis, Long Run Emphasis, GreyLevel Nonuniformity, Run Length Nonuniformity, Run Percentage,     Low GreyLevel Run Emphasis, High GreyLevel Run Emphasis, Short Run Low GreyLevel Emphasis, Short Run High GreyLevel Emphasis,     Long Run Low GreyLevel Emphasis and Long Run High GreyLevel Emphasis



**Output Image**
Output image containing the selected texture features.

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_HaralickTextureExtraction -in qb_RoadExtract.tif -channel 2 -parameters.xrad 3 -parameters.yrad 3 -texture simple -out HaralickTextures.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the HaralickTextureExtraction application 
	HaralickTextureExtraction = otbApplication.Registry.CreateApplication("HaralickTextureExtraction")

	# The following lines set all the application parameters:
	HaralickTextureExtraction.SetParameterString("in", "qb_RoadExtract.tif")

	HaralickTextureExtraction.SetParameterInt("channel", 2)

	HaralickTextureExtraction.SetParameterInt("parameters.xrad", 3)

	HaralickTextureExtraction.SetParameterInt("parameters.yrad", 3)

	HaralickTextureExtraction.SetParameterString("texture","simple")

	HaralickTextureExtraction.SetParameterString("out", "HaralickTextures.tif")

	# The following line execute the application
	HaralickTextureExtraction.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

otbScalarImageToTexturesFilter, otbScalarImageToAdvancedTexturesFilter and otbScalarImageToHigherOrderTexturesFilter classes

