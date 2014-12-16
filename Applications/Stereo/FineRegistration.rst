Fine Registration
^^^^^^^^^^^^^^^^^

Estimate disparity map between two images.

Detailed description
--------------------

Estimate disparity map between two images. Output image contain x offset, y offset and metric value.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *FineRegistration* .

.. [#] Table: Parameters table for Fine Registration.

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|ref          |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|sec          |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|erx          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|ery          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|mrx          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|mry          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|w            |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|wo           |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|cox          |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|coy          |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|ssrx         |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|ssry         |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|rgsx         |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|rgsy         |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|sgsx         |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|sgsy         |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|m            |String                    |String                            |
+-------------+--------------------------+----------------------------------+
|spa          |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|vmlt         |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|vmut         |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Reference Image:** The reference image.

- **Secondary Image:** The secondary image.

- **Output Image:** The output image.

- **Exploration Radius X:** The exploration radius along x (in pixels).

- **Exploration Radius Y:** The exploration radius along y (in pixels).

- **Metric Radius X:** Radius along x (in pixels) of the metric computation window.

- **Metric Radius Y:** Radius along y (in pixels) of the metric computation window.

- **Image To Warp:** The image to warp after disparity estimation is completed.

- **Output Warped Image:** The output warped image.

- **Coarse Offset X:** Coarse offset along x (in physical space) between the two images.

- **Coarse Offset Y:** Coarse offset along y (in physical space) between the two images.

- **Sub-Sampling Rate X:** Generates a result at a coarser resolution with a given sub-sampling rate along X.

- **Sub-Sampling Rate Y:** Generates a result at a coarser resolution with a given sub-sampling rate along Y.

- **Reference Gaussian Smoothing X:** Performs a gaussian smoothing of the reference image. Parameter is gaussian sigma (in pixels) in X direction.

- **Reference Gaussian Smoothing Y:** Performs a gaussian smoothing of the reference image. Parameter is gaussian sigma (in pixels) in Y direction.

- **Secondary Gaussian Smoothing X:** Performs a gaussian smoothing of the secondary image. Parameter is gaussian sigma (in pixels) in X direction.

- **Secondary Gaussian Smoothing Y:** Performs a gaussian smoothing of the secondary image. Parameter is gaussian sigma (in pixels) in Y direction.

- **Metric:** Choose the metric used for block matching. Available metrics are cross-correlation (CC), cross-correlation with subtracted mean (CCSM), mean-square difference (MSD), mean reciprocal square difference (MRSD) and mutual information (MI). Default is cross-correlation.

- **SubPixelAccuracy:** Metric extrema location will be refined up to the given accuracy. Default is 0.01.

- **Validity Mask Lower Threshold:** Lower threshold to obtain a validity mask.

- **Validity Mask Upper Threshold:** Upper threshold to obtain a validity mask.

- **Available RAM (Mb):** Available memory for processing (in MB).

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_FineRegistration -ref StereoFixed.png -sec StereoMoving.png -out FineRegistration.tif -erx 2 -ery 2 -mrx 3 -mry 3

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the FineRegistration application 
	FineRegistration = otbApplication.Registry.CreateApplication("FineRegistration")

	# The following lines set all the application parameters:
	FineRegistration.SetParameterString("ref", "StereoFixed.png")

	FineRegistration.SetParameterString("sec", "StereoMoving.png")

	FineRegistration.SetParameterString("out", "FineRegistration.tif")

	FineRegistration.SetParameterInt("erx", 2)

	FineRegistration.SetParameterInt("ery", 2)

	FineRegistration.SetParameterInt("mrx", 3)

	FineRegistration.SetParameterInt("mry", 3)

	# The following line execute the application
	FineRegistration.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

None

Authors
~~~~~~~

This application has been written by OTB-Team.

