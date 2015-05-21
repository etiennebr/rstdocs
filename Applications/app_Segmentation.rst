Segmentation
^^^^^^^^^^^^

Performs segmentation of an image, and output either a raster or a vector file. In vector mode, large input datasets are supported.

Detailed description
--------------------

This application allows to perform various segmentation algorithms on a multispectral image.Available segmentation algorithms are two different versions of Mean-Shift segmentation algorithm (one being multi-threaded), simple pixel based connected components according to a user-defined criterion, and watershed from the gradient of the intensity (norm of spectral bands vector). The application has two different modes that affects the nature of its output.

In raster mode, the output of the application is a classical image of unique labels identifying the segmented regions. The labeled output can be passed to the ColorMapping application to render regions with contrasted colours. Please note that this mode loads the whole input image into memory, and as such can not handle large images. 

To segment large data, one can use the vector mode. In this case, the output of the application is a vector file or database. The input image is split into tiles (whose size can be set using the tilesize parameter), and each tile is loaded, segmented with the chosen algorithm, vectorized, and written into the output file or database. This piece-wise behavior ensure that memory will never get overloaded, and that images of any size can be processed. There are few more options in the vector mode. The simplify option allows to simplify the geometry (i.e. remove nodes in polygons) according to a user-defined tolerance. The stitch option allows to application to try to stitch together polygons corresponding to segmented region that may have been split by the tiling scheme. 

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *Segmentation* .

