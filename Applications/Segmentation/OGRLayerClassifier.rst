OGRLayerClassifier
^^^^^^^^^^^^^^^^^^

Classify an OGR layer based on a machine learning model and a list of features to consider.

Detailed description
--------------------

This application will apply a trained machine learning model on the selected feature to get a classification of each geometry contained in an OGR layer. The list of feature must match the list used for training. The predicted label is written in the user defined field for each geometry.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{OGRLayerClassifier_param_table}, page~\pageref{OGRLayerClassifier_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+OGRLayerClassifier+.

Parameters table for OGRLayerClassifier:

+-------------+--------------------------+------------------------------------------------------+
|Parameter Key|Parameter Type            |Parameter Description                                 |
+=============+==========================+======================================================+
|inshp        |Input File name           |Input File name                                       |
+-------------+--------------------------+------------------------------------------------------+
|instats      |Input File name           |Input File name                                       |
+-------------+--------------------------+------------------------------------------------------+
|insvm        |Output File name          |Output File name                                      |
+-------------+--------------------------+------------------------------------------------------+
|feat         |List                      |List                                                  |
+-------------+--------------------------+------------------------------------------------------+
|cfield       |String                    |String                                                |
+-------------+--------------------------+------------------------------------------------------+
|inxml        |XML input parameters file |XML input parameters file                             |
+-------------+--------------------------+------------------------------------------------------+
|outxml       |XML output parameters file|XML output parameters file                            |
+-------------+--------------------------+------------------------------------------------------+

- **Name of the input shapefile:** Name of the input shapefile.

- **XML file containing mean and variance of each feature.:** XML file containing mean and variance of each feature.

- **Input model filename.:** Input model filename.

- **Features:** Features to be calculated.

- **Field containing the predicted class.:** Field containing the predicted class.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_OGRLayerClassifier -inshp vectorData.shp -instats meanVar.xml -insvm svmModel.svm -feat perimeter -cfield predicted

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the OGRLayerClassifier application 
	OGRLayerClassifier = otbApplication.Registry.CreateApplication("OGRLayerClassifier")

	# The following lines set all the application parameters:
	OGRLayerClassifier.SetParameterString("inshp", "vectorData.shp")

	OGRLayerClassifier.SetParameterString("instats", "meanVar.xml")

	OGRLayerClassifier.SetParameterString("insvm", "svmModel.svm")

	# The following line execute the application
	OGRLayerClassifier.ExecuteAndWriteOutput()

:Limitations:

Experimental. Only shapefiles are supported for now.

:Authors:

This application has been written by David Youssefi during internship at CNES.

:See Also:

These additional ressources can be useful for further information: 

ComputeOGRLayersFeaturesStatistics,TrainOGRLayersClassifier

