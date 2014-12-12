Classification Map Regularization
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Filters the input labeled image using Majority Voting in a ball shaped neighbordhood.

Detailed description
--------------------

This application filters the input labeled image (with a maximal class label = 65535) using Majority Voting in a ball shaped neighbordhood. Majority Voting takes the more representative value of all the pixels identified by the ball shaped structuring element and then sets the center pixel to this majority label value.    NoData is the label of the NOT classified pixels in the input image. These input pixels keep their NoData label in the output image.    Pixels with more than 1 majority class are marked as Undecided if the parameter 'ip.suvbool == true', or keep their Original labels otherwise.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{ClassificationMapRegularization_param_table}, page~\pageref{ClassificationMapRegularization_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+ClassificationMapRegularization+.

Parameters table for Classification Map Regularization:

+-----------------+--------------------------+----------------------------------------+
|Parameter Key    |Parameter Type            |Parameter Description                   |
+=================+==========================+========================================+
|io               |Group                     |Group                                   |
+-----------------+--------------------------+----------------------------------------+
|io.in            |Input image               |Input image                             |
+-----------------+--------------------------+----------------------------------------+
|io.out           |Output image              |Output image                            |
+-----------------+--------------------------+----------------------------------------+
|ip               |Group                     |Group                                   |
+-----------------+--------------------------+----------------------------------------+
|ip.radius        |Int                       |Int                                     |
+-----------------+--------------------------+----------------------------------------+
|ip.suvbool       |Boolean                   |Boolean                                 |
+-----------------+--------------------------+----------------------------------------+
|ip.nodatalabel   |Int                       |Int                                     |
+-----------------+--------------------------+----------------------------------------+
|ip.undecidedlabel|Int                       |Int                                     |
+-----------------+--------------------------+----------------------------------------+
|ram              |Int                       |Int                                     |
+-----------------+--------------------------+----------------------------------------+
|inxml            |XML input parameters file |XML input parameters file               |
+-----------------+--------------------------+----------------------------------------+
|outxml           |XML output parameters file|XML output parameters file              |
+-----------------+--------------------------+----------------------------------------+

**Input and output images**
This group of parameters allows to set input and output images for classification map regularization by Majority Voting.

- **Input classification image:** The input labeled image to regularize.

- **Output regularized image:** The output regularized labeled image.



**Regularization parameters**
This group allows to set parameters for classification map regularization by Majority Voting.

- **Structuring element radius (in pixels):** The radius of the ball shaped structuring element (expressed in pixels). By default, 'ip.radius = 1 pixel'.

- **Multiple majority: Undecided(X)/Original:** Pixels with more than 1 majority class are marked as Undecided if this parameter is checked (true), or keep their Original labels otherwise (false). Please note that the Undecided value must be different from existing labels in the input labeled image. By default, 'ip.suvbool = false'.

- **Label for the NoData class:** Label for the NoData class. Such input pixels keep their NoData label in the output image. By default, 'ip.nodatalabel = 0'.

- **Label for the Undecided class:** Label for the Undecided class. By default, 'ip.undecidedlabel = 0'.



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

	otbcli_ClassificationMapRegularization -io.in clLabeledImageQB123_1.tif -io.out clLabeledImageQB123_1_CMR_r2_nodl_10_undl_7.tif -ip.radius 2 -ip.suvbool true -ip.nodatalabel 10 -ip.undecidedlabel 7

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ClassificationMapRegularization application 
	ClassificationMapRegularization = otbApplication.Registry.CreateApplication("ClassificationMapRegularization")

	# The following lines set all the application parameters:
	ClassificationMapRegularization.SetParameterString("io.in", "clLabeledImageQB123_1.tif")

	ClassificationMapRegularization.SetParameterString("io.out", "clLabeledImageQB123_1_CMR_r2_nodl_10_undl_7.tif")

	ClassificationMapRegularization.SetParameterInt("ip.radius", 2)

	ClassificationMapRegularization.SetParameterString("ip.suvbool","1")

	ClassificationMapRegularization.SetParameterInt("ip.nodatalabel", 10)

	ClassificationMapRegularization.SetParameterInt("ip.undecidedlabel", 7)

	# The following line execute the application
	ClassificationMapRegularization.ExecuteAndWriteOutput()

Limitations
-----------

The input image must be a single band labeled image (with a maximal class label = 65535). The structuring element radius must have a minimum value equal to 1 pixel. Please note that the Undecided value must be different from existing labels in the input labeled image.

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

Documentation of the ClassificationMapRegularization application.

