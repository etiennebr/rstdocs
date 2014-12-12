Vertex Component Analysis
^^^^^^^^^^^^^^^^^^^^^^^^^

Find endmembers in hyperspectral images with Vertex Component Analysis

Detailed description
--------------------

Applies the Vertex Component Analysis to an hyperspectral image to extract endmembers

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{VertexComponentAnalysis_param_table}, page~\pageref{VertexComponentAnalysis_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+VertexComponentAnalysis+.

Parameters table for Vertex Component Analysis:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|ne           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|outendm      |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|rand         |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Image:** Input hyperspectral data cube
- **Number of endmembers:** The number of endmembers to extract from the data cube
- **Output Endmembers:** The endmebers, stored in a one-line multi-spectral image, each pixel representing an endmember
- **set user defined seed:** Set specific seed. with integer value.
- **Load otb application from xml file:** Load otb application from xml file
- **Save otb application to xml file:** Save otb application to xml file


Example
-------

To run this example in command-line, use the following: 
::

	otbcli_VertexComponentAnalysis -in cupriteSubHsi.tif -ne 5 -outendm VertexComponentAnalysis.tif double

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the VertexComponentAnalysis application 
	VertexComponentAnalysis = otbApplication.Registry.CreateApplication("VertexComponentAnalysis")

	# The following lines set all the application parameters:
	VertexComponentAnalysis.SetParameterString("in", "cupriteSubHsi.tif")

	VertexComponentAnalysis.SetParameterInt("ne", 5)

	VertexComponentAnalysis.SetParameterString("outendm", "VertexComponentAnalysis.tif")
	VertexComponentAnalysis.SetParameterOutputImagePixelType("outendm", 7)

	# The following line execute the application
	VertexComponentAnalysis.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

