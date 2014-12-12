Images comparaison
^^^^^^^^^^^^^^^^^^

Estimator between 2 images.

Detailed description
--------------------

This application computes MSE (Mean Squared Error), MAE (Mean Absolute Error) and PSNR (Peak Signal to Noise Ratio) between the channel of two images (reference and measurement). The user has to set the used channel and can specify a ROI.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{CompareImages_param_table}, page~\pageref{CompareImages_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+CompareImages+.

Parameters table for Images comparaison:

+-------------+--------------------------+------------------------------------------------+
|Parameter Key|Parameter Type            |Parameter Description                           |
+=============+==========================+================================================+
|ref          |Group                     |Group                                           |
+-------------+--------------------------+------------------------------------------------+
|ref.in       |Input image               |Input image                                     |
+-------------+--------------------------+------------------------------------------------+
|ref.channel  |Int                       |Int                                             |
+-------------+--------------------------+------------------------------------------------+
|meas         |Group                     |Group                                           |
+-------------+--------------------------+------------------------------------------------+
|meas.in      |Input image               |Input image                                     |
+-------------+--------------------------+------------------------------------------------+
|meas.channel |Int                       |Int                                             |
+-------------+--------------------------+------------------------------------------------+
|roi          |Group                     |Group                                           |
+-------------+--------------------------+------------------------------------------------+
|roi.startx   |Int                       |Int                                             |
+-------------+--------------------------+------------------------------------------------+
|roi.starty   |Int                       |Int                                             |
+-------------+--------------------------+------------------------------------------------+
|roi.sizex    |Int                       |Int                                             |
+-------------+--------------------------+------------------------------------------------+
|roi.sizey    |Int                       |Int                                             |
+-------------+--------------------------+------------------------------------------------+
|mse          |Float                     |Float                                           |
+-------------+--------------------------+------------------------------------------------+
|mae          |Float                     |Float                                           |
+-------------+--------------------------+------------------------------------------------+
|psnr         |Float                     |Float                                           |
+-------------+--------------------------+------------------------------------------------+
|inxml        |XML input parameters file |XML input parameters file                       |
+-------------+--------------------------+------------------------------------------------+
|outxml       |XML output parameters file|XML output parameters file                      |
+-------------+--------------------------+------------------------------------------------+

**Reference image properties**


- **Reference image:** Image used as reference in the comparison.

- **Reference image channel:** Used channel for the reference image.



**Measured image properties**


- **Measured image:** Image used as measured in the comparison.

- **Measured image channel:** Used channel for the measured image.



**Region Of Interest (relative to reference image)**


- **Start X:** ROI start x position.

- **Start Y:** ROI start y position.

- **Size X:** Size along x in pixels.

- **Size Y:** Size along y in pixels.



**MSE**
Mean Squared Error value.

**MAE**
Mean Absolute Error value.

**PSNR**
Peak Signal to Noise Ratio value.

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_CompareImages -ref.in GomaApres.png -ref.channel 1 -meas.in GomaAvant.png -meas.channel 2 -roi.startx 20 -roi.starty 30 -roi.sizex 150 -roi.sizey 200

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the CompareImages application 
	CompareImages = otbApplication.Registry.CreateApplication("CompareImages")

	# The following lines set all the application parameters:
	CompareImages.SetParameterString("ref.in", "GomaApres.png")

	CompareImages.SetParameterInt("ref.channel", 1)

	CompareImages.SetParameterString("meas.in", "GomaAvant.png")

	CompareImages.SetParameterInt("meas.channel", 2)

	CompareImages.SetParameterInt("roi.startx", 20)

	CompareImages.SetParameterInt("roi.starty", 30)

	CompareImages.SetParameterInt("roi.sizex", 150)

	CompareImages.SetParameterInt("roi.sizey", 200)

	# The following line execute the application
	CompareImages.ExecuteAndWriteOutput()

:Limitations:

None

:Authors:

This application has been written by OTB-Team.

:See Also:

These additional ressources can be useful for further information: 

BandMath application, ImageStatistics

