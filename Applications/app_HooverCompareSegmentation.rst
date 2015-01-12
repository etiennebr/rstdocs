Hoover compare segmentation
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compare two segmentations with Hoover metrics

Detailed description
--------------------

This application compares a machine segmentation (MS) with a partial ground truth segmentation (GT). The Hoover metrics are used to estimate scores for correct detection, over-segmentation, under-segmentation and missed detection.
 The application can output the overall Hoover scores along with coloredimages of the MS and GT segmentation showing the state of each region (correct detection, over-segmentation, under-segmentation, missed)
 The Hoover metrics are described in : Hoover et al., "An experimental comparison of range image segmentation algorithms", IEEE PAMI vol. 18, no. 7, July 1996.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *HooverCompareSegmentation* .

.. [#] Table: Parameters table for Hoover compare segmentation.

+-------------+--------------------------+-----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description              |
+=============+==========================+===================================+
|ingt         |Input image               |Input image                        |
+-------------+--------------------------+-----------------------------------+
|inms         |Input image               |Input image                        |
+-------------+--------------------------+-----------------------------------+
|bg           |Int                       |Int                                |
+-------------+--------------------------+-----------------------------------+
|th           |Float                     |Float                              |
+-------------+--------------------------+-----------------------------------+
|outgt        |Output image              |Output image                       |
+-------------+--------------------------+-----------------------------------+
|outms        |Output image              |Output image                       |
+-------------+--------------------------+-----------------------------------+
|rc           |Float                     |Float                              |
+-------------+--------------------------+-----------------------------------+
|rf           |Float                     |Float                              |
+-------------+--------------------------+-----------------------------------+
|ra           |Float                     |Float                              |
+-------------+--------------------------+-----------------------------------+
|rm           |Float                     |Float                              |
+-------------+--------------------------+-----------------------------------+
|inxml        |XML input parameters file |XML input parameters file          |
+-------------+--------------------------+-----------------------------------+
|outxml       |XML output parameters file|XML output parameters file         |
+-------------+--------------------------+-----------------------------------+

- **Input ground truth:** A partial ground truth segmentation image.

- **Input machine segmentation:** A machine segmentation image.

- **Background label:** Label value of the background in the input segmentations.

- **Overlapping threshold:** Overlapping threshold used to find Hoover instances.

- **Colored ground truth output:** The colored ground truth output image.

- **Colored machine segmentation output:** The colored machine segmentation output image.

- **Correct detection score:** Overall score for correct detection (RC).

- **Over-segmentation score:** Overall score for over segmentation (RF).

- **Under-segmentation score:** Overall score for under segmentation (RA).

- **Missed detection score:** Overall score for missed detection (RM).

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_HooverCompareSegmentation -ingt maur_GT.tif -inms maur_labelled.tif -outgt maur_colored_GT.tif uint8

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the HooverCompareSegmentation application 
	HooverCompareSegmentation = otbApplication.Registry.CreateApplication("HooverCompareSegmentation")

	# The following lines set all the application parameters:
	HooverCompareSegmentation.SetParameterString("ingt", "maur_GT.tif")

	HooverCompareSegmentation.SetParameterString("inms", "maur_labelled.tif")

	HooverCompareSegmentation.SetParameterString("outgt", "maur_colored_GT.tif")
	HooverCompareSegmentation.SetParameterOutputImagePixelType("outgt", 1)

	# The following line execute the application
	HooverCompareSegmentation.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

None

Authors
~~~~~~~

This application has been written by OTB-Team.

See Also
~~~~~~~~

These additional ressources can be useful for further information: 

otbHooverMatrixFilter, otbHooverInstanceFilter, otbLabelMapToAttributeImageFilter

