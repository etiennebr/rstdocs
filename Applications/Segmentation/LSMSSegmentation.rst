Exact Large-Scale Mean-Shift segmentation, step 2
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Second step of the exact Large-Scale Mean-Shift segmentation workflow.

Detailed description
--------------------

This application performs the second step of the exact LargeScale MeanShift segmentation workflow (LSMS). Filtered range image and spatial image should be created with the MeanShiftSmoothing application, with modesearch parameter disabled. If spatial image is not set, the application will only process the range image and spatial radius parameter will not be taken into account. This application will produce a labeled image where neighbor pixels whose range distance is below range radius (and optionally spatial distance below spatial radius) will be grouped together into the same cluster. For large images one can use the nbtilesx and nbtilesy parameters for tilewise processing, with the guarantees of identical results. Please note that this application will generate a lot of temporary files (as many as the number of tiles), and will therefore require twice the size of the final result in term of disk space. The cleanup option (activated by default) allows to remove all temporary file as soon as they are not needed anymore (if cleanup is activated, tmpdir set and tmpdir does not exists before running the application, it will be removed as well during cleanup). The tmpdir option allows to define a directory where to write the temporary files. Please also note that the output image type should be set to uint32 to ensure that there are enough labels available.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{LSMSSegmentation_param_table}, page~\pageref{LSMSSegmentation_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+LSMSSegmentation+.

Parameters table for Exact Large-Scale Mean-Shift segmentation, step 2:

+-------------+--------------------------+----------------------------------------+
|Parameter Key|Parameter Type            |Parameter Description                   |
+=============+==========================+========================================+
|in           |Input image               |Input image                             |
+-------------+--------------------------+----------------------------------------+
|inpos        |Input image               |Input image                             |
+-------------+--------------------------+----------------------------------------+
|out          |Output image              |Output image                            |
+-------------+--------------------------+----------------------------------------+
|ranger       |Float                     |Float                                   |
+-------------+--------------------------+----------------------------------------+
|spatialr     |Float                     |Float                                   |
+-------------+--------------------------+----------------------------------------+
|minsize      |Int                       |Int                                     |
+-------------+--------------------------+----------------------------------------+
|tilesizex    |Int                       |Int                                     |
+-------------+--------------------------+----------------------------------------+
|tilesizey    |Int                       |Int                                     |
+-------------+--------------------------+----------------------------------------+
|tmpdir       |Directory                 |Directory                               |
+-------------+--------------------------+----------------------------------------+
|cleanup      |Boolean                   |Boolean                                 |
+-------------+--------------------------+----------------------------------------+
|inxml        |XML input parameters file |XML input parameters file               |
+-------------+--------------------------+----------------------------------------+
|outxml       |XML output parameters file|XML output parameters file              |
+-------------+--------------------------+----------------------------------------+

- **Filtered image:** The filtered image (cf. Adaptive MeanShift Smoothing application).
- **Spatial image:**  The spatial image. Spatial input is the displacement map (output of the Adaptive MeanShift Smoothing application).
- **Output Image:** The output image. The output image is the segmentation of the filtered image. It is recommended to set the pixel type to uint32.
- **Range radius:** Range radius defining the radius (expressed in radiometry unit) in the multi-spectral space.
- **Spatial radius:** Spatial radius of the neighborhood.
- **Minimum Region Size:** Minimum Region Size. If, after the segmentation, a region is of size lower than this criterion, the region is deleted.
- **Size of tiles in pixel (X-axis):** Size of tiles along the X-axis.
- **Size of tiles in pixel (Y-axis):** Size of tiles along the Y-axis.
- **Directory where to write temporary files:** This applications need to write temporary files for each tile. This parameter allows choosing the path where to write those files. If disabled, the current path will be used.
- **Temporary files cleaning:** If activated, the application will try to clean all temporary files it created
- **Load otb application from xml file:** Load otb application from xml file
- **Save otb application to xml file:** Save otb application to xml file


Example
-------

To run this example in command-line, use the following: 
::

	otbcli_LSMSSegmentation -in smooth.tif -inpos position.tif -out segmentation.tif -ranger 15 -spatialr 5 -minsize 0 -tilesizex 256 -tilesizey 256

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the LSMSSegmentation application 
	LSMSSegmentation = otbApplication.Registry.CreateApplication("LSMSSegmentation")

	# The following lines set all the application parameters:
	LSMSSegmentation.SetParameterString("in", "smooth.tif")

	LSMSSegmentation.SetParameterString("inpos", "position.tif")

	LSMSSegmentation.SetParameterString("out", "segmentation.tif")

	LSMSSegmentation.SetParameterFloat("ranger", 15)

	LSMSSegmentation.SetParameterFloat("spatialr", 5)

	LSMSSegmentation.SetParameterInt("minsize", 0)

	LSMSSegmentation.SetParameterInt("tilesizex", 256)

	LSMSSegmentation.SetParameterInt("tilesizey", 256)

	# The following line execute the application
	LSMSSegmentation.ExecuteAndWriteOutput()

Limitations
-----------

This application is part of the Large-Scale Mean-Shift segmentation workflow (LSMS) and may not be suited for any other purpose.

Authors
-------

This application has been written by David Youssefi.

See Also
--------

These additional ressources can be useful for further information: 

`MeanShiftSmoothing, LSMSSmallRegionsMerging, LSMSVectorization <http://www.readthedocs.org/MeanShiftSmoothing, LSMSSmallRegionsMerging, LSMSVectorization.html>`_

