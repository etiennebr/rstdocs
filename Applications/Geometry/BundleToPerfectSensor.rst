Bundle to perfect sensor
^^^^^^^^^^^^^^^^^^^^^^^^

Perform P+XS pansharpening

Detailed description
--------------------

This application performs P+XS pansharpening. The default mode use Pan and XS sensor models to estimate the transformation to superimpose XS over Pan before the fusion ("default mode"). The application provides also a PHR mode for Pleiades images which does not use sensor models as Pan and XS products are already coregistered but only estimate an affine transformation to superimpose XS over the Pan.Note that this option is automatically activated in case Pleiades images are detected as input.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{BundleToPerfectSensor_param_table}, page~\pageref{BundleToPerfectSensor_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+BundleToPerfectSensor+.

Parameters table for Bundle to perfect sensor:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|inp          |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|inxs         |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|elev         |Group                     |Group                             |
+-------------+--------------------------+----------------------------------+
|elev.dem     |Directory                 |Directory                         |
+-------------+--------------------------+----------------------------------+
|elev.geoid   |Input File name           |Input File name                   |
+-------------+--------------------------+----------------------------------+
|elev.default |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|mode         |Choices                   |Choices                           |
+-------------+--------------------------+----------------------------------+
|mode default | *Choice*                 |Default mode                      |
+-------------+--------------------------+----------------------------------+
|mode phr     | *Choice*                 |Pleiades mode                     |
+-------------+--------------------------+----------------------------------+
|lms          |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

**Input PAN Image**
Input panchromatic image.

**Input XS Image**
Input XS image.

**Elevation management**
This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**Mode**
Superimposition mode Available choices are: 

- **Default mode** : Default superimposition mode : uses any projection reference or sensor model found in the images

- **Pleiades mode** : Pleiades superimposition mode, designed for the case of a P+XS bundle in SENSOR geometry. It uses a simple transform on the XS image : a scaling and a residual translation.

**Spacing of the deformation field**
Spacing of the deformation field. Default is 10 times the PAN image spacing.

**Output image**
Output image.

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

	otbcli_BundleToPerfectSensor -inp QB_Toulouse_Ortho_PAN.tif -inxs QB_Toulouse_Ortho_XS.tif -out BundleToPerfectSensor.png uchar

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the BundleToPerfectSensor application 
	BundleToPerfectSensor = otbApplication.Registry.CreateApplication("BundleToPerfectSensor")

	# The following lines set all the application parameters:
	BundleToPerfectSensor.SetParameterString("inp", "QB_Toulouse_Ortho_PAN.tif")

	BundleToPerfectSensor.SetParameterString("inxs", "QB_Toulouse_Ortho_XS.tif")

	BundleToPerfectSensor.SetParameterString("out", "BundleToPerfectSensor.png")
	BundleToPerfectSensor.SetParameterOutputImagePixelType("out", 1)

	# The following line execute the application
	BundleToPerfectSensor.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

