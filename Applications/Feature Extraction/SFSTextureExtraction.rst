SFS Texture Extraction
^^^^^^^^^^^^^^^^^^^^^^

Computes Structural Feature Set textures on every pixel of the input image selected channel

Detailed description
--------------------

This application computes SFS textures on a mono band image

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{SFSTextureExtraction_param_table}, page~\pageref{SFSTextureExtraction_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+SFSTextureExtraction+.

Parameters table for SFS Texture Extraction:

+------------------+--------------------------+----------------------------------+
|Parameter Key     |Parameter Type            |Parameter Description             |
+==================+==========================+==================================+
|in                |Input image               |Input image                       |
+------------------+--------------------------+----------------------------------+
|channel           |Int                       |Int                               |
+------------------+--------------------------+----------------------------------+
|ram               |Int                       |Int                               |
+------------------+--------------------------+----------------------------------+
|parameters        |Group                     |Group                             |
+------------------+--------------------------+----------------------------------+
|parameters.spethre|Float                     |Float                             |
+------------------+--------------------------+----------------------------------+
|parameters.spathre|Int                       |Int                               |
+------------------+--------------------------+----------------------------------+
|parameters.nbdir  |Int                       |Int                               |
+------------------+--------------------------+----------------------------------+
|parameters.alpha  |Float                     |Float                             |
+------------------+--------------------------+----------------------------------+
|parameters.maxcons|Int                       |Int                               |
+------------------+--------------------------+----------------------------------+
|out               |Output image              |Output image                      |
+------------------+--------------------------+----------------------------------+
|inxml             |XML input parameters file |XML input parameters file         |
+------------------+--------------------------+----------------------------------+
|outxml            |XML output parameters file|XML output parameters file        |
+------------------+--------------------------+----------------------------------+

**Input Image**
The input image to compute the features on.

**Selected Channel**
The selected channel index

**Available RAM (Mb)**
Available memory for processing (in MB)

**Texture feature parameters**
This group of parameters allows to define SFS texture parameters.    The available texture features are SFS'Length, SFS'Width, SFS'PSI, SFS'W-Mean, SFS'Ratio and SFS'SD.    They are provided in this exact order in the output image.

- **Spectral Threshold:** Spectral Threshold

- **Spatial Threshold:** Spatial Threshold

- **Number of Direction:** Number of Direction

- **Alpha:** Alpha

- **Ratio Maximum Consideration Number:** Ratio Maximum Consideration Number



**Feature Output Image**
Output image containing the SFS texture features.

**Load otb application from xml file**
Load otb application from xml file

**Save otb application to xml file**
Save otb application to xml file

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_SFSTextureExtraction -in qb_RoadExtract.tif -channel 1 -parameters.spethre 50.0 -parameters.spathre 100 -out SFSTextures.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the SFSTextureExtraction application 
	SFSTextureExtraction = otbApplication.Registry.CreateApplication("SFSTextureExtraction")

	# The following lines set all the application parameters:
	SFSTextureExtraction.SetParameterString("in", "qb_RoadExtract.tif")

	SFSTextureExtraction.SetParameterInt("channel", 1)

	SFSTextureExtraction.SetParameterFloat("parameters.spethre", 50.0)

	SFSTextureExtraction.SetParameterInt("parameters.spathre", 100)

	SFSTextureExtraction.SetParameterString("out", "SFSTextures.tif")

	# The following line execute the application
	SFSTextureExtraction.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

`otbSFSTexturesImageFilter class <http://www.readthedocs.org/otbSFSTexturesImageFilter class.html>`_

