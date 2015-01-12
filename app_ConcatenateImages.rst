Images Concatenation
^^^^^^^^^^^^^^^^^^^^

Concatenate a list of images of the same size into a single multi-channel one.

Detailed description
--------------------

This application performs images channels concatenation. It will walk the input image list (single or multi-channel) and generates a single multi-channel image. The channel order is the one of the list.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *ConcatenateImages* .

.. [#] Table: Parameters table for Images Concatenation.

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|il           |Input image list          |Input image list                  |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input images list:** The list of images to concatenate.

- **Output Image:** The concatenated output image.

- **Available RAM (Mb):** Available memory for processing (in MB).

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_ConcatenateImages -il GomaAvant.png GomaApres.png -out otbConcatenateImages.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ConcatenateImages application 
	ConcatenateImages = otbApplication.Registry.CreateApplication("ConcatenateImages")

	# The following lines set all the application parameters:
	ConcatenateImages.SetParameterStringList("il", ['GomaAvant.png', 'GomaApres.png'])

	ConcatenateImages.SetParameterString("out", "otbConcatenateImages.tif")

	# The following line execute the application
	ConcatenateImages.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

All input images must have the same size.

Authors
~~~~~~~

This application has been written by OTB-Team.

See Also
~~~~~~~~

These additional ressources can be useful for further information: 

Rescale application, Convert

