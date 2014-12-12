Concatenate
^^^^^^^^^^^

Concatenate VectorDatas

Detailed description
--------------------

This application concatenates a list of VectorData to produce a unique VectorData as output.Note that the VectorDatas must be of the same type (Storing polygons only, lines only, or points only)

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{ConcatenateVectorData_param_table}, page~\pageref{ConcatenateVectorData_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+ConcatenateVectorData+.

Parameters table for Concatenate:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|vd           |Input vector data list    |Input vector data list            |
+-------------+--------------------------+----------------------------------+
|out          |Output vector data        |Output vector data                |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input VectorDatas to concatenate:** VectorData files to be concatenated in an unique VectorData
- **Concatenated VectorData:** Output conctenated VectorData
- **Load otb application from xml file:** Load otb application from xml file
- **Save otb application to xml file:** Save otb application to xml file


Example
-------

To run this example in command-line, use the following: 
::

	otbcli_ConcatenateVectorData -vd ToulousePoints-examples.shp ToulouseRoad-examples.shp -out ConcatenatedVectorData.shp

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ConcatenateVectorData application 
	ConcatenateVectorData = otbApplication.Registry.CreateApplication("ConcatenateVectorData")

	# The following lines set all the application parameters:
	ConcatenateVectorData.SetParameterStringList("vd", ['ToulousePoints-examples.shp', 'ToulouseRoad-examples.shp'])

	ConcatenateVectorData.SetParameterString("out", "ConcatenatedVectorData.shp")

	# The following line execute the application
	ConcatenateVectorData.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

