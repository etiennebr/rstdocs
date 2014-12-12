Rescale Image
^^^^^^^^^^^^^

Rescale the image between two given values.

Detailed description
--------------------

This application scales the given image pixel intensity between two given values. By default min (resp. max) value is set to 0 (resp. 255).

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{Rescale_param_table}, page~\pageref{Rescale_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+Rescale+.

Parameters table for Rescale Image:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|outmin       |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|outmax       |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Image:** The image to scale.

- **Output Image:** The rescaled image filename.

- **Available RAM (Mb):** Available memory for processing (in MB).

- **Output min value:** Minimum value of the output image.

- **Output max value:** Maximum value of the output image.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_Rescale -in QB_Toulouse_Ortho_PAN.tif -out rescaledImage.png uchar -outmin 0 -outmax 255

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the Rescale application 
	Rescale = otbApplication.Registry.CreateApplication("Rescale")

	# The following lines set all the application parameters:
	Rescale.SetParameterString("in", "QB_Toulouse_Ortho_PAN.tif")

	Rescale.SetParameterString("out", "rescaledImage.png")
	Rescale.SetParameterOutputImagePixelType("out", 1)

	Rescale.SetParameterFloat("outmin", 0)

	Rescale.SetParameterFloat("outmax", 255)

	# The following line execute the application
	Rescale.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

