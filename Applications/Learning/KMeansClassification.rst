Unsupervised KMeans image classification
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Unsupervised KMeans image classification

Detailed description
--------------------

Performs unsupervised KMeans image classification.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{KMeansClassification_param_table}, page~\pageref{KMeansClassification_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+KMeansClassification+.

Parameters table for Unsupervised KMeans image classification:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|vm           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|ts           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|nc           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|maxit        |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|ct           |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|outmeans     |Output File name          |Output File name                  |
+-------------+--------------------------+----------------------------------+
|rand         |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Image:** Input image to classify.
- **Output Image:** Output image containing the class indexes.
- **Available RAM (Mb):** Available memory for processing (in MB)
- **Validity Mask:** Validity mask. Only non-zero pixels will be used to estimate KMeans modes.
- **Training set size:** Size of the training set (in pixels).
- **Number of classes:** Number of modes, which will be used to generate class membership.
- **Maximum number of iterations:** Maximum number of iterations for the learning step.
- **Convergence threshold:** Convergence threshold for class centroid  (L2 distance, by default 0.0001).
- **Centroid filename:** Output text file containing centroid positions
- **set user defined seed:** Set specific seed. with integer value.
- **Load otb application from xml file:** Load otb application from xml file
- **Save otb application to xml file:** Save otb application to xml file


Example
-------

To run this example in command-line, use the following: 
::

	otbcli_KMeansClassification -in QB_1_ortho.tif -ts 1000 -nc 5 -maxit 1000 -ct 0.0001 -out ClassificationFilterOutput.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the KMeansClassification application 
	KMeansClassification = otbApplication.Registry.CreateApplication("KMeansClassification")

	# The following lines set all the application parameters:
	KMeansClassification.SetParameterString("in", "QB_1_ortho.tif")

	KMeansClassification.SetParameterInt("ts", 1000)

	KMeansClassification.SetParameterInt("nc", 5)

	KMeansClassification.SetParameterInt("maxit", 1000)

	KMeansClassification.SetParameterFloat("ct", 0.0001)

	KMeansClassification.SetParameterString("out", "ClassificationFilterOutput.tif")

	# The following line execute the application
	KMeansClassification.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

