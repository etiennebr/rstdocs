Pixel Value
^^^^^^^^^^^

Get the value of a pixel.

Detailed description
--------------------

Get the value of a pixel.Pay attention, index starts at 0.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{PixelValue_param_table}, page~\pageref{PixelValue_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+PixelValue+.

Parameters table for Pixel Value:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|coordx       |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|coordy       |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|cl           |List                      |List                              |
+-------------+--------------------------+----------------------------------+
|value        |String                    |String                            |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Image:** Input image.

- **Col index:** Column index of the wanted pixel (starts at 0).

- **Line index:** Line index of the wanted pixel (starts at 0).

- **Channels:** Displayed channels.

- **Pixel Value:** Pixel radiometric value.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_PixelValue -in QB_Toulouse_Ortho_XS.tif -coordx 50 -coordy 100 -cl Channel1

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the PixelValue application 
	PixelValue = otbApplication.Registry.CreateApplication("PixelValue")

	# The following lines set all the application parameters:
	PixelValue.SetParameterString("in", "QB_Toulouse_Ortho_XS.tif")

	PixelValue.SetParameterInt("coordx", 50)

	PixelValue.SetParameterInt("coordy", 100)

	# The following line execute the application
	PixelValue.ExecuteAndWriteOutput()

:Limitations:

None

:Authors:

This application has been written by OTB-Team.

