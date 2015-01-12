Confusion matrix Computation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Computes the confusion matrix of a classification

Detailed description
--------------------

This application computes the confusion matrix of a classification map relatively to a ground truth. This ground truth can be given as a raster or a vector data. Only reference and produced pixels with values different from NoData are handled in the calculation of the confusion matrix. The confusion matrix is organized the following way: rows = reference labels, columns = produced labels. In the header of the output file, the reference and produced class labels are ordered according to the rows/columns of the confusion matrix.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *ComputeConfusionMatrix* .

.. [#] Table: Parameters table for Confusion matrix Computation.

+----------------+--------------------------+----------------------------------+
|Parameter Key   |Parameter Type            |Parameter Description             |
+================+==========================+==================================+
|in              |Input image               |Input image                       |
+----------------+--------------------------+----------------------------------+
|out             |Output File name          |Output File name                  |
+----------------+--------------------------+----------------------------------+
|ref             |Choices                   |Choices                           |
+----------------+--------------------------+----------------------------------+
|ref raster      | *Choice*                 |Ground truth as a raster image    |
+----------------+--------------------------+----------------------------------+
|ref vector      | *Choice*                 |Ground truth as a vector data file|
+----------------+--------------------------+----------------------------------+
|ref.raster.in   |Input image               |Input image                       |
+----------------+--------------------------+----------------------------------+
|ref.vector.in   |Input File name           |Input File name                   |
+----------------+--------------------------+----------------------------------+
|ref.vector.field|String                    |String                            |
+----------------+--------------------------+----------------------------------+
|nodatalabel     |Int                       |Int                               |
+----------------+--------------------------+----------------------------------+
|ram             |Int                       |Int                               |
+----------------+--------------------------+----------------------------------+
|inxml           |XML input parameters file |XML input parameters file         |
+----------------+--------------------------+----------------------------------+
|outxml          |XML output parameters file|XML output parameters file        |
+----------------+--------------------------+----------------------------------+

**Input Image**
The input classification image.

**Matrix output**
Filename to store the output matrix (csv format).

**Ground truth**
Choice of ground truth format. Available choices are: 

- **Ground truth as a raster image**


 - **Input reference image** : Input image containing the ground truth labels.


 - **Ground truth as a vector data file**


  - **Input reference vector data** : Input vector data of the ground truth.

  - **Field name** : Field name containing the label values.



**Value for nodata pixels**
Label for the NoData class. Such input pixels will be discarded from the ground truth and from the input classification map. By default, 'nodatalabel = 0'.

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

	otbcli_ComputeConfusionMatrix -in clLabeledImageQB1.tif -out ConfusionMatrix.csv -ref vector -ref.vector.in VectorData_QB1_bis.shp -ref.vector.field Class -nodatalabel 255

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ComputeConfusionMatrix application 
	ComputeConfusionMatrix = otbApplication.Registry.CreateApplication("ComputeConfusionMatrix")

	# The following lines set all the application parameters:
	ComputeConfusionMatrix.SetParameterString("in", "clLabeledImageQB1.tif")

	ComputeConfusionMatrix.SetParameterString("out", "ConfusionMatrix.csv")

	ComputeConfusionMatrix.SetParameterString("ref","vector")

	ComputeConfusionMatrix.SetParameterString("ref.vector.in", "VectorData_QB1_bis.shp")

	ComputeConfusionMatrix.SetParameterString("ref.vector.field", "Class")

	ComputeConfusionMatrix.SetParameterInt("nodatalabel", 255)

	# The following line execute the application
	ComputeConfusionMatrix.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

None

Authors
~~~~~~~

This application has been written by OTB-Team.

