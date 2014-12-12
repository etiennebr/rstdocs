Grayscale Morphological Operation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Performs morphological operations on a grayscale input image

Detailed description
--------------------

This application performs grayscale morphological operations on a mono band image

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{GrayScaleMorphologicalOperation_param_table}, page~\pageref{GrayScaleMorphologicalOperation_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+GrayScaleMorphologicalOperation+.

Parameters table for Grayscale Morphological Operation:

+----------------------+--------------------------+----------------------------------+
|Parameter Key         |Parameter Type            |Parameter Description             |
+======================+==========================+==================================+
|in                    |Input image               |Input image                       |
+----------------------+--------------------------+----------------------------------+
|out                   |Output image              |Output image                      |
+----------------------+--------------------------+----------------------------------+
|channel               |Int                       |Int                               |
+----------------------+--------------------------+----------------------------------+
|ram                   |Int                       |Int                               |
+----------------------+--------------------------+----------------------------------+
|structype             |Choices                   |Choices                           |
+----------------------+--------------------------+----------------------------------+
|structype ball        | *Choice*                 |Ball                              |
+----------------------+--------------------------+----------------------------------+
|structype cross       | *Choice*                 |Cross                             |
+----------------------+--------------------------+----------------------------------+
|structype.ball.xradius|Int                       |Int                               |
+----------------------+--------------------------+----------------------------------+
|structype.ball.yradius|Int                       |Int                               |
+----------------------+--------------------------+----------------------------------+
|filter                |Choices                   |Choices                           |
+----------------------+--------------------------+----------------------------------+
|filter dilate         | *Choice*                 |Dilate                            |
+----------------------+--------------------------+----------------------------------+
|filter erode          | *Choice*                 |Erode                             |
+----------------------+--------------------------+----------------------------------+
|filter opening        | *Choice*                 |Opening                           |
+----------------------+--------------------------+----------------------------------+
|filter closing        | *Choice*                 |Closing                           |
+----------------------+--------------------------+----------------------------------+
|inxml                 |XML input parameters file |XML input parameters file         |
+----------------------+--------------------------+----------------------------------+
|outxml                |XML output parameters file|XML output parameters file        |
+----------------------+--------------------------+----------------------------------+

**Input Image**
The input image to be filtered.

**Feature Output Image**
Output image containing the filtered output image.

**Selected Channel**
The selected channel index.

**Available RAM (Mb)**
Available memory for processing (in MB).

**Structuring Element Type**
Choice of the structuring element type. Available choices are: 

- **Ball**

 - **The Structuring Element X Radius** : The Structuring Element X Radius.

 - **The Structuring Element Y Radius** : The Structuring Element Y Radius.


- **Cross**


**Morphological Operation**
Choice of the morphological operation. Available choices are: 

- **Dilate**

- **Erode**

- **Opening**

- **Closing**


**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_GrayScaleMorphologicalOperation -in qb_RoadExtract.tif -out opened.tif -channel 1 -structype.ball.xradius 5 -structype.ball.yradius 5 -filter erode

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the GrayScaleMorphologicalOperation application 
	GrayScaleMorphologicalOperation = otbApplication.Registry.CreateApplication("GrayScaleMorphologicalOperation")

	# The following lines set all the application parameters:
	GrayScaleMorphologicalOperation.SetParameterString("in", "qb_RoadExtract.tif")

	GrayScaleMorphologicalOperation.SetParameterString("out", "opened.tif")

	GrayScaleMorphologicalOperation.SetParameterInt("channel", 1)

	GrayScaleMorphologicalOperation.SetParameterInt("structype.ball.xradius", 5)

	GrayScaleMorphologicalOperation.SetParameterInt("structype.ball.yradius", 5)

	GrayScaleMorphologicalOperation.SetParameterString("filter","erode")

	# The following line execute the application
	GrayScaleMorphologicalOperation.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

itkGrayscaleDilateImageFilter, itkGrayscaleErodeImageFilter, itkGrayscaleMorphologicalOpeningImageFilter and itkGrayscaleMorphologicalClosingImageFilter classes

