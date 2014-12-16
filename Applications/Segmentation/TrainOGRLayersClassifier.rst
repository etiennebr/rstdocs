TrainOGRLayersClassifier
^^^^^^^^^^^^^^^^^^^^^^^^

Train a SVM classifier based on labeled geometries and a list of features to consider.

Detailed description
--------------------

This application trains a SVM classifier based on labeled geometries and a list of features to consider for classification.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *TrainOGRLayersClassifier* .

.. [#] Table: Parameters table for TrainOGRLayersClassifier.

+-------------+--------------------------+------------------------------------------------------+
|Parameter Key|Parameter Type            |Parameter Description                                 |
+=============+==========================+======================================================+
|inshp        |Input File name           |Input File name                                       |
+-------------+--------------------------+------------------------------------------------------+
|instats      |Input File name           |Input File name                                       |
+-------------+--------------------------+------------------------------------------------------+
|outsvm       |Output File name          |Output File name                                      |
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

- **Output model filename.:** Output model filename.

- **List of features to consider for classification.:** List of features to consider for classification.

- **Field containing the class id for supervision:** Field containing the class id for supervision. Only geometries with this field available will be taken into account.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_TrainOGRLayersClassifier -inshp vectorData.shp -instats meanVar.xml -outsvm svmModel.svm -feat perimeter -cfield predicted

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the TrainOGRLayersClassifier application 
	TrainOGRLayersClassifier = otbApplication.Registry.CreateApplication("TrainOGRLayersClassifier")

	# The following lines set all the application parameters:
	TrainOGRLayersClassifier.SetParameterString("inshp", "vectorData.shp")

	TrainOGRLayersClassifier.SetParameterString("instats", "meanVar.xml")

	TrainOGRLayersClassifier.SetParameterString("outsvm", "svmModel.svm")

	# The following line execute the application
	TrainOGRLayersClassifier.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

Experimental. For now only shapefiles are supported. Tuning of SVM classifier is not available.

Authors
~~~~~~~

This application has been written by David Youssefi during internship at CNES.

See Also
~~~~~~~~

These additional ressources can be useful for further information: 

OGRLayerClassifier,ComputeOGRLayersFeaturesStatistics

