Compute Images second order statistics
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Computes global mean and standard deviation for each band from a set of images and optionally saves the results in an XML file.

Detailed description
--------------------

This application computes a global mean and standard deviation for each band of a set of images and optionally saves the results in an XML file. The output XML is intended to be used an input for the TrainImagesClassifier application to normalize samples before learning.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{ComputeImagesStatistics_param_table}, page~\pageref{ComputeImagesStatistics_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+ComputeImagesStatistics+.

Parameters table for Compute Images second order statistics:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|il           |Input image list          |Input image list                  |
+-------------+--------------------------+----------------------------------+
|bv           |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|out          |Output File name          |Output File name                  |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input images:** List of input images filenames.

- **Background Value:** Background value to ignore in statistics computation.

- **Output XML file:** XML filename where the statistics are saved for future reuse.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_ComputeImagesStatistics -il QB_1_ortho.tif -out EstimateImageStatisticsQB1.xml

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ComputeImagesStatistics application 
	ComputeImagesStatistics = otbApplication.Registry.CreateApplication("ComputeImagesStatistics")

	# The following lines set all the application parameters:
	ComputeImagesStatistics.SetParameterStringList("il", ['QB_1_ortho.tif'])

	ComputeImagesStatistics.SetParameterString("out", "EstimateImageStatisticsQB1.xml")

	# The following line execute the application
	ComputeImagesStatistics.ExecuteAndWriteOutput()

Limitations
-----------

Each image of the set must contain the same bands as the others (i.e. same types, in the same order).

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

Documentation of the TrainImagesClassifier application.

