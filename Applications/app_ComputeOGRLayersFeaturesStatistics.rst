ComputeOGRLayersFeaturesStatistics
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compute statistics of the features in a set of OGR Layers

Detailed description
--------------------

Compute statistics (mean and standard deviation) of the features in a set of OGR Layers, and write them in an XML file. This XML file can then be used by the training application.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *ComputeOGRLayersFeaturesStatistics* .

.. [#] Table: Parameters table for ComputeOGRLayersFeaturesStatistics.

+-------------+--------------------------+------------------------------------------------------+
|Parameter Key|Parameter Type            |Parameter Description                                 |
+=============+==========================+======================================================+
|inshp        |Input File name           |Input File name                                       |
+-------------+--------------------------+------------------------------------------------------+
|outstats     |Input File name           |Input File name                                       |
+-------------+--------------------------+------------------------------------------------------+
|feat         |List                      |List                                                  |
+-------------+--------------------------+------------------------------------------------------+
|inxml        |XML input parameters file |XML input parameters file                             |
+-------------+--------------------------+------------------------------------------------------+
|outxml       |XML output parameters file|XML output parameters file                            |
+-------------+--------------------------+------------------------------------------------------+

- **Name of the input shapefile:** Name of the input shapefile.

- **XML file containing mean and variance of each feature.:** XML file containing mean and variance of each feature.

- **List of features to consider for statistics.:** List of features to consider for statistics.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_ComputeOGRLayersFeaturesStatistics -inshp vectorData.shp -outstats results.xml -feat perimeter

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ComputeOGRLayersFeaturesStatistics application 
	ComputeOGRLayersFeaturesStatistics = otbApplication.Registry.CreateApplication("ComputeOGRLayersFeaturesStatistics")

	# The following lines set all the application parameters:
	ComputeOGRLayersFeaturesStatistics.SetParameterString("inshp", "vectorData.shp")

	ComputeOGRLayersFeaturesStatistics.SetParameterString("outstats", "results.xml")

	# The following line execute the application
	ComputeOGRLayersFeaturesStatistics.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

Experimental. For now only shapefiles are supported.

Authors
~~~~~~~

This application has been written by David Youssefi during internship at CNES.

See Also
~~~~~~~~

These additional ressources can be useful for further information: 

OGRLayerClassifier,TrainOGRLayersClassifier

