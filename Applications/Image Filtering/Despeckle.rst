Despeckle
^^^^^^^^^

Perform speckle noise reduction on SAR image.

Detailed description
--------------------

This application reduce speckle noise. Two methods are available: Lee and Frost.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{Despeckle_param_table}, page~\pageref{Despeckle_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+Despeckle+.

Parameters table for Despeckle:

+-------------------+--------------------------+----------------------------------+
|Parameter Key      |Parameter Type            |Parameter Description             |
+===================+==========================+==================================+
|in                 |Input image               |Input image                       |
+-------------------+--------------------------+----------------------------------+
|out                |Output image              |Output image                      |
+-------------------+--------------------------+----------------------------------+
|ram                |Int                       |Int                               |
+-------------------+--------------------------+----------------------------------+
|filter             |Choices                   |Choices                           |
+-------------------+--------------------------+----------------------------------+
|filter lee         | *Choice*                 |Lee                               |
+-------------------+--------------------------+----------------------------------+
|filter frost       | *Choice*                 |Frost                             |
+-------------------+--------------------------+----------------------------------+
|filter.lee.rad     |Int                       |Int                               |
+-------------------+--------------------------+----------------------------------+
|filter.lee.nblooks |Float                     |Float                             |
+-------------------+--------------------------+----------------------------------+
|filter.frost.rad   |Int                       |Int                               |
+-------------------+--------------------------+----------------------------------+
|filter.frost.deramp|Float                     |Float                             |
+-------------------+--------------------------+----------------------------------+
|inxml              |XML input parameters file |XML input parameters file         |
+-------------------+--------------------------+----------------------------------+
|outxml             |XML output parameters file|XML output parameters file        |
+-------------------+--------------------------+----------------------------------+

**Input Image**
Input image.

**Output Image**
Output image.

**Available RAM (Mb)**
Available memory for processing (in MB).

**speckle filtering method**
 Available choices are: 

- **Lee** : Lee filter

 - **Radius** : Radius for lee filter.

 - **nb looks** : Nb looks for lee filter.


- **Frost** : Frost filter

 - **Radius** : Radius for frost filter.

 - **deramp** : Decrease factor declaration.



**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_Despeckle -in sar.tif -filter lee -filter.lee.rad 5 -out despeckle.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the Despeckle application 
	Despeckle = otbApplication.Registry.CreateApplication("Despeckle")

	# The following lines set all the application parameters:
	Despeckle.SetParameterString("in", "sar.tif")

	Despeckle.SetParameterString("filter","lee")

	Despeckle.SetParameterInt("filter.lee.rad", 5)

	Despeckle.SetParameterString("out", "despeckle.tif")

	# The following line execute the application
	Despeckle.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

