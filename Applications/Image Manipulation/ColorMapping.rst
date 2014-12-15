Color Mapping
^^^^^^^^^^^^^

Maps an input label image to 8-bits RGB using look-up tables.

Detailed description
--------------------

This application allows to map a label image to a 8-bits RGB image (in both ways) using different methods.
 -The custom method allows to use a custom look-up table. The look-up table is loaded from a text file where each line describes an entry. The typical use of this method is to colorise a classification map.
 -The continuous method allows to map a range of values in a scalar input image to a colored image using continuous look-up table, in order to enhance image interpretation. Several look-up tables can been chosen with different color ranges.
-The optimal method computes an optimal look-up table. When processing a segmentation label image (label to color), the color difference between adjacent segmented regions is maximized. When processing an unknown color image (color to label), all the present colors are mapped to a continuous label list.
 - The support image method uses a color support image to associate an average color to each region.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{ColorMapping_param_table}, page~\pageref{ColorMapping_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+ColorMapping+.

Parameters table for Color Mapping:

+-------------------------------+--------------------------+------------------------------------------------------------+
|Parameter Key                  |Parameter Type            |Parameter Description                                       |
+===============================+==========================+============================================================+
|in                             |Input image               |Input image                                                 |
+-------------------------------+--------------------------+------------------------------------------------------------+
|out                            |Output image              |Output image                                                |
+-------------------------------+--------------------------+------------------------------------------------------------+
|ram                            |Int                       |Int                                                         |
+-------------------------------+--------------------------+------------------------------------------------------------+
|op                             |Choices                   |Choices                                                     |
+-------------------------------+--------------------------+------------------------------------------------------------+
|op labeltocolor                | *Choice*                 |Label to color                                              |
+-------------------------------+--------------------------+------------------------------------------------------------+
|op colortolabel                | *Choice*                 |Color to label                                              |
+-------------------------------+--------------------------+------------------------------------------------------------+
|op.colortolabel.notfound       |Int                       |Int                                                         |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method                         |Choices                   |Choices                                                     |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method custom                  | *Choice*                 |Color mapping with custom labeled look-up table             |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method continuous              | *Choice*                 |Color mapping with continuous look-up table                 |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method optimal                 | *Choice*                 |Compute an optimized look-up table                          |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method image                   | *Choice*                 |Color mapping with look-up table calculated on support image|
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.custom.lut              |Input File name           |Input File name                                             |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut          |Choices                   |Choices                                                     |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut red      | *Choice*                 |Red                                                         |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut green    | *Choice*                 |Green                                                       |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut blue     | *Choice*                 |Blue                                                        |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut grey     | *Choice*                 |Grey                                                        |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut hot      | *Choice*                 |Hot                                                         |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut cool     | *Choice*                 |Cool                                                        |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut spring   | *Choice*                 |Spring                                                      |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut summer   | *Choice*                 |Summer                                                      |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut autumn   | *Choice*                 |Autumn                                                      |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut winter   | *Choice*                 |Winter                                                      |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut copper   | *Choice*                 |Copper                                                      |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut jet      | *Choice*                 |Jet                                                         |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut hsv      | *Choice*                 |HSV                                                         |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut overunder| *Choice*                 |OverUnder                                                   |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.lut relief   | *Choice*                 |Relief                                                      |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.min          |Float                     |Float                                                       |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.continuous.max          |Float                     |Float                                                       |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.optimal.background      |Int                       |Int                                                         |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.image.in                |Input image               |Input image                                                 |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.image.nodatavalue       |Float                     |Float                                                       |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.image.low               |Int                       |Int                                                         |
+-------------------------------+--------------------------+------------------------------------------------------------+
|method.image.up                |Int                       |Int                                                         |
+-------------------------------+--------------------------+------------------------------------------------------------+
|inxml                          |XML input parameters file |XML input parameters file                                   |
+-------------------------------+--------------------------+------------------------------------------------------------+
|outxml                         |XML output parameters file|XML output parameters file                                  |
+-------------------------------+--------------------------+------------------------------------------------------------+

**Input Image**
Input image filename.

**Output Image**
Output image filename.

**Available RAM (Mb)**
Available memory for processing (in MB).

**Operation**
Selection of the operation to execute (default is : label to color). Available choices are: 

- **Label to color**


- **Color to label**


 - **Not Found Label** : Label to use for unknown colors.



**Color mapping method**
Selection of color mapping methods and their parameters. Available choices are: 

- **Color mapping with custom labeled look-up table** : Apply a userdefined lookup table to a labeled image. Lookup table is loaded from a text file.


 - **Look-up table file** : An ASCII file containing the look-up table with one color per line (for instance the line '1 255 0 0' means that all pixels with label 1 will be replaced by RGB color 255 0 0) Lines beginning with a # are ignored.


 - **Color mapping with continuous look-up table** : Apply a continuous lookup table to a range of input values.


  - **Look-up tables** : Available look-up tables.

  - **Mapping range lower value** : Set the lower input value of the mapping range.

  - **Mapping range higher value** : Set the higher input value of the mapping range.


  - **Compute an optimized look-up table** : [label to color] Compute an optimal lookup table such that neighboring labels in a segmentation are mapped to highly contrasted colors.[color to label] Searching all the colors present in the image to compute a continuous label list


   - **Background label** : Value of the background label.


   - **Color mapping with look-up table calculated on support image**


    - **Support Image** : Support image filename. For each label, the LUT is calculated from the mean pixel value in the support image, over the corresponding labeled areas. First of all, the support image is normalized with extrema rejection.

    - **NoData value** : NoData value for each channel of the support image, which will not be handled in the LUT estimation. If NOT checked, ALL the pixel values of the support image will be handled in the LUT estimation.

    - **lower quantile** : lower quantile for image normalization.

    - **upper quantile** : upper quantile for image normalization.



**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_ColorMapping -in ROI_QB_MUL_1_SVN_CLASS_MULTI.png -method custom -method.custom.lut ROI_QB_MUL_1_SVN_CLASS_MULTI_PNG_ColorTable.txt -out Colorized_ROI_QB_MUL_1_SVN_CLASS_MULTI.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the ColorMapping application 
	ColorMapping = otbApplication.Registry.CreateApplication("ColorMapping")

	# The following lines set all the application parameters:
	ColorMapping.SetParameterString("in", "ROI_QB_MUL_1_SVN_CLASS_MULTI.png")

	ColorMapping.SetParameterString("method","custom")

	ColorMapping.SetParameterString("method.custom.lut", "ROI_QB_MUL_1_SVN_CLASS_MULTI_PNG_ColorTable.txt")

	ColorMapping.SetParameterString("out", "Colorized_ROI_QB_MUL_1_SVN_CLASS_MULTI.tif")

	# The following line execute the application
	ColorMapping.ExecuteAndWriteOutput()

Limitations
-----------

The segmentation optimal method does not support streaming, and thus large images. The operation color to label is not implemented for the methods continuous LUT and support image LUT.
 ColorMapping using support image is not threaded.

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

ImageSVMClassifier

