Exact Large-Scale Mean-Shift segmentation, step 1 (smoothing)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Perform mean shift filtering

Detailed description
--------------------

This application performs mean shift fitlering (multi-threaded).

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *MeanShiftSmoothing* .

.. [#] Table: Parameters table for Exact Large-Scale Mean-Shift segmentation, step 1 (smoothing).

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|fout         |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|foutpos      |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|spatialr     |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|ranger       |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|thres        |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|maxiter      |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|rangeramp    |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|modesearch   |Boolean                   |Boolean                           |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Image:** The input image.

- **Filtered output:** The filtered output image.

- **Spatial image:**  The spatial image output. Spatial image output is a displacement map (pixel position after convergence).

- **Available RAM (Mb):** Available memory for processing (in MB).

- **Spatial radius:** Spatial radius of the neighborhood.

- **Range radius:** Range radius defining the radius (expressed in radiometry unit) in the multi-spectral space.

- **Mode convergence threshold:** Algorithm iterative scheme will stop if mean-shift vector is below this threshold or if iteration number reached maximum number of iterations.

- **Maximum number of iterations:** Algorithm iterative scheme will stop if convergence hasn't been reached after the maximum number of iterations.

- **Range radius coefficient:** This coefficient makes dependent the ranger of the colorimetry of the filtered pixel : y = rangeramp\*x+ranger.

- **Mode search.:** If activated pixel iterative convergence is stopped if the path . Be careful, with this option, the result will slightly depend on thread number.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_MeanShiftSmoothing -in maur_rgb.png -fout MeanShift_FilterOutput.tif -foutpos MeanShift_SpatialOutput.tif -spatialr 16 -ranger 16 -thres 0.1 -maxiter 100

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the MeanShiftSmoothing application 
	MeanShiftSmoothing = otbApplication.Registry.CreateApplication("MeanShiftSmoothing")

	# The following lines set all the application parameters:
	MeanShiftSmoothing.SetParameterString("in", "maur_rgb.png")

	MeanShiftSmoothing.SetParameterString("fout", "MeanShift_FilterOutput.tif")

	MeanShiftSmoothing.SetParameterString("foutpos", "MeanShift_SpatialOutput.tif")

	MeanShiftSmoothing.SetParameterInt("spatialr", 16)

	MeanShiftSmoothing.SetParameterFloat("ranger", 16)

	MeanShiftSmoothing.SetParameterFloat("thres", 0.1)

	MeanShiftSmoothing.SetParameterInt("maxiter", 100)

	# The following line execute the application
	MeanShiftSmoothing.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

With mode search option, the result will slightly depend on thread number.

Authors
~~~~~~~

This application has been written by OTB-Team.

