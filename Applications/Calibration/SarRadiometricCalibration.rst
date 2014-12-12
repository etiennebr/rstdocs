SAR Radiometric calibration
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Perform SAR calibration on input complex images

Detailed description
--------------------

This application performs SAR calibration on input complex images.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{SarRadiometricCalibration_param_table}, page~\pageref{SarRadiometricCalibration_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+SarRadiometricCalibration+.

Parameters table for SAR Radiometric calibration:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|noise        |Boolean                   |Boolean                           |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Complex Image:** Input complex image.

- **Output Image:** Output calibrated complex image.

- **Available RAM (Mb):** Available memory for processing (in MB).

- **Disable Noise:** Flag to disable noise.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_SarRadiometricCalibration -in RSAT_imagery_HH.tif -out SarRadiometricCalibration.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the SarRadiometricCalibration application 
	SarRadiometricCalibration = otbApplication.Registry.CreateApplication("SarRadiometricCalibration")

	# The following lines set all the application parameters:
	SarRadiometricCalibration.SetParameterString("in", "RSAT_imagery_HH.tif")

	SarRadiometricCalibration.SetParameterString("out", "SarRadiometricCalibration.tif")

	# The following line execute the application
	SarRadiometricCalibration.ExecuteAndWriteOutput()

:Limitations:

None

:Authors:

This application has been written by OTB-Team.

