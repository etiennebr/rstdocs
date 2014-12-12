Fusion of Classifications
^^^^^^^^^^^^^^^^^^^^^^^^^

Fuses several classifications maps of the same image on the basis of class labels.

Detailed description
--------------------

This application allows to fuse several classification maps and produces a single more robust classification map. Fusion is done either by mean of Majority Voting, or with the Dempster Shafer combination method on class labels. MAJORITY VOTING: for each pixel, the class with the highest number of votes is selected. DEMPSTER SHAFER: for each pixel, the class label for which the Belief Function is maximal is selected. This Belief Function is calculated by mean of the Dempster Shafer combination of Masses of Belief, and indicates the belief that each input classification map presents for each label value. Moreover, the Masses of Belief are based on the input confusion matrices of each classification map, either by using the PRECISION or RECALL rates, or the OVERALL ACCURACY, or the KAPPA coefficient. Thus, each input classification map needs to be associated with its corresponding input confusion matrix file for the Dempster Shafer fusion.Input pixels with the NODATA label are not handled in the fusion of classification maps. Moreover, pixels for which all the input classifiers are set to NODATA keep this value in the output fused image.In case of number of votes equality, the UNDECIDED label is attributed to the pixel.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{FusionOfClassifications_param_table}, page~\pageref{FusionOfClassifications_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+FusionOfClassifications+.

Parameters table for Fusion of Classifications:

+-----------------------------------+--------------------------+----------------------------------+
|Parameter Key                      |Parameter Type            |Parameter Description             |
+===================================+==========================+==================================+
|il                                 |Input image list          |Input image list                  |
+-----------------------------------+--------------------------+----------------------------------+
|method                             |Choices                   |Choices                           |
+-----------------------------------+--------------------------+----------------------------------+
|method majorityvoting              | *Choice*                 |Majority Voting                   |
+-----------------------------------+--------------------------+----------------------------------+
|method dempstershafer              | *Choice*                 |Dempster Shafer combination       |
+-----------------------------------+--------------------------+----------------------------------+
|method.dempstershafer.cmfl         |Input File name list      |Input File name list              |
+-----------------------------------+--------------------------+----------------------------------+
|method.dempstershafer.mob          |Choices                   |Choices                           |
+-----------------------------------+--------------------------+----------------------------------+
|method.dempstershafer.mob precision| *Choice*                 |Precision                         |
+-----------------------------------+--------------------------+----------------------------------+
|method.dempstershafer.mob recall   | *Choice*                 |Recall                            |
+-----------------------------------+--------------------------+----------------------------------+
|method.dempstershafer.mob accuracy | *Choice*                 |Overall Accuracy                  |
+-----------------------------------+--------------------------+----------------------------------+
|method.dempstershafer.mob kappa    | *Choice*                 |Kappa                             |
+-----------------------------------+--------------------------+----------------------------------+
|nodatalabel                        |Int                       |Int                               |
+-----------------------------------+--------------------------+----------------------------------+
|undecidedlabel                     |Int                       |Int                               |
+-----------------------------------+--------------------------+----------------------------------+
|out                                |Output image              |Output image                      |
+-----------------------------------+--------------------------+----------------------------------+
|inxml                              |XML input parameters file |XML input parameters file         |
+-----------------------------------+--------------------------+----------------------------------+
|outxml                             |XML output parameters file|XML output parameters file        |
+-----------------------------------+--------------------------+----------------------------------+

**Input classifications**
List of input classification maps to fuse. Labels in each classification image must represent the same class.

**Fusion method**
Selection of the fusion method and its parameters. Available choices are: 

- **Majority Voting** : Fusion of classification maps by majority voting for each output pixel.

- **Dempster Shafer combination** : Fusion of classification maps by the Dempster Shafer combination method for each output pixel.

 - **Confusion Matrices** : A list of confusion matrix files (\*.CSV format) to define the masses of belief and the class labels. Each file should be formatted the following way: the first line, beginning with a '#' symbol, should be a list of the class labels present in the corresponding input classification image, organized in the same order as the confusion matrix rows/columns.

 - **Mass of belief measurement** : Type of confusion matrix measurement used to compute the masses of belief of each classifier.



**Label for the NoData class**
Label for the NoData class. Such input pixels keep their NoData label in the output image and are not handled in the fusion process. By default, 'nodatalabel = 0'.

**Label for the Undecided class**
Label for the Undecided class. Pixels with more than 1 fused class are marked as Undecided. Please note that the Undecided value must be different from existing labels in the input classifications. By default, 'undecidedlabel = 0'.

**The output classification image**
The output classification image resulting from the fusion of the input classification images.

**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_FusionOfClassifications -il classification1.tif classification2.tif classification3.tif -method dempstershafer -method.dempstershafer.cmfl classification1.csv classification2.csv classification3.csv -method.dempstershafer.mob precision -nodatalabel 0 -undecidedlabel 10 -out classification_fused.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the FusionOfClassifications application 
	FusionOfClassifications = otbApplication.Registry.CreateApplication("FusionOfClassifications")

	# The following lines set all the application parameters:
	FusionOfClassifications.SetParameterStringList("il", ['classification1.tif', 'classification2.tif', 'classification3.tif'])

	FusionOfClassifications.SetParameterString("method","dempstershafer")


	FusionOfClassifications.SetParameterString("method.dempstershafer.mob","precision")

	FusionOfClassifications.SetParameterInt("nodatalabel", 0)

	FusionOfClassifications.SetParameterInt("undecidedlabel", 10)

	FusionOfClassifications.SetParameterString("out", "classification_fused.tif")

	# The following line execute the application
	FusionOfClassifications.ExecuteAndWriteOutput()

:Limitations:

None

:Authors:

This application has been written by OTB-Team.

:See Also:

These additional ressources can be useful for further information: 

ImageClassifier application

