Local Statistic Extraction
^^^^^^^^^^^^^^^^^^^^^^^^^^

Computes local statistical moments on every pixel in the selected channel of the input image

Detailed description
--------------------

This application computes the 4 local statistical moments on every pixel in the selected channel of the input image, over a specified neighborhood. The output image is multi band with one statistical moment (feature) per band. Thus, the 4 output features are the Mean, the Variance, the Skewness and the Kurtosis. They are provided in this exact order in the output image.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{LocalStatisticExtraction_param_table}, page~\pageref{LocalStatisticExtraction_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+LocalStatisticExtraction+.

Parameters table for Local Statistic Extraction:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|channel      |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|radius       |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Image:** The input image to compute the features on.

- **Selected Channel:** The selected channel index.

- **Available RAM (Mb):** Available memory for processing (in MB).

- **Neighborhood radius:** The computational window radius.

- **Feature Output Image:** Output image containing the local statistical moments.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_LocalStatisticExtraction -in qb_RoadExtract.tif -channel 1 -radius 3 -out Statistics.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the LocalStatisticExtraction application 
	LocalStatisticExtraction = otbApplication.Registry.CreateApplication("LocalStatisticExtraction")

	# The following lines set all the application parameters:
	LocalStatisticExtraction.SetParameterString("in", "qb_RoadExtract.tif")

	LocalStatisticExtraction.SetParameterInt("channel", 1)

	LocalStatisticExtraction.SetParameterInt("radius", 3)

	LocalStatisticExtraction.SetParameterString("out", "Statistics.tif")

	# The following line execute the application
	LocalStatisticExtraction.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

otbRadiometricMomentsImageFunction class

