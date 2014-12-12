Binary Morphological Operation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Performs morphological operations on an input image channel

Detailed description
--------------------

This application performs binary morphological operations on a mono band image

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{BinaryMorphologicalOperation_param_table}, page~\pageref{BinaryMorphologicalOperation_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+BinaryMorphologicalOperation+.

Parameters table for Binary Morphological Operation:

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
|filter.dilate.foreval |Float                     |Float                             |
+----------------------+--------------------------+----------------------------------+
|filter.dilate.backval |Float                     |Float                             |
+----------------------+--------------------------+----------------------------------+
|filter.erode.foreval  |Float                     |Float                             |
+----------------------+--------------------------+----------------------------------+
|filter.erode.backval  |Float                     |Float                             |
+----------------------+--------------------------+----------------------------------+
|filter.opening.foreval|Float                     |Float                             |
+----------------------+--------------------------+----------------------------------+
|filter.opening.backval|Float                     |Float                             |
+----------------------+--------------------------+----------------------------------+
|filter.closing.foreval|Float                     |Float                             |
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

 - **Foreground Value** : The Foreground Value.

 - **Background Value** : The Background Value.


- **Erode**

 - **Foreground Value** : The Foreground Value.

 - **Background Value** : The Background Value.


- **Opening**

 - **Foreground Value** : The Foreground Value.

 - **Background Value** : The Background Value.


- **Closing**

 - **Foreground Value** : The Foreground Value.



**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_BinaryMorphologicalOperation -in qb_RoadExtract.tif -out opened.tif -channel 1 -structype.ball.xradius 5 -structype.ball.yradius 5 -filter erode

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the BinaryMorphologicalOperation application 
	BinaryMorphologicalOperation = otbApplication.Registry.CreateApplication("BinaryMorphologicalOperation")

	# The following lines set all the application parameters:
	BinaryMorphologicalOperation.SetParameterString("in", "qb_RoadExtract.tif")

	BinaryMorphologicalOperation.SetParameterString("out", "opened.tif")

	BinaryMorphologicalOperation.SetParameterInt("channel", 1)

	BinaryMorphologicalOperation.SetParameterInt("structype.ball.xradius", 5)

	BinaryMorphologicalOperation.SetParameterInt("structype.ball.yradius", 5)

	BinaryMorphologicalOperation.SetParameterString("filter","erode")

	# The following line execute the application
	BinaryMorphologicalOperation.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

itkBinaryDilateImageFilter, itkBinaryErodeImageFilter, itkBinaryMorphologicalOpeningImageFilter and itkBinaryMorphologicalClosingImageFilter classes

