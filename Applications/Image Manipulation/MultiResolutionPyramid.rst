Multi Resolution Pyramid
^^^^^^^^^^^^^^^^^^^^^^^^

Build a multi-resolution pyramid of the image.

Detailed description
--------------------

This application builds a multi-resolution pyramid of the input image. User can specified the number of levels of the pyramid and the subsampling factor. To speed up the process, you can use the fast scheme option

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{MultiResolutionPyramid_param_table}, page~\pageref{MultiResolutionPyramid_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+MultiResolutionPyramid+.

Parameters table for Multi Resolution Pyramid:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|level        |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|sfactor      |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|vfactor      |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|fast         |Boolean                   |Boolean                           |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Image:** 

- **Output Image:** will be used to get the prefix and the extension of the images to write.

- **Available RAM (Mb):** Available memory for processing (in MB).

- **Number Of Levels:** Number of levels in the pyramid (default is 1).

- **Subsampling factor:** Subsampling factor between each level of the pyramid (default is 2).

- **Variance factor:** Variance factor use in smoothing. It is multiplied by the subsampling factor of each level in the  pyramid (default is 0.6).

- **Use Fast Scheme:** If used, this option allows to speed-up computation by iteratively subsampling previous level of pyramid instead of processing the full input.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_MultiResolutionPyramid -in QB_Toulouse_Ortho_XS.tif -out multiResolutionImage.tif -level 1 -sfactor 2 -vfactor 0.6 -fast false

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the MultiResolutionPyramid application 
	MultiResolutionPyramid = otbApplication.Registry.CreateApplication("MultiResolutionPyramid")

	# The following lines set all the application parameters:
	MultiResolutionPyramid.SetParameterString("in", "QB_Toulouse_Ortho_XS.tif")

	MultiResolutionPyramid.SetParameterString("out", "multiResolutionImage.tif")

	MultiResolutionPyramid.SetParameterInt("level", 1)

	MultiResolutionPyramid.SetParameterInt("sfactor", 2)

	MultiResolutionPyramid.SetParameterFloat("vfactor", 0.6)

	MultiResolutionPyramid.SetParameterString("fast","1")

	# The following line execute the application
	MultiResolutionPyramid.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

