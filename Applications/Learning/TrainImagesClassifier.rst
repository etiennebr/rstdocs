Train a classifier from multiple images
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Train a classifier from multiple pairs of images and training vector data.

Detailed description
--------------------

This application performs a classifier training from multiple pairs of input images and training vector data. Samples are composed of pixel values in each band optionally centered and reduced using an XML statistics file produced by the ComputeImagesStatistics application. The training vector data must contain polygons with a positive integer field representing the class label. The name of this field can be set using the "Class label field" parameter. Training and validation sample lists are built such that each class is equally represented in both lists. One parameter allows to control the ratio between the number of samples in training and validation sets. Two parameters allow to manage the size of the training and validation sets per class and per image. Several classifier parameters can be set depending on the chosen classifier. In the validation process, the confusion matrix is organized the following way: rows = reference labels, columns = produced labels. In the header of the optional confusion matrix output file, the validation (reference) and predicted (produced) class labels are ordered according to the rows/columns of the confusion matrix. This application is based on LibSVM and on OpenCV Machine Learning classifiers, and is compatible with OpenCV 2.3.1 and later.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{TrainImagesClassifier_param_table}, page~\pageref{TrainImagesClassifier_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+TrainImagesClassifier+.

Parameters table for Train a classifier from multiple images:

+---------------------------+--------------------------+------------------------------------------+
|Parameter Key              |Parameter Type            |Parameter Description                     |
+===========================+==========================+==========================================+
|io                         |Group                     |Group                                     |
+---------------------------+--------------------------+------------------------------------------+
|io.il                      |Input image list          |Input image list                          |
+---------------------------+--------------------------+------------------------------------------+
|io.vd                      |Input vector data list    |Input vector data list                    |
+---------------------------+--------------------------+------------------------------------------+
|io.imstat                  |Input File name           |Input File name                           |
+---------------------------+--------------------------+------------------------------------------+
|io.confmatout              |Output File name          |Output File name                          |
+---------------------------+--------------------------+------------------------------------------+
|io.out                     |Output File name          |Output File name                          |
+---------------------------+--------------------------+------------------------------------------+
|elev                       |Group                     |Group                                     |
+---------------------------+--------------------------+------------------------------------------+
|elev.dem                   |Directory                 |Directory                                 |
+---------------------------+--------------------------+------------------------------------------+
|elev.geoid                 |Input File name           |Input File name                           |
+---------------------------+--------------------------+------------------------------------------+
|elev.default               |Float                     |Float                                     |
+---------------------------+--------------------------+------------------------------------------+
|sample                     |Group                     |Group                                     |
+---------------------------+--------------------------+------------------------------------------+
|sample.mt                  |Int                       |Int                                       |
+---------------------------+--------------------------+------------------------------------------+
|sample.mv                  |Int                       |Int                                       |
+---------------------------+--------------------------+------------------------------------------+
|sample.bm                  |Int                       |Int                                       |
+---------------------------+--------------------------+------------------------------------------+
|sample.edg                 |Boolean                   |Boolean                                   |
+---------------------------+--------------------------+------------------------------------------+
|sample.vtr                 |Float                     |Float                                     |
+---------------------------+--------------------------+------------------------------------------+
|sample.vfn                 |String                    |String                                    |
+---------------------------+--------------------------+------------------------------------------+
|classifier                 |Choices                   |Choices                                   |
+---------------------------+--------------------------+------------------------------------------+
|classifier libsvm          | *Choice*                 |LibSVM classifier                         |
+---------------------------+--------------------------+------------------------------------------+
|classifier.libsvm.k        |Choices                   |Choices                                   |
+---------------------------+--------------------------+------------------------------------------+
|classifier.libsvm.k linear | *Choice*                 |Linear                                    |
+---------------------------+--------------------------+------------------------------------------+
|classifier.libsvm.k rbf    | *Choice*                 |Gaussian radial basis function            |
+---------------------------+--------------------------+------------------------------------------+
|classifier.libsvm.k poly   | *Choice*                 |Polynomial                                |
+---------------------------+--------------------------+------------------------------------------+
|classifier.libsvm.k sigmoid| *Choice*                 |Sigmoid                                   |
+---------------------------+--------------------------+------------------------------------------+
|classifier.libsvm.c        |Float                     |Float                                     |
+---------------------------+--------------------------+------------------------------------------+
|classifier.libsvm.opt      |Boolean                   |Boolean                                   |
+---------------------------+--------------------------+------------------------------------------+
|rand                       |Int                       |Int                                       |
+---------------------------+--------------------------+------------------------------------------+
|inxml                      |XML input parameters file |XML input parameters file                 |
+---------------------------+--------------------------+------------------------------------------+
|outxml                     |XML output parameters file|XML output parameters file                |
+---------------------------+--------------------------+------------------------------------------+

**Input and output data**
This group of parameters allows to set input and output data.

- **Input Image List:** A list of input images.

- **Input Vector Data List:** A list of vector data to select the training samples.

- **Input XML image statistics file:** Input XML file containing the mean and the standard deviation of the input images.

- **Output confusion matrix:** Output file containing the confusion matrix (.csv format).

- **Output model:** Output file containing the model estimated (.txt format).



**Elevation management**
This group of parameters allows to manage elevation values. Supported formats are SRTM, DTED or any geotiff. DownloadSRTMTiles application could be a useful tool to list/download tiles related to a product.

- **DEM directory:** This parameter allows to select a directory containing Digital Elevation Model tiles.

- **Geoid File:** Use a geoid grid to get the height above the ellipsoid in case there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles. A version of the geoid can be found on the OTB website (http://hg.orfeo-toolbox.org/OTB-Data/raw-file/404aa6e4b3e0/Input/DEM/egm96.grd).

- **Default elevation:** This parameter allows to set the default height above ellipsoid when there is no DEM available, no coverage for some points or pixels with no_data in the DEM tiles, and no geoid file has been set. This is also used by some application as an average elevation value.



**Training and validation samples parameters**
This group of parameters allows to set training and validation sample lists parameters.

- **Maximum training sample size per class:** Maximum size per class (in pixels) of the training sample list (default = 1000) (no limit = -1). If equal to -1, then the maximal size of the available training sample list per class will be equal to the surface area of the smallest class multiplied by the training sample ratio.

- **Maximum validation sample size per class:** Maximum size per class (in pixels) of the validation sample list (default = 1000) (no limit = -1). If equal to -1, then the maximal size of the available validation sample list per class will be equal to the surface area of the smallest class multiplied by the validation sample ratio.

- **Bound sample number by minimum:** Bound the number of samples for each class by the number of available samples by the smaller class. Proportions between training and validation are respected. Default is true (=1).

- **On edge pixel inclusion:** Takes pixels on polygon edge into consideration when building training and validation samples.

- **Training and validation sample ratio:** Ratio between training and validation samples (0.0 = all training, 1.0 = all validation) (default = 0.5).

- **Name of the discrimination field:** Name of the field used to discriminate class labels in the input vector data files.



**Classifier to use for the training**
Choice of the classifier to use for the training. Available choices are: 

- **LibSVM classifier** : This group of parameters allows to set SVM classifier parameters.

 - **SVM Kernel Type** : SVM Kernel Type.

 - **Cost parameter C** : SVM models have a cost parameter C (1 by default) to control the trade-off between training errors and forcing rigid margins.

 - **Parameters optimization** : SVM parameters optimization flag.



**set user defined seed**
Set specific seed. with integer value.

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_TrainImagesClassifier -io.il QB_1_ortho.tif -io.vd VectorData_QB1.shp -io.imstat EstimateImageStatisticsQB1.xml -sample.mv 100 -sample.mt 100 -sample.vtr 0.5 -sample.edg false -sample.vfn Class -classifier libsvm -classifier.libsvm.k linear -classifier.libsvm.c 1 -classifier.libsvm.opt false -io.out svmModelQB1.txt -io.confmatout svmConfusionMatrixQB1.csv

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the TrainImagesClassifier application 
	TrainImagesClassifier = otbApplication.Registry.CreateApplication("TrainImagesClassifier")

	# The following lines set all the application parameters:
	TrainImagesClassifier.SetParameterStringList("io.il", ['QB_1_ortho.tif'])

	TrainImagesClassifier.SetParameterStringList("io.vd", ['VectorData_QB1.shp'])

	TrainImagesClassifier.SetParameterString("io.imstat", "EstimateImageStatisticsQB1.xml")

	TrainImagesClassifier.SetParameterInt("sample.mv", 100)

	TrainImagesClassifier.SetParameterInt("sample.mt", 100)

	TrainImagesClassifier.SetParameterFloat("sample.vtr", 0.5)

	TrainImagesClassifier.SetParameterString("sample.edg","1")

	TrainImagesClassifier.SetParameterString("sample.vfn", "Class")

	TrainImagesClassifier.SetParameterString("classifier","libsvm")

	TrainImagesClassifier.SetParameterString("classifier.libsvm.k","linear")

	TrainImagesClassifier.SetParameterFloat("classifier.libsvm.c", 1)

	TrainImagesClassifier.SetParameterString("classifier.libsvm.opt","1")

	TrainImagesClassifier.SetParameterString("io.out", "svmModelQB1.txt")

	TrainImagesClassifier.SetParameterString("io.confmatout", "svmConfusionMatrixQB1.csv")

	# The following line execute the application
	TrainImagesClassifier.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

OpenCV documentation for machine learning http://docs.opencv.org/modules/ml/doc/ml.html

