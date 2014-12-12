Multivariate alteration detector
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Multivariate Alteration Detector

Detailed description
--------------------

This application detects change between two given images.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{MultivariateAlterationDetector_param_table}, page~\pageref{MultivariateAlterationDetector_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+MultivariateAlterationDetector+.

Parameters table for Multivariate alteration detector:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in1          |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|in2          |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Image 1:** Image which describe initial state of the scene.
- **Input Image 2:** Image which describe scene after perturbations.
- **Change Map:** Image of detected changes.
- **Available RAM (Mb):** Available memory for processing (in MB)
- **Load otb application from xml file:** Load otb application from xml file
- **Save otb application to xml file:** Save otb application to xml file


Example
-------

To run this example in command-line, use the following: 
::

	otbcli_MultivariateAlterationDetector -in1 Spot5-Gloucester-before.tif -in2 Spot5-Gloucester-after.tif -out detectedChangeImage.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the MultivariateAlterationDetector application 
	MultivariateAlterationDetector = otbApplication.Registry.CreateApplication("MultivariateAlterationDetector")

	# The following lines set all the application parameters:
	MultivariateAlterationDetector.SetParameterString("in1", "Spot5-Gloucester-before.tif")

	MultivariateAlterationDetector.SetParameterString("in2", "Spot5-Gloucester-after.tif")

	MultivariateAlterationDetector.SetParameterString("out", "detectedChangeImage.tif")

	# The following line execute the application
	MultivariateAlterationDetector.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information
