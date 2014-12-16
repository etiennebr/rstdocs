Download or list SRTM tiles related to a set of images
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Download or list SRTM tiles related to a set of images

Detailed description
--------------------

This application allows to select the appropriate SRTM tiles that covers a list of images. It builds a list of the required tiles. Two modes are available: the first one download those tiles from the USGS SRTM3 website (http://dds.cr.usgs.gov/srtm/version2_1/SRTM3/), the second one list those tiles in a local directory. In both cases, you need to indicate the directory in which directory  tiles will be download or the location of local SRTM files.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *DownloadSRTMTiles* .

.. [#] Table: Parameters table for Download or list SRTM tiles related to a set of images.

+--------------------+--------------------------+----------------------------------+
|Parameter Key       |Parameter Type            |Parameter Description             |
+====================+==========================+==================================+
|il                  |Input image list          |Input image list                  |
+--------------------+--------------------------+----------------------------------+
|mode                |Choices                   |Choices                           |
+--------------------+--------------------------+----------------------------------+
|mode download       | *Choice*                 |Download                          |
+--------------------+--------------------------+----------------------------------+
|mode list           | *Choice*                 |List tiles                        |
+--------------------+--------------------------+----------------------------------+
|mode.download.outdir|Directory                 |Directory                         |
+--------------------+--------------------------+----------------------------------+
|mode.list.indir     |Directory                 |Directory                         |
+--------------------+--------------------------+----------------------------------+
|inxml               |XML input parameters file |XML input parameters file         |
+--------------------+--------------------------+----------------------------------+
|outxml              |XML output parameters file|XML output parameters file        |
+--------------------+--------------------------+----------------------------------+

**Input images list**
The list of images on which you want to determine corresponding SRTM tiles.

**Download/List corresponding SRTM tiles.**
 Available choices are: 

- **Download** : Download corresponding tiles on USGE server.


 - **Output directory** : Directory where zipped tiles will be save. You'll need to unzip all tile files before using them in your application.


 - **List tiles** : List tiles in an existing local directory.


  - **Input directory** : Input directory where SRTM tiles can are located.



**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_DownloadSRTMTiles -il QB_Toulouse_Ortho_XS.tif -mode list -mode.list.indir /home/user/srtm_dir/

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the DownloadSRTMTiles application 
	DownloadSRTMTiles = otbApplication.Registry.CreateApplication("DownloadSRTMTiles")

	# The following lines set all the application parameters:
	DownloadSRTMTiles.SetParameterStringList("il", ['QB_Toulouse_Ortho_XS.tif'])

	DownloadSRTMTiles.SetParameterString("mode","list")

	DownloadSRTMTiles.SetParameterString("mode.list.indir", "/home/user/srtm_dir/")

	# The following line execute the application
	DownloadSRTMTiles.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

None

Authors
~~~~~~~

This application has been written by OTB-Team.

