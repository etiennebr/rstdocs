Superimpose sensor
^^^^^^^^^^^^^^^^^^

Using available image metadata, project one image onto another one

Detailed description
--------------------

This application performs the projection of an image into the geometry of another one.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{Superimpose_param_table}, page~\pageref{Superimpose_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+Superimpose+.

Parameters table for Superimpose sensor:

+-----------------------+--------------------------+----------------------------------+
|Parameter Key          |Parameter Type            |Parameter Description             |
+=======================+==========================+==================================+
|inr                    |Input image               |Input image                       |
+-----------------------+--------------------------+----------------------------------+
|inm                    |Input image               |Input image                       |
+-----------------------+--------------------------+----------------------------------+
|elev                   |Group                     |Group                             |
+-----------------------+--------------------------+----------------------------------+
|elev.dem               |Directory                 |Directory                         |
+-----------------------+--------------------------+----------------------------------+
|elev.geoid             |Input File name           |Input File name                   |
+-----------------------+--------------------------+----------------------------------+
|elev.default           |Float                     |Float                             |
+-----------------------+--------------------------+----------------------------------+
|lms                    |Float                     |Float                             |
+-----------------------+--------------------------+----------------------------------+
|out                    |Output image              |Output image                      |
+-----------------------+--------------------------+----------------------------------+
|mode                   |Choices                   |Choices                           |
+-----------------------+--------------------------+----------------------------------+
|mode default           | *Choice*                 |Default mode                      |
+-----------------------+--------------------------+----------------------------------+
|mode phr               | *Choice*                 |Pleiades mode                     |
+-----------------------+--------------------------+----------------------------------+
|interpolator           |Choices                   |Choices                           |
+-----------------------+--------------------------+----------------------------------+
|interpolator bco       | *Choice*                 |Bicubic interpolation             |
+-----------------------+--------------------------+----------------------------------+
|interpolator nn        | *Choice*                 |Nearest Neighbor interpolation    |
+-----------------------+--------------------------+----------------------------------+
|interpolator linear    | *Choice*                 |Linear interpolation              |
+-----------------------+--------------------------+----------------------------------+
|interpolator.bco.radius|Int                       |Int                               |
+-----------------------+--------------------------+----------------------------------+
|ram                    |Int                       |Int                               |
+-----------------------+--------------------------+----------------------------------+
|inxml                  |XML input parameters file |XML input parameters file         |
+-----------------------+--------------------------+----------------------------------+
|outxml                 |XML output parameters file|XML output parameters file        |
+-----------------------+--------------------------+----------------------------------+

**Reference input**
The input reference image.

**The image to reproject**
The image to reproject into the geometry of the reference input.

**Elevation management**
This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles.

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**Spacing of the deformation field**
Generate a coarser deformation field with the given spacing.

**Output image**
Output reprojected image.

**Mode**
Superimposition mode. Available choices are: 

- **Default mode** : Default superimposition mode : uses any projection reference or sensor model found in the images

- **Pleiades mode** : Pleiades superimposition mode, designed for the case of a P+XS bundle in SENSOR geometry. It uses a simple transform on the XS image : a scaling and a residual translation.


**Interpolation**
This group of parameters allows to define how the input image will be interpolated during resampling. Available choices are: 

- **Bicubic interpolation** : Bicubic interpolation leads to very good image quality but is slow.

 - **Radius for bicubic interpolation** : This parameter allows to control the size of the bicubic interpolation filter. If the target pixel size is higher than the input pixel size, increasing this parameter will reduce aliasing artefacts.


- **Nearest Neighbor interpolation** : Nearest neighbor interpolation leads to poor image quality, but it is very fast.

- **Linear interpolation** : Linear interpolation leads to average image quality but is quite fast


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

	otbcli_Superimpose -inr QB_Toulouse_Ortho_PAN.tif -inm QB_Toulouse_Ortho_XS.tif -out SuperimposedXS_to_PAN.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the Superimpose application 
	Superimpose = otbApplication.Registry.CreateApplication("Superimpose")

	# The following lines set all the application parameters:
	Superimpose.SetParameterString("inr", "QB_Toulouse_Ortho_PAN.tif")

	Superimpose.SetParameterString("inm", "QB_Toulouse_Ortho_XS.tif")

	Superimpose.SetParameterString("out", "SuperimposedXS_to_PAN.tif")

	# The following line execute the application
	Superimpose.ExecuteAndWriteOutput()

:Limitations:

None

:Authors:

This application has been written by OTB-Team.

