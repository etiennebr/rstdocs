Pansharpening
^^^^^^^^^^^^^

Perform P+XS pansharpening

Detailed description
--------------------

This application performs P+XS pansharpening. Pansharpening is a process of merging highresolution panchromatic and lower resolution multispectral imagery to create a single highresolution color image. Algorithms available in the applications are: RCS, bayesian fusion and Local Mean and Variance Matching(LMVM).

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{Pansharpening_param_table}, page~\pageref{Pansharpening_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+Pansharpening+.

Parameters table for Pansharpening:

+-------------------+--------------------------+----------------------------------+
|Parameter Key      |Parameter Type            |Parameter Description             |
+===================+==========================+==================================+
|inp                |Input image               |Input image                       |
+-------------------+--------------------------+----------------------------------+
|inxs               |Input image               |Input image                       |
+-------------------+--------------------------+----------------------------------+
|out                |Output image              |Output image                      |
+-------------------+--------------------------+----------------------------------+
|method             |Choices                   |Choices                           |
+-------------------+--------------------------+----------------------------------+
|method rcs         | *Choice*                 |RCS                               |
+-------------------+--------------------------+----------------------------------+
|method lmvm        | *Choice*                 |LMVM                              |
+-------------------+--------------------------+----------------------------------+
|method bayes       | *Choice*                 |Bayesian                          |
+-------------------+--------------------------+----------------------------------+
|method.lmvm.radiusx|Int                       |Int                               |
+-------------------+--------------------------+----------------------------------+
|method.lmvm.radiusy|Int                       |Int                               |
+-------------------+--------------------------+----------------------------------+
|method.bayes.lambda|Float                     |Float                             |
+-------------------+--------------------------+----------------------------------+
|method.bayes.s     |Float                     |Float                             |
+-------------------+--------------------------+----------------------------------+
|ram                |Int                       |Int                               |
+-------------------+--------------------------+----------------------------------+
|inxml              |XML input parameters file |XML input parameters file         |
+-------------------+--------------------------+----------------------------------+
|outxml             |XML output parameters file|XML output parameters file        |
+-------------------+--------------------------+----------------------------------+

**Input PAN Image**
Input panchromatic image.

**Input XS Image**
Input XS image.

**Output image**
Output image.

**Algorithm**
Selection of the pan-sharpening method. Available choices are: 

- **RCS** : Simple RCS Pan sharpening operation.

- **LMVM** : Local Mean and Variance Matching (LMVM) Pan sharpening.

 - **X radius** : Set the x radius of the sliding window.

 - **Y radius** : Set the y radius of the sliding window.

- **Bayesian** : Bayesian fusion.

 - **Weight** : Set the weighting value.

 - **S coefficient** : Set the S coefficient.

**Available RAM (Mb)**
Available memory for processing (in MB)

**Load otb application from xml file**
Load otb application from xml file

**Save otb application to xml file**
Save otb application to xml file

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_Pansharpening -inp QB_Toulouse_Ortho_PAN.tif -inxs QB_Toulouse_Ortho_XS.tif -out Pansharpening.tif uint16

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the Pansharpening application 
	Pansharpening = otbApplication.Registry.CreateApplication("Pansharpening")

	# The following lines set all the application parameters:
	Pansharpening.SetParameterString("inp", "QB_Toulouse_Ortho_PAN.tif")

	Pansharpening.SetParameterString("inxs", "QB_Toulouse_Ortho_XS.tif")

	Pansharpening.SetParameterString("out", "Pansharpening.tif")
	Pansharpening.SetParameterOutputImagePixelType("out", 3)

	# The following line execute the application
	Pansharpening.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

