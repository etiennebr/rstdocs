Edge Feature Extraction
^^^^^^^^^^^^^^^^^^^^^^^

Computes edge features on every pixel of the input image selected channel

Detailed description
--------------------

This application computes edge features on a mono band image

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{EdgeExtraction_param_table}, page~\pageref{EdgeExtraction_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+EdgeExtraction+.

Parameters table for Edge Feature Extraction:

+--------------------+--------------------------+----------------------------------+
|Parameter Key       |Parameter Type            |Parameter Description             |
+====================+==========================+==================================+
|in                  |Input image               |Input image                       |
+--------------------+--------------------------+----------------------------------+
|channel             |Int                       |Int                               |
+--------------------+--------------------------+----------------------------------+
|ram                 |Int                       |Int                               |
+--------------------+--------------------------+----------------------------------+
|filter              |Choices                   |Choices                           |
+--------------------+--------------------------+----------------------------------+
|filter gradient     | *Choice*                 |Gradient                          |
+--------------------+--------------------------+----------------------------------+
|filter sobel        | *Choice*                 |Sobel                             |
+--------------------+--------------------------+----------------------------------+
|filter touzi        | *Choice*                 |Touzi                             |
+--------------------+--------------------------+----------------------------------+
|filter.touzi.xradius|Int                       |Int                               |
+--------------------+--------------------------+----------------------------------+
|filter.touzi.yradius|Int                       |Int                               |
+--------------------+--------------------------+----------------------------------+
|out                 |Output image              |Output image                      |
+--------------------+--------------------------+----------------------------------+
|inxml               |XML input parameters file |XML input parameters file         |
+--------------------+--------------------------+----------------------------------+
|outxml              |XML output parameters file|XML output parameters file        |
+--------------------+--------------------------+----------------------------------+

**Input Image**
The input image to compute the features on.

**Selected Channel**
The selected channel index.

**Available RAM (Mb)**
Available memory for processing (in MB).

**Edge feature**
Choice of edge feature. Available choices are: 

- **Gradient**

- **Sobel**

- **Touzi**

 - **The X Radius** : 

 - **The Y Radius** : 



**Feature Output Image**
Output image containing the edge features.

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_EdgeExtraction -in qb_RoadExtract.tif -channel 1 -out Edges.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the EdgeExtraction application 
	EdgeExtraction = otbApplication.Registry.CreateApplication("EdgeExtraction")

	# The following lines set all the application parameters:
	EdgeExtraction.SetParameterString("in", "qb_RoadExtract.tif")

	EdgeExtraction.SetParameterInt("channel", 1)

	EdgeExtraction.SetParameterString("out", "Edges.tif")

	# The following line execute the application
	EdgeExtraction.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

otb class

