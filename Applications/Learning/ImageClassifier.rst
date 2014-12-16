Image Classification
^^^^^^^^^^^^^^^^^^^^

Performs a classification of the input image according to a model file.

Detailed description
--------------------

This application performs an image classification based on a model file produced by the TrainImagesClassifier application. Pixels of the output image will contain the class labels decided by the classifier (maximal class label = 65535). The input pixels can be optionally centered and reduced according to the statistics file produced by the ComputeImagesStatistics application. An optional input mask can be provided, in which case only input image pixels whose corresponding mask value is greater than 0 will be classified. The remaining of pixels will be given the label 0 in the output image.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *ImageClassifier* .

.. [#] Table: Parameters table for Image Classification.

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|mask         |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|model        |Input File name           |Input File name                   |
+-------------+--------------------------+----------------------------------+
|imstat       |Input File name           |Input File name                   |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Image:** The input image to classify.

- **Input Mask:** The mask allows to restrict classification of the input image to the area where mask pixel values are greater than 0.

- **Model file:** A model file (produced by TrainImagesClassifier application, maximal class label = 65535).

- **Statistics file:** A XML file containing mean and standard deviation to center and reduce samples before classification (produced by ComputeImagesStatistics application).

- **Output Image:** Output image containing class labels.

- **Available RAM (Mb):** Available memory for processing (in MB).

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_ImageClassifier -in QB_1_ortho.tif -imstat EstimateImageStatisticsQB1.xml -model clsvmModelQB1.svm -out clLabeledImageQB1.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ImageClassifier application 
	ImageClassifier = otbApplication.Registry.CreateApplication("ImageClassifier")

	# The following lines set all the application parameters:
	ImageClassifier.SetParameterString("in", "QB_1_ortho.tif")

	ImageClassifier.SetParameterString("imstat", "EstimateImageStatisticsQB1.xml")

	ImageClassifier.SetParameterString("model", "clsvmModelQB1.svm")

	ImageClassifier.SetParameterString("out", "clLabeledImageQB1.tif")

	# The following line execute the application
	ImageClassifier.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

The input image must have the same type, order and number of bands than the images used to produce the statistics file and the SVM model file. If a statistics file was used during training by the TrainImagesClassifier, it is mandatory to use the same statistics file for classification. If an input mask is used, its size must match the input image size.

Authors
~~~~~~~

This application has been written by OTB-Team.

See Also
~~~~~~~~

These additional ressources can be useful for further information: 

TrainImagesClassifier, ValidateImagesClassifier, ComputeImagesStatistics

