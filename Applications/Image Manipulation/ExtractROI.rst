Extract ROI
^^^^^^^^^^^

Extract a ROI defined by the user.

Detailed description
--------------------

This application extracts a Region Of Interest with user defined size, or reference image.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{ExtractROI_param_table}, page~\pageref{ExtractROI_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+ExtractROI+.

Parameters table for Extract ROI:

+---------------------+--------------------------+----------------------------------+
|Parameter Key        |Parameter Type            |Parameter Description             |
+=====================+==========================+==================================+
|in                   |Input image               |Input image                       |
+---------------------+--------------------------+----------------------------------+
|out                  |Output image              |Output image                      |
+---------------------+--------------------------+----------------------------------+
|ram                  |Int                       |Int                               |
+---------------------+--------------------------+----------------------------------+
|mode                 |Choices                   |Choices                           |
+---------------------+--------------------------+----------------------------------+
|mode standard        | *Choice*                 |Standard                          |
+---------------------+--------------------------+----------------------------------+
|mode fit             | *Choice*                 |Fit                               |
+---------------------+--------------------------+----------------------------------+
|mode.fit.ref         |Input image               |Input image                       |
+---------------------+--------------------------+----------------------------------+
|mode.fit.elev        |Group                     |Group                             |
+---------------------+--------------------------+----------------------------------+
|mode.fit.elev.dem    |Directory                 |Directory                         |
+---------------------+--------------------------+----------------------------------+
|mode.fit.elev.geoid  |Input File name           |Input File name                   |
+---------------------+--------------------------+----------------------------------+
|mode.fit.elev.default|Float                     |Float                             |
+---------------------+--------------------------+----------------------------------+
|startx               |Int                       |Int                               |
+---------------------+--------------------------+----------------------------------+
|starty               |Int                       |Int                               |
+---------------------+--------------------------+----------------------------------+
|sizex                |Int                       |Int                               |
+---------------------+--------------------------+----------------------------------+
|sizey                |Int                       |Int                               |
+---------------------+--------------------------+----------------------------------+
|cl                   |List                      |List                              |
+---------------------+--------------------------+----------------------------------+
|inxml                |XML input parameters file |XML input parameters file         |
+---------------------+--------------------------+----------------------------------+
|outxml               |XML output parameters file|XML output parameters file        |
+---------------------+--------------------------+----------------------------------+

**Input Image**
Input image.

**Output Image**
Output image.

**Available RAM (Mb)**
Available memory for processing (in MB).

**Extraction mode**
 Available choices are: 

- **Standard** : In standard mode, extract is done according the coordinates entered by the user


- **Fit** : In fit mode, extract is made to best fit a reference image.


 - **Reference image** : Reference image to define the ROI.

 - **Elevation management** : This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

 - **DEM directory** : This parameter allows to select a directory containing Digital Elevation Model tiles.

 - **Geoid File** : Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

 - **Default elevation** : This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**Start X**
ROI start x position.

**Start Y**
ROI start y position.

**Size X**
size along x in pixels.

**Size Y**
size along y in pixels.

**Output Image channels**
Channels to write in the output image.

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_ExtractROI -in VegetationIndex.hd -startx 40 -starty 250 -sizex 150 -sizey 150 -out ExtractROI.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ExtractROI application 
	ExtractROI = otbApplication.Registry.CreateApplication("ExtractROI")

	# The following lines set all the application parameters:
	ExtractROI.SetParameterString("in", "VegetationIndex.hd")

	ExtractROI.SetParameterInt("startx", 40)

	ExtractROI.SetParameterInt("starty", 250)

	ExtractROI.SetParameterInt("sizex", 150)

	ExtractROI.SetParameterInt("sizey", 150)

	ExtractROI.SetParameterString("out", "ExtractROI.tif")

	# The following line execute the application
	ExtractROI.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

