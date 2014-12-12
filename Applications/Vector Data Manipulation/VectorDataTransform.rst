Vector Data Transformation
^^^^^^^^^^^^^^^^^^^^^^^^^^

Apply a transform to each vertex of the input VectorData

Detailed description
--------------------

This application performs a transformation of an input vector data transforming each vertex in the vector data. The applied transformation manages translation, rotation and scale, and can be centered or not.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{VectorDataTransform_param_table}, page~\pageref{VectorDataTransform_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+VectorDataTransform+.

Parameters table for Vector Data Transformation:

+-----------------+--------------------------+----------------------------------+
|Parameter Key    |Parameter Type            |Parameter Description             |
+=================+==========================+==================================+
|vd               |Input vector data         |Input vector data                 |
+-----------------+--------------------------+----------------------------------+
|out              |Output vector data        |Output vector data                |
+-----------------+--------------------------+----------------------------------+
|in               |Input image               |Input image                       |
+-----------------+--------------------------+----------------------------------+
|transform        |Group                     |Group                             |
+-----------------+--------------------------+----------------------------------+
|transform.tx     |Float                     |Float                             |
+-----------------+--------------------------+----------------------------------+
|transform.ty     |Float                     |Float                             |
+-----------------+--------------------------+----------------------------------+
|transform.ro     |Float                     |Float                             |
+-----------------+--------------------------+----------------------------------+
|transform.centerx|Float                     |Float                             |
+-----------------+--------------------------+----------------------------------+
|transform.centery|Float                     |Float                             |
+-----------------+--------------------------+----------------------------------+
|transform.scale  |Float                     |Float                             |
+-----------------+--------------------------+----------------------------------+
|inxml            |XML input parameters file |XML input parameters file         |
+-----------------+--------------------------+----------------------------------+
|outxml           |XML output parameters file|XML output parameters file        |
+-----------------+--------------------------+----------------------------------+

**Input Vector data**
Input vector data to transform.

**Output Vector data**
Output transformed vector data.

**Support image**
Image needed as a support to the vector data.

**Transform parameters**
Group of parameters to define the transform.

- **Translation X:** Translation in the X direction (in pixels).

- **Translation Y:** Translation in the Y direction (in pixels).

- **Rotation Angle:** Angle of the rotation to apply in degrees.

- **Center X:** X coordinate of the rotation center (in physical units).

- **Center Y:** Y coordinate of the rotation center (in physical units).

- **Scale:** The scale to apply.



**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_VectorDataTransform -vd qb_RoadExtract_easyClassification.shp -in qb_RoadExtract.tif -out VectorDataTransform.shp -transform.ro 5

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the VectorDataTransform application 
	VectorDataTransform = otbApplication.Registry.CreateApplication("VectorDataTransform")

	# The following lines set all the application parameters:
	VectorDataTransform.SetParameterString("vd", "qb_RoadExtract_easyClassification.shp")

	VectorDataTransform.SetParameterString("in", "qb_RoadExtract.tif")

	VectorDataTransform.SetParameterString("out", "VectorDataTransform.shp")

	VectorDataTransform.SetParameterFloat("transform.ro", 5)

	# The following line execute the application
	VectorDataTransform.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

