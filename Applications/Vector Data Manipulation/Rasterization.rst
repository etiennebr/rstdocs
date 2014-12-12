Rasterization
^^^^^^^^^^^^^

Rasterize a vector dataset.

Detailed description
--------------------

This application allows to reproject and rasterize a vector dataset. The grid of the rasterized output can be set by using a reference image, or by setting all parmeters (origin, size, spacing) by hand. In the latter case, at least the spacing (ground sampling distance) is needed (other parameters are computed automatically). The rasterized output can also be in a different projection reference system than the input dataset. There are two rasterize mode available in the application. The first is the binary mode: it allows to render all pixels belonging to a geometry of the input dataset in the foreground color, while rendering the other in background color. The second one allows to render pixels belonging to a geometry woth respect to an attribute of this geometry. The field of the attribute to render can be set by the user. In the second mode, the background value is still used for unassociated pixels.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{Rasterization_param_table}, page~\pageref{Rasterization_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+Rasterization+.

Parameters table for Rasterization:

+----------------------+--------------------------+----------------------------------+
|Parameter Key         |Parameter Type            |Parameter Description             |
+======================+==========================+==================================+
|in                    |Input File name           |Input File name                   |
+----------------------+--------------------------+----------------------------------+
|out                   |Output image              |Output image                      |
+----------------------+--------------------------+----------------------------------+
|im                    |Input image               |Input image                       |
+----------------------+--------------------------+----------------------------------+
|szx                   |Int                       |Int                               |
+----------------------+--------------------------+----------------------------------+
|szy                   |Int                       |Int                               |
+----------------------+--------------------------+----------------------------------+
|epsg                  |Int                       |Int                               |
+----------------------+--------------------------+----------------------------------+
|orx                   |Float                     |Float                             |
+----------------------+--------------------------+----------------------------------+
|ory                   |Float                     |Float                             |
+----------------------+--------------------------+----------------------------------+
|spx                   |Float                     |Float                             |
+----------------------+--------------------------+----------------------------------+
|spy                   |Float                     |Float                             |
+----------------------+--------------------------+----------------------------------+
|background            |Float                     |Float                             |
+----------------------+--------------------------+----------------------------------+
|mode                  |Choices                   |Choices                           |
+----------------------+--------------------------+----------------------------------+
|mode binary           | *Choice*                 |Binary mode                       |
+----------------------+--------------------------+----------------------------------+
|mode attribute        | *Choice*                 |Attribute burning mode            |
+----------------------+--------------------------+----------------------------------+
|mode.binary.foreground|Float                     |Float                             |
+----------------------+--------------------------+----------------------------------+
|mode.attribute.field  |String                    |String                            |
+----------------------+--------------------------+----------------------------------+
|ram                   |Int                       |Int                               |
+----------------------+--------------------------+----------------------------------+
|inxml                 |XML input parameters file |XML input parameters file         |
+----------------------+--------------------------+----------------------------------+
|outxml                |XML output parameters file|XML output parameters file        |
+----------------------+--------------------------+----------------------------------+

**Input vector dataset**
The input vector dataset to be rasterized.

**Ouptut image**
An output image containing the rasterized vector dataset.

**Input reference image**
A reference image from which to import output grid and projection reference system information.

**Output size x**
Output size along x axis (useless if support image is given).

**Output size y**
Output size along y axis (useless if support image is given).

**Output EPSG code**
EPSG code for the output projection reference system (EPSG 4326 for WGS84, 32631 for UTM31N...,useless if support image is given).

**Output Upper-left x**
Output upper-left corner x coordinate (useless if support image is given).

**Output Upper-left y**
Output upper-left corner y coordinate (useless if support image is given).

**Spacing (GSD) x**
Spacing (ground sampling distance) along x axis (useless if support image is given).

**Spacing (GSD) y**
Spacing (ground sampling distance) along y axis (useless if support image is given).

**Background value**
Default value for pixels not belonging to any geometry.

**Rasterization mode**
Choice of rasterization modes. Available choices are: 

- **Binary mode** : In this mode, pixels within a geometry will hold the userdefined foreground value

 - **Foreground value** : Value for pixels inside a geometry.


- **Attribute burning mode** : In this mode, pixels within a geometry will hold the value of a userdefined field extracted from this geometry.

 - **The attribute field to burn** : Name of the attribute field to burn.



**Available RAM (Mb)**
Available memory for processing (in MB).

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_Rasterization -in qb_RoadExtract_classification.shp -out rasterImage.tif -spx 1. -spy 1.

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the Rasterization application 
	Rasterization = otbApplication.Registry.CreateApplication("Rasterization")

	# The following lines set all the application parameters:
	Rasterization.SetParameterString("in", "qb_RoadExtract_classification.shp")

	Rasterization.SetParameterString("out", "rasterImage.tif")

	Rasterization.SetParameterFloat("spx", 1.)

	Rasterization.SetParameterFloat("spy", 1.)

	# The following line execute the application
	Rasterization.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

For now, support of input dataset with multiple layers having different projection reference system is limited.

