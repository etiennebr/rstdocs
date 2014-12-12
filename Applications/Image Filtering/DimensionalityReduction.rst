Dimensionality reduction
^^^^^^^^^^^^^^^^^^^^^^^^

Perform Dimension reduction of the input image.

Detailed description
--------------------

Performs dimensionality reduction on input image. PCA,NAPCA,MAF,ICA methods are available. It is also possible to compute the inverse transform to reconstruct the image. It is also possible to optionnaly export the transformation matrix to a text file.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{DimensionalityReduction_param_table}, page~\pageref{DimensionalityReduction_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+DimensionalityReduction+.

Parameters table for Dimensionality reduction:

+--------------------+--------------------------+------------------------------------------+
|Parameter Key       |Parameter Type            |Parameter Description                     |
+====================+==========================+==========================================+
|in                  |Input image               |Input image                               |
+--------------------+--------------------------+------------------------------------------+
|out                 |Output image              |Output image                              |
+--------------------+--------------------------+------------------------------------------+
|rescale             |Group                     |Group                                     |
+--------------------+--------------------------+------------------------------------------+
|rescale.outmin      |Float                     |Float                                     |
+--------------------+--------------------------+------------------------------------------+
|rescale.outmax      |Float                     |Float                                     |
+--------------------+--------------------------+------------------------------------------+
|outinv              |Output image              |Output image                              |
+--------------------+--------------------------+------------------------------------------+
|method              |Choices                   |Choices                                   |
+--------------------+--------------------------+------------------------------------------+
|method pca          | *Choice*                 |PCA                                       |
+--------------------+--------------------------+------------------------------------------+
|method napca        | *Choice*                 |NA-PCA                                    |
+--------------------+--------------------------+------------------------------------------+
|method maf          | *Choice*                 |MAF                                       |
+--------------------+--------------------------+------------------------------------------+
|method ica          | *Choice*                 |ICA                                       |
+--------------------+--------------------------+------------------------------------------+
|method.napca.radiusx|Int                       |Int                                       |
+--------------------+--------------------------+------------------------------------------+
|method.napca.radiusy|Int                       |Int                                       |
+--------------------+--------------------------+------------------------------------------+
|method.ica.iter     |Int                       |Int                                       |
+--------------------+--------------------------+------------------------------------------+
|method.ica.mu       |Float                     |Float                                     |
+--------------------+--------------------------+------------------------------------------+
|nbcomp              |Int                       |Int                                       |
+--------------------+--------------------------+------------------------------------------+
|normalize           |Boolean                   |Boolean                                   |
+--------------------+--------------------------+------------------------------------------+
|outmatrix           |Output File name          |Output File name                          |
+--------------------+--------------------------+------------------------------------------+
|inxml               |XML input parameters file |XML input parameters file                 |
+--------------------+--------------------------+------------------------------------------+
|outxml              |XML output parameters file|XML output parameters file                |
+--------------------+--------------------------+------------------------------------------+

**Input Image**
The input image to apply dimensionality reduction.

**Output Image**
output image. Components are ordered by decreasing eigenvalues.

**Rescale Output.**


- **Output min value:** Minimum value of the output image.

- **Output max value:** Maximum value of the output image.



**Inverse Output Image**
reconstruct output image.

**Algorithm**
Selection of the reduction dimension method. Available choices are: 

- **PCA** : Principal Component Analysis.

- **NA-PCA** : Noise Adjusted Principal Component Analysis.

 - **Set the x radius of the sliding window.** : 

 - **Set the y radius of the sliding window.** : 


- **MAF** : Maximum Autocorrelation Factor.

- **ICA** : Independant Component Analysis.

 - **number of iterations** : 

 - **Give the increment weight of W in [0, 1]** : 



**Number of Components.**
Number of relevant components kept. By default all components are kept.

**Normalize.**
center AND reduce data before Dimensionality reduction.

**Transformation matrix output (text format)**
Filename to store the transformation matrix (csv format).

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_DimensionalityReduction -in cupriteSubHsi.tif -out FilterOutput.tif -method pca

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the DimensionalityReduction application 
	DimensionalityReduction = otbApplication.Registry.CreateApplication("DimensionalityReduction")

	# The following lines set all the application parameters:
	DimensionalityReduction.SetParameterString("in", "cupriteSubHsi.tif")

	DimensionalityReduction.SetParameterString("out", "FilterOutput.tif")

	DimensionalityReduction.SetParameterString("method","pca")

	# The following line execute the application
	DimensionalityReduction.ExecuteAndWriteOutput()

:Limitations:

This application does not provide the inverse transform and the transformation matrix export for the MAF.

:Authors:

This application has been written by OTB-Team.

:See Also:

These additional ressources can be useful for further information: 

"Kernel maximum autocorrelation factor and minimum noise fraction transformations," IEEE Transactions on Image Processing, vol. 20, no. 3, pp. 612-624, (2011)

