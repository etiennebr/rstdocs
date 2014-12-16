Pixel-wise Block-Matching
^^^^^^^^^^^^^^^^^^^^^^^^^

Performs block-matching to estimate pixel-wise disparities between two images

Detailed description
--------------------

This application allows to performs block-matching to estimate pixel-wise disparities between two images. The application allows to choose the block-matching method to use. It also allows to input masks (related to the left and right input image) of pixels for which the disparity should be investigated. Additionally, two criteria can be optionally used to disable disparity investigation for some pixel: a no-data value, and a threshold on the local variance. This allows to speed-up computation by avoiding to investigate disparities that will not be reliable anyway. For efficiency reasons, if the optimal metric values image is desired, it will be concatenated to the output image (which will then have three bands : horizontal disparity, vertical disparity and metric value). One can split these images afterward.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *BlockMatching* .

.. [#] Table: Parameters table for Pixel-wise Block-Matching.

+---------------------------+--------------------------+-----------------------------------------------+
|Parameter Key              |Parameter Type            |Parameter Description                          |
+===========================+==========================+===============================================+
|io                         |Group                     |Group                                          |
+---------------------------+--------------------------+-----------------------------------------------+
|io.inleft                  |Input image               |Input image                                    |
+---------------------------+--------------------------+-----------------------------------------------+
|io.inright                 |Input image               |Input image                                    |
+---------------------------+--------------------------+-----------------------------------------------+
|io.out                     |Output image              |Output image                                   |
+---------------------------+--------------------------+-----------------------------------------------+
|io.outmask                 |Output image              |Output image                                   |
+---------------------------+--------------------------+-----------------------------------------------+
|io.outmetric               |Boolean                   |Boolean                                        |
+---------------------------+--------------------------+-----------------------------------------------+
|mask                       |Group                     |Group                                          |
+---------------------------+--------------------------+-----------------------------------------------+
|mask.inleft                |Input image               |Input image                                    |
+---------------------------+--------------------------+-----------------------------------------------+
|mask.inright               |Input image               |Input image                                    |
+---------------------------+--------------------------+-----------------------------------------------+
|mask.nodata                |Float                     |Float                                          |
+---------------------------+--------------------------+-----------------------------------------------+
|mask.variancet             |Float                     |Float                                          |
+---------------------------+--------------------------+-----------------------------------------------+
|bm                         |Group                     |Group                                          |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.metric                  |Choices                   |Choices                                        |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.metric ssd              | *Choice*                 |Sum of Squared Distances                       |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.metric ncc              | *Choice*                 |Normalized Cross-Correlation                   |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.metric lp               | *Choice*                 |Lp pseudo-norm                                 |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.metric.lp.p             |Float                     |Float                                          |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.radius                  |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.minhd                   |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.maxhd                   |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.minvd                   |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.maxvd                   |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.subpixel                |Choices                   |Choices                                        |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.subpixel none           | *Choice*                 |None                                           |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.subpixel parabolic      | *Choice*                 |Parabolic                                      |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.subpixel triangular     | *Choice*                 |Triangular                                     |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.subpixel dichotomy      | *Choice*                 |Dichotomy                                      |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.step                    |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.startx                  |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.starty                  |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.medianfilter            |Group                     |Group                                          |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.medianfilter.radius     |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.medianfilter.incoherence|Float                     |Float                                          |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.initdisp                |Choices                   |Choices                                        |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.initdisp none           | *Choice*                 |None                                           |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.initdisp uniform        | *Choice*                 |Uniform initial disparity                      |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.initdisp maps           | *Choice*                 |Initial disparity maps                         |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.initdisp.uniform.hdisp  |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.initdisp.uniform.vdisp  |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.initdisp.uniform.hrad   |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.initdisp.uniform.vrad   |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.initdisp.maps.hmap      |Input image               |Input image                                    |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.initdisp.maps.vmap      |Input image               |Input image                                    |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.initdisp.maps.hrad      |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|bm.initdisp.maps.vrad      |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|ram                        |Int                       |Int                                            |
+---------------------------+--------------------------+-----------------------------------------------+
|inxml                      |XML input parameters file |XML input parameters file                      |
+---------------------------+--------------------------+-----------------------------------------------+
|outxml                     |XML output parameters file|XML output parameters file                     |
+---------------------------+--------------------------+-----------------------------------------------+

**Input and output data**
This group of parameters allows to set the input and output images.

- **Left input image:** The left input image (reference).

- **Right input image:** The right input (secondary).

- **The output disparity map:** An image containing the estimated disparities as well as the metric values if the option is used.

- **The output mask corresponding to all criterions:** A mask image corresponding to all citerions (see masking parameters). Only required if variance threshold or nodata criterions are set.

- **Output optimal metric values as well:** If used, the output image will have a second component with metric optimal values.



**Image masking parameters**
This group of parameters allows to determine the masking parameters to prevent disparities estimation for some pixels of the left image.

- **Discard left pixels from mask image:** This parameter allows to provide a custom mask for the left image.Block matching will be only perform on pixels inside the mask.

- **Discard right pixels from mask image:** This parameter allows to provide a custom mask for the right image.Block matching will be perform only on pixels inside the mask.

- **Discard pixels with no-data value:** This parameter allows to discard pixels whose value is equal to the user-defined no-data value.

- **Discard pixels with low local variance:** This parameter allows to discard pixels whose local variance is too small (the size of the neighborhood is given by the radius parameter).



**Block matching parameters**
This group of parameters allow to tune the block-matching behaviour.

- **Block-matching metric:** 

 Available choices are: 

 - **Sum of Squared Distances** : Sum of squared distances between pixels value in the metric window


 - **Normalized Cross-Correlation** : Normalized Cross-Correlation between the left and right windows


 - **Lp pseudo-norm** : Lp pseudo-norm between the left and right windows


  - **p value** : Value of the p parameter in Lp pseudo-norm (must be positive).

- **Radius of blocks:** The radius (in pixels) of blocks in Block-Matching.

- **Minimum horizontal disparity:** Minimum horizontal disparity to explore (can be negative).

- **Maximum horizontal disparity:** Maximum horizontal disparity to explore (can be negative).

- **Minimum vertical disparity:** Minimum vertical disparity to explore (can be negative).

- **Maximum vertical disparity:** Maximum vertical disparity to explore (can be negative).

- **Sub-pixel interpolation:** Estimate disparities with sub-pixel precision.

 Available choices are: 

 - **None** : No sub-pixel


 - **Parabolic** : Parabolic fit


 - **Triangular** : Triangular fit


 - **Dichotomy** : Dichotomic search

- **Computation step:** Location step between computed disparities.

- **X start index:** X start index of the subsampled grid (wrt the input image grid).

- **Y start index:** Y start index of the subsampled grid (wrt the input image grid).

- **Median filtering:** Use a median filter to get a smooth disparity map.

- **Radius:** Radius for median filter.

- **Incoherence threshold:** Incoherence threshold between original and filtered disparity.



- **Initial disparities:** 

 Available choices are: 

 - **None** : No initial disparity used


 - **Uniform initial disparity** : Use an uniform initial disparity estimate


  - **Horizontal initial disparity** : Value of the uniform horizontal disparity initial estimate (in pixels).

  - **Vertical initial disparity** : Value of the uniform vertical disparity initial estimate (in pixels).

  - **Horizontal exploration radius** : Horizontal exploration radius around the initial disparity estimate (in pixels).

  - **Vertical exploration radius** : Vertical exploration radius around the initial disparity estimate (in pixels).


  - **Initial disparity maps** : Use initial disparity maps


   - **Horizontal initial disparity map** : Map of the initial horizontal disparities.

   - **Vertical initial disparity map** : Map of the initial vertical disparities.

   - **Horizontal exploration radius** : Horizontal exploration radius around the initial disparity estimate (in pixels).

   - **Vertical exploration radius** : Vertical exploration radius around the initial disparity estimate (in pixels).



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

	otbcli_BlockMatching -io.inleft StereoFixed.png -io.inright StereoMoving.png -bm.minhd -10 -bm.maxhd 10 -mask.variancet 10 -io.out MyDisparity.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the BlockMatching application 
	BlockMatching = otbApplication.Registry.CreateApplication("BlockMatching")

	# The following lines set all the application parameters:
	BlockMatching.SetParameterString("io.inleft", "StereoFixed.png")

	BlockMatching.SetParameterString("io.inright", "StereoMoving.png")

	BlockMatching.SetParameterInt("bm.minhd", -10)

	BlockMatching.SetParameterInt("bm.maxhd", 10)

	BlockMatching.SetParameterFloat("mask.variancet", 10)

	BlockMatching.SetParameterString("io.out", "MyDisparity.tif")

	# The following line execute the application
	BlockMatching.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

None

Authors
~~~~~~~

This application has been written by OTB-Team.

See Also
~~~~~~~~

These additional ressources can be useful for further information: 

otbStereoRectificationGridGenerator

