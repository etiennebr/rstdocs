Image Conversion
^^^^^^^^^^^^^^^^

Convert an image to a different format, eventually rescaling the data and/or changing the pixel type.

Detailed description
--------------------

This application performs an image pixel type conversion (short, ushort, uchar, int, uint, float and double types are handled). The output image is written in the specified format (ie. that corresponds to the given extension).
 The conversion can include a rescale using the image 2 percent minimum and maximum values. The rescale can be linear or log2.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *Convert* .

.. [#] Table: Parameters table for Image Conversion.

+-----------------+--------------------------+----------------------------------+
|Parameter Key    |Parameter Type            |Parameter Description             |
+=================+==========================+==================================+
|in               |Input image               |Input image                       |
+-----------------+--------------------------+----------------------------------+
|type             |Choices                   |Choices                           |
+-----------------+--------------------------+----------------------------------+
|type none        | *Choice*                 |None                              |
+-----------------+--------------------------+----------------------------------+
|type linear      | *Choice*                 |Linear                            |
+-----------------+--------------------------+----------------------------------+
|type log2        | *Choice*                 |Log2                              |
+-----------------+--------------------------+----------------------------------+
|type.linear.gamma|Float                     |Float                             |
+-----------------+--------------------------+----------------------------------+
|mask             |Input image               |Input image                       |
+-----------------+--------------------------+----------------------------------+
|hcp              |Group                     |Group                             |
+-----------------+--------------------------+----------------------------------+
|hcp.high         |Float                     |Float                             |
+-----------------+--------------------------+----------------------------------+
|hcp.low          |Float                     |Float                             |
+-----------------+--------------------------+----------------------------------+
|out              |Output image              |Output image                      |
+-----------------+--------------------------+----------------------------------+
|ram              |Int                       |Int                               |
+-----------------+--------------------------+----------------------------------+
|inxml            |XML input parameters file |XML input parameters file         |
+-----------------+--------------------------+----------------------------------+
|outxml           |XML output parameters file|XML output parameters file        |
+-----------------+--------------------------+----------------------------------+

**Input image**
Input image.

**Rescale type**
Transfer function for the rescaling. Available choices are: 

- **None**


- **Linear**


 - **Gamma correction factor** : Gamma correction factor.


 - **Log2**



**Input mask**
The masked pixels won't be used to adapt the dynamic (the mask must have the same dimensions as the input image).

**Histogram Cutting Parameters**
Parameters to cut the histogram edges before rescaling.

- **High Cut Quantile:** Quantiles to cut from histogram high values before computing min/max rescaling (in percent, 2 by default).

- **Low Cut Quantile:** Quantiles to cut from histogram low values before computing min/max rescaling (in percent, 2 by default).



**Output Image**
Output image.

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

	otbcli_Convert -in QB_Toulouse_Ortho_XS.tif -out otbConvertWithScalingOutput.png uint8 -type linear

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the Convert application 
	Convert = otbApplication.Registry.CreateApplication("Convert")

	# The following lines set all the application parameters:
	Convert.SetParameterString("in", "QB_Toulouse_Ortho_XS.tif")

	Convert.SetParameterString("out", "otbConvertWithScalingOutput.png")
	Convert.SetParameterOutputImagePixelType("out", 1)

	Convert.SetParameterString("type","linear")

	# The following line execute the application
	Convert.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

None

Authors
~~~~~~~

This application has been written by OTB-Team.

See Also
~~~~~~~~

These additional ressources can be useful for further information: 

Rescale

