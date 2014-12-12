Smoothing
^^^^^^^^^

Apply a smoothing filter to an image

Detailed description
--------------------

This application applies smoothing filter to an image. Either gaussian, mean, or anisotropic diffusion are available.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{Smoothing_param_table}, page~\pageref{Smoothing_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+Smoothing+.

Parameters table for Smoothing:

+-----------------------+--------------------------+----------------------------------+
|Parameter Key          |Parameter Type            |Parameter Description             |
+=======================+==========================+==================================+
|in                     |Input image               |Input image                       |
+-----------------------+--------------------------+----------------------------------+
|out                    |Output image              |Output image                      |
+-----------------------+--------------------------+----------------------------------+
|ram                    |Int                       |Int                               |
+-----------------------+--------------------------+----------------------------------+
|type                   |Choices                   |Choices                           |
+-----------------------+--------------------------+----------------------------------+
|type mean              | *Choice*                 |Mean                              |
+-----------------------+--------------------------+----------------------------------+
|type gaussian          | *Choice*                 |Gaussian                          |
+-----------------------+--------------------------+----------------------------------+
|type anidif            | *Choice*                 |Anisotropic Diffusion             |
+-----------------------+--------------------------+----------------------------------+
|type.mean.radius       |Int                       |Int                               |
+-----------------------+--------------------------+----------------------------------+
|type.gaussian.radius   |Float                     |Float                             |
+-----------------------+--------------------------+----------------------------------+
|type.anidif.timestep   |Float                     |Float                             |
+-----------------------+--------------------------+----------------------------------+
|type.anidif.nbiter     |Int                       |Int                               |
+-----------------------+--------------------------+----------------------------------+
|type.anidif.conductance|Float                     |Float                             |
+-----------------------+--------------------------+----------------------------------+
|inxml                  |XML input parameters file |XML input parameters file         |
+-----------------------+--------------------------+----------------------------------+
|outxml                 |XML output parameters file|XML output parameters file        |
+-----------------------+--------------------------+----------------------------------+

**Input Image**
Input image to smooth.

**Output Image**
Output smoothed image.

**Available RAM (Mb)**
Available memory for processing (in MB).

**Smoothing Type**
Smoothing kernel to apply. Available choices are: 

- **Mean**

 - **Radius** : Mean radius (in pixels).


- **Gaussian**

 - **Radius** : Gaussian radius (in pixels).


- **Anisotropic Diffusion**

 - **Time Step** : Diffusion equation time step.

 - **Nb Iterations** : Controls the sensitivity of the conductance term.

 - **Conductance** : 



**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Examples
--------


Example1
--------

Image smoothing using a mean filter.To run this example in command-line, use the following: 

::

	otbcli_Smoothing -in Romania_Extract.tif -out smoothedImage_mean.png uchar -type mean

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the Smoothing application 
	Smoothing = otbApplication.Registry.CreateApplication("Smoothing")

	# The following lines set all the application parameters:
	Smoothing.SetParameterString("in", "Romania_Extract.tif")

	Smoothing.SetParameterString("out", "smoothedImage_mean.png")
	Smoothing.SetParameterOutputImagePixelType("out", 1)

	Smoothing.SetParameterString("type","mean")

	# The following line execute the application
	Smoothing.ExecuteAndWriteOutput()

Example2
--------

Image smoothing using an anisotropic diffusion filter.To run this example in command-line, use the following: 

::

	otbcli_Smoothing -in Romania_Extract.tif -out smoothedImage_ani.png float -type anidif -type.anidif.timestep 0.1 -type.anidif.nbiter 5 -type.anidif.conductance 1.5

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the Smoothing application 
	Smoothing = otbApplication.Registry.CreateApplication("Smoothing")

	# The following lines set all the application parameters:
	Smoothing.SetParameterString("in", "Romania_Extract.tif")

	Smoothing.SetParameterString("out", "smoothedImage_ani.png")
	Smoothing.SetParameterOutputImagePixelType("out", 6)

	Smoothing.SetParameterString("type","anidif")

	Smoothing.SetParameterFloat("type.anidif.timestep", 0.1)

	Smoothing.SetParameterInt("type.anidif.nbiter", 5)

	Smoothing.SetParameterFloat("type.anidif.conductance", 1.5)

	# The following line execute the application
	Smoothing.ExecuteAndWriteOutput()

:Limitations:

None

:Authors:

This application has been written by OTB-Team.

