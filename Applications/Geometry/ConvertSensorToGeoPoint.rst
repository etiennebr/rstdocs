Convert Sensor Point To Geographic Point
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Sensor to geographic coordinates conversion.

Detailed description
--------------------

This Application converts a sensor point of an input image to a geographic point using the Forward Sensor Model of the input image.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{ConvertSensorToGeoPoint_param_table}, page~\pageref{ConvertSensorToGeoPoint_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+ConvertSensorToGeoPoint+.

Parameters table for Convert Sensor Point To Geographic Point:

+--------------+--------------------------+---------------------------------------+
|Parameter Key |Parameter Type            |Parameter Description                  |
+==============+==========================+=======================================+
|in            |Input image               |Input image                            |
+--------------+--------------------------+---------------------------------------+
|input         |Group                     |Group                                  |
+--------------+--------------------------+---------------------------------------+
|input.idx     |Float                     |Float                                  |
+--------------+--------------------------+---------------------------------------+
|input.idy     |Float                     |Float                                  |
+--------------+--------------------------+---------------------------------------+
|output        |Group                     |Group                                  |
+--------------+--------------------------+---------------------------------------+
|output.idx    |Float                     |Float                                  |
+--------------+--------------------------+---------------------------------------+
|output.idy    |Float                     |Float                                  |
+--------------+--------------------------+---------------------------------------+
|output.town   |String                    |String                                 |
+--------------+--------------------------+---------------------------------------+
|output.country|String                    |String                                 |
+--------------+--------------------------+---------------------------------------+
|inxml         |XML input parameters file |XML input parameters file              |
+--------------+--------------------------+---------------------------------------+
|outxml        |XML output parameters file|XML output parameters file             |
+--------------+--------------------------+---------------------------------------+

**Sensor image**
Input sensor image.

**Point Coordinates**


- **X value of desired point:** X coordinate of the point to transform.

- **Y value of desired point:** Y coordinate of the point to transform.



**Geographic Coordinates**


- **Output Point Longitude:** Output point longitude coordinate.

- **Output Point Latitude:** Output point latitude coordinate.

- **Main town near the coordinates computed:** Nearest main town of the computed geographic point.

- **Country of the image:** Country of the input image.



**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_ConvertSensorToGeoPoint -in QB_TOULOUSE_MUL_Extract_500_500.tif -input.idx 200 -input.idy 200

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ConvertSensorToGeoPoint application 
	ConvertSensorToGeoPoint = otbApplication.Registry.CreateApplication("ConvertSensorToGeoPoint")

	# The following lines set all the application parameters:
	ConvertSensorToGeoPoint.SetParameterString("in", "QB_TOULOUSE_MUL_Extract_500_500.tif")

	ConvertSensorToGeoPoint.SetParameterFloat("input.idx", 200)

	ConvertSensorToGeoPoint.SetParameterFloat("input.idy", 200)

	# The following line execute the application
	ConvertSensorToGeoPoint.ExecuteAndWriteOutput()

:Limitations:

None

:Authors:

This application has been written by OTB-Team.

:See Also:

These additional ressources can be useful for further information: 

ConvertCartoToGeoPoint application, otbObtainUTMZoneFromGeoPoint