.. [#] Table: Parameters table for Segmentation.

+--------------------------+--------------------------+----------------------------------------------------------+
|Parameter Key             |Parameter Type            |Parameter Description                                     |
+==========================+==========================+==========================================================+
|in                        |Input image               |Input image                                               |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter                    |Choices                   |Choices                                                   |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter meanshift          | *Choice*                 |Mean-Shift                                                |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter edison             | *Choice*                 |Edison mean-shift                                         |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter cc                 | *Choice*                 |Connected components                                      |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter watershed          | *Choice*                 |Watershed                                                 |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter mprofiles          | *Choice*                 |Morphological profiles based segmentation                 |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.meanshift.spatialr |Int                       |Int                                                       |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.meanshift.ranger   |Float                     |Float                                                     |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.meanshift.thres    |Float                     |Float                                                     |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.meanshift.maxiter  |Int                       |Int                                                       |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.meanshift.minsize  |Int                       |Int                                                       |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.edison.spatialr    |Int                       |Int                                                       |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.edison.ranger      |Float                     |Float                                                     |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.edison.minsize     |Int                       |Int                                                       |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.edison.scale       |Float                     |Float                                                     |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.cc.expr            |String                    |String                                                    |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.watershed.threshold|Float                     |Float                                                     |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.watershed.level    |Float                     |Float                                                     |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.mprofiles.size     |Int                       |Int                                                       |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.mprofiles.start    |Int                       |Int                                                       |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.mprofiles.step     |Int                       |Int                                                       |
+--------------------------+--------------------------+----------------------------------------------------------+
|filter.mprofiles.sigma    |Float                     |Float                                                     |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode                      |Choices                   |Choices                                                   |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode vector               | *Choice*                 |Tile-based large-scale segmentation with vector output    |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode raster               | *Choice*                 |Standard segmentation with labeled raster output          |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.out           |Output File name          |Output File name                                          |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.outmode       |Choices                   |Choices                                                   |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.outmode ulco  | *Choice*                 |Update output vector file, only allow to create new layers|
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.outmode ovw   | *Choice*                 |Overwrite output vector file if existing.                 |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.outmode ulovw | *Choice*                 |Update output vector file, overwrite existing layer       |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.outmode ulu   | *Choice*                 |Update output vector file, update existing layer          |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.inmask        |Input image               |Input image                                               |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.neighbor      |Boolean                   |Boolean                                                   |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.stitch        |Boolean                   |Boolean                                                   |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.minsize       |Int                       |Int                                                       |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.simplify      |Float                     |Float                                                     |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.layername     |String                    |String                                                    |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.fieldname     |String                    |String                                                    |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.tilesize      |Int                       |Int                                                       |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.startlabel    |Int                       |Int                                                       |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.vector.ogroptions    |String list               |String list                                               |
+--------------------------+--------------------------+----------------------------------------------------------+
|mode.raster.out           |Output image              |Output image                                              |
+--------------------------+--------------------------+----------------------------------------------------------+
|inxml                     |XML input parameters file |XML input parameters file                                 |
+--------------------------+--------------------------+----------------------------------------------------------+
|outxml                    |XML output parameters file|XML output parameters file                                |
+--------------------------+--------------------------+----------------------------------------------------------+

**Input Image**
The input image to segment.

**Segmentation algorithm**
Choice of segmentation algorithm (mean-shift by default). Available choices are: 

- **Mean-Shift** : OTB implementation of the Mean-Shift algorithm (multi-threaded).


  - **Spatial radius** : Spatial radius of the neighborhood.

  - **Range radius** : Range radius defining the radius (expressed in radiometry unit) in the multispectral space.

  - **Mode convergence threshold** : Algorithm iterative scheme will stop if mean-shift vector is below this threshold or if iteration number reached maximum number of iterations.

  - **Maximum number of iterations** : Algorithm iterative scheme will stop if convergence hasn't been reached after the maximum number of iterations.

  - **Minimum region size** : Minimum size of a region (in pixel unit) in segmentation. Smaller clusters will be merged to the neighboring cluster with the closest radiometry. If set to 0 no pruning is done.


- **Edison mean-shift** : Edison implementation of mean-shift algorithm, by its authors.


  - **Spatial radius** : Spatial radius defining neighborhood.

  - **Range radius** : Range radius defining the radius (expressed in radiometry unit) in the multi-spectral space.

  - **Minimum region size** : Minimum size of a region in segmentation. Smaller clusters will be merged to the neighboring cluster with the closest radiometry.

  - **Scale factor** : Scaling of the image before processing. This is useful for images with narrow decimal ranges (like [0,1] for instance). .


- **Connected components** : Simple pixel-based connected-components algorithm with a user-defined connection condition.

  - **Condition** : User defined connection condition, written as a mathematical expression. Available variables are p(i)b(i), intensity_p(i) and distance (example of expression : distance < 10 ).


- **Watershed** : The traditional watershed algorithm. The height function is the gradient magnitude of the amplitude (square root of the sum of squared bands).


  - **Depth Threshold** : Depth threshold Units in percentage of the maximum depth in the image.

  - **Flood Level** : flood level for generating the merge tree from the initial segmentation (between 0 and 1).


- **Morphological profiles based segmentation** : Segmentation based on morphological profiles, as described in Martino Pesaresi and Jon Alti Benediktsson, Member, IEEE: A new approach for the morphological segmentation of high resolution satellite imagery. IEEE Transactions on geoscience and remote sensing, vol. 39, NO. 2, February 2001, p. 309-320.


  - **Profile Size** : Size of the profiles.

  - **Initial radius** : Initial radius of the structuring element (in pixels).

  - **Radius step.** : Radius step along the profile (in pixels).

  - **Threshold of the final decision rule** : Profiles values under the threshold will be ignored.



**Processing mode**
Choice of processing mode, either raster or large-scale. Available choices are: 

- **Tile-based large-scale segmentation with vector output** : In this mode, the application will output a vector file or database, and process the input image piecewise. This allows to perform segmentation of very large images.


  - **Output vector file** : The output vector file or database (name can be anything understood by OGR).

  - **Writing mode for the output vector file** : This allows to set the writing behaviour for the output vector file. Please note that the actual behaviour depends on the file format.

  - **Mask Image** : Only pixels whose mask value is strictly positive will be segmented.

  - **8-neighbor connectivity** : Activate 8-Neighborhood connectivity (default is 4).

  - **Stitch polygons** : Scan polygons on each side of tiles and stitch polygons which connect by more than one pixel.

  - **Minimum object size** : Objects whose size is below the minimum object size (area in pixels) will be ignored during vectorization.

  - **Simplify polygons** : Simplify polygons according to a given tolerance (in pixel). This option allows to reduce the size of the output file or database.

  - **Layer name** : Name of the layer in the vector file or database (default is Layer).

  - **Geometry index field name** : Name of the field holding the geometry index in the output vector file or database.

  - **Tiles size** : User defined tiles size for tile-based segmentation. Optimal tile size is selected according to available RAM if null.

  - **Starting geometry index** : Starting value of the geometry index field.

  - **OGR options for layer creation** : A list of layer creation options in the form KEY=VALUE that will be passed directly to OGR without any validity checking. Options may depend on the file format, and can be found in OGR documentation.


- **Standard segmentation with labeled raster output** : In this mode, the application will output a standard labeled raster. This mode can not handle large data.


  - **Output labeled image** : The output labeled image.



**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Examples
--------


:Example 1:

Example of use with vector mode and watershed segmentationTo run this example in command-line, use the following: 

::

	otbcli_Segmentation -in QB_Toulouse_Ortho_PAN.tif -mode vector -mode.vector.out SegmentationVector.sqlite -filter watershed

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the Segmentation application 
	Segmentation = otbApplication.Registry.CreateApplication("Segmentation")

	# The following lines set all the application parameters:
	Segmentation.SetParameterString("in", "QB_Toulouse_Ortho_PAN.tif")

	Segmentation.SetParameterString("mode","vector")

	Segmentation.SetParameterString("mode.vector.out", "SegmentationVector.sqlite")

	Segmentation.SetParameterString("filter","watershed")

	# The following line execute the application
	Segmentation.ExecuteAndWriteOutput()

:Example 2:

Example of use with raster mode and mean-shift segmentationTo run this example in command-line, use the following: 

::

	otbcli_Segmentation -in QB_Toulouse_Ortho_PAN.tif -mode raster -mode.raster.out SegmentationRaster.tif uint16 -filter meanshift

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the Segmentation application 
	Segmentation = otbApplication.Registry.CreateApplication("Segmentation")

	# The following lines set all the application parameters:
	Segmentation.SetParameterString("in", "QB_Toulouse_Ortho_PAN.tif")

	Segmentation.SetParameterString("mode","raster")

	Segmentation.SetParameterString("mode.raster.out", "SegmentationRaster.tif")
	Segmentation.SetParameterOutputImagePixelType("mode.raster.out", 3)

	Segmentation.SetParameterString("filter","meanshift")

	# The following line execute the application
	Segmentation.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

In raster mode, the application can not handle large input images. Stitching step of vector mode might become slow with very large input images. 
MeanShift filter results depends on the number of threads used. 
Watershed and multiscale geodesic morphology segmentation will be performed on the amplitude  of the input image.

Authors
~~~~~~~

This application has been written by OTB-Team.

See Also
~~~~~~~~

These additional ressources can be useful for further information: 

MeanShiftSegmentation

