Obtain UTM Zone From Geo Point
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

UTM zone determination from a geographic point.

Detailed description
--------------------

This application returns the UTM zone of an input geographic point.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{ObtainUTMZoneFromGeoPoint_param_table}, page~\pageref{ObtainUTMZoneFromGeoPoint_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+ObtainUTMZoneFromGeoPoint+.

Parameters table for Obtain UTM Zone From Geo Point:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|lat          |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|lon          |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|utm          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Latitude:** Latitude value of desired point.
- **Longitude:** Longitude value of desired point.
- **UTMZone:** UTM Zone
- **Load otb application from xml file:** Load otb application from xml file
- **Save otb application to xml file:** Save otb application to xml file


Example
-------

Obtain a UTM ZoneTo run this example in command-line, use the following: 
::

	otbcli_ObtainUTMZoneFromGeoPoint -lat 10.0 -lon 124.0

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ObtainUTMZoneFromGeoPoint application 
	ObtainUTMZoneFromGeoPoint = otbApplication.Registry.CreateApplication("ObtainUTMZoneFromGeoPoint")

	# The following lines set all the application parameters:
	ObtainUTMZoneFromGeoPoint.SetParameterFloat("lat", 10.0)

	ObtainUTMZoneFromGeoPoint.SetParameterFloat("lon", 124.0)

	# The following line execute the application
	ObtainUTMZoneFromGeoPoint.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

