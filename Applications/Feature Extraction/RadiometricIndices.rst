Radiometric Indices
^^^^^^^^^^^^^^^^^^^

Compute radiometric indices.

Detailed description
--------------------

This application computes radiometric indices using the relevant channels of the input image. The output is a multi band image into which each channel is one of the selected indices.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *RadiometricIndices* .

.. [#] Table: Parameters table for Radiometric Indices.

+--------------+--------------------------+----------------------------------+
|Parameter Key |Parameter Type            |Parameter Description             |
+==============+==========================+==================================+
|in            |Input image               |Input image                       |
+--------------+--------------------------+----------------------------------+
|out           |Output image              |Output image                      |
+--------------+--------------------------+----------------------------------+
|ram           |Int                       |Int                               |
+--------------+--------------------------+----------------------------------+
|channels      |Group                     |Group                             |
+--------------+--------------------------+----------------------------------+
|channels.blue |Int                       |Int                               |
+--------------+--------------------------+----------------------------------+
|channels.green|Int                       |Int                               |
+--------------+--------------------------+----------------------------------+
|channels.red  |Int                       |Int                               |
+--------------+--------------------------+----------------------------------+
|channels.nir  |Int                       |Int                               |
+--------------+--------------------------+----------------------------------+
|channels.mir  |Int                       |Int                               |
+--------------+--------------------------+----------------------------------+
|list          |List                      |List                              |
+--------------+--------------------------+----------------------------------+
|inxml         |XML input parameters file |XML input parameters file         |
+--------------+--------------------------+----------------------------------+
|outxml        |XML output parameters file|XML output parameters file        |
+--------------+--------------------------+----------------------------------+

**Input Image**
Input image.

**Output Image**
Radiometric indices output image.

**Available RAM (Mb)**
Available memory for processing (in MB).

**Channels selection**
Channels selection.

- **Blue Channel:** Blue channel index.

- **Green Channel:** Green channel index.

- **Red Channel:** Red channel index.

- **NIR Channel:** NIR channel index.

- **Mir Channel:** Mir channel index.



**Available Radiometric Indices**
List of available radiometric indices with their relevant channels in brackets:          Vegetation:NDVI - Normalized difference vegetation index (Red, NIR)         Vegetation:TNDVI - Transformed normalized difference vegetation index (Red, NIR)         Vegetation:RVI - Ratio vegetation index (Red, NIR)         Vegetation:SAVI - Soil adjusted vegetation index (Red, NIR)         Vegetation:TSAVI - Transformed soil adjusted vegetation index (Red, NIR)         Vegetation:MSAVI - Modified soil adjusted vegetation index (Red, NIR)         Vegetation:MSAVI2 - Modified soil adjusted vegetation index 2 (Red, NIR)         Vegetation:GEMI - Global environment monitoring index (Red, NIR)         Vegetation:IPVI - Infrared percentage vegetation index (Red, NIR)                  Water:NDWI - Normalized difference water index (Gao 1996) (NIR, MIR)         Water:NDWI2 - Normalized difference water index (Mc Feeters 1996) (Green, NIR)         Water:MNDWI - Modified normalized difference water index (Xu 2006) (Green, MIR)         Water:NDPI - Normalized difference pond index (Lacaux et al.) (MIR, Green)         Water:NDTI - Normalized difference turbidity index (Lacaux et al.) (Red, Green)                  Soil:RI - Redness index (Red, Green)         Soil:CI - Color index (Red, Green)         Soil:BI - Brightness index (Red, Green)         Soil:BI2 - Brightness index 2 (NIR, Red, Green).

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_RadiometricIndices -in qb_RoadExtract.tif -list Vegetation:NDVI Vegetation:RVI Vegetation:IPVI -out RadiometricIndicesImage.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the RadiometricIndices application 
	RadiometricIndices = otbApplication.Registry.CreateApplication("RadiometricIndices")

	# The following lines set all the application parameters:
	RadiometricIndices.SetParameterString("in", "qb_RoadExtract.tif")

	# The following line execute the application
	RadiometricIndices.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

None

Authors
~~~~~~~

This application has been written by OTB-Team.

See Also
~~~~~~~~

These additional ressources can be useful for further information: 

otbVegetationIndicesFunctor, otbWaterIndicesFunctor and otbSoilIndicesFunctor classes

