Vector data set field
^^^^^^^^^^^^^^^^^^^^^

Set a field in vector data.

Detailed description
--------------------

Set a specified field to a specified value on all features of a vector data.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{VectorDataSetField_param_table}, page~\pageref{VectorDataSetField_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+VectorDataSetField+.

Parameters table for Vector data set field:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input vector data         |Input vector data                 |
+-------------+--------------------------+----------------------------------+
|out          |Output vector data        |Output vector data                |
+-------------+--------------------------+----------------------------------+
|fn           |String                    |String                            |
+-------------+--------------------------+----------------------------------+
|fv           |String                    |String                            |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input:** Input Vector Data.

- **Output:** Output Vector Data.

- **Field:** Field name.

- **Value:** Field value.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_VectorDataSetField -in qb_RoadExtract_classification.shp -out VectorDataSetField.shp -fn Info -fv Sample polygon

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the VectorDataSetField application 
	VectorDataSetField = otbApplication.Registry.CreateApplication("VectorDataSetField")

	# The following lines set all the application parameters:
	VectorDataSetField.SetParameterString("in", "qb_RoadExtract_classification.shp")

	VectorDataSetField.SetParameterString("out", "VectorDataSetField.shp")

	VectorDataSetField.SetParameterString("fn", "Info")

	VectorDataSetField.SetParameterString("fv", "Sample polygon")

	# The following line execute the application
	VectorDataSetField.ExecuteAndWriteOutput()

:Limitations:

Doesn't work with KML files yet

:Authors:

This application has been written by OTB-Team.

