Fuzzy Model estimation
^^^^^^^^^^^^^^^^^^^^^^

Estimate feature fuzzy model parameters using 2 vector data (ground truth samples and wrong samples).

Detailed description
--------------------

Estimate feature fuzzy model parameters using 2 vector data (ground truth samples and wrong samples).

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{DSFuzzyModelEstimation_param_table}, page~\pageref{DSFuzzyModelEstimation_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+DSFuzzyModelEstimation+.

Parameters table for Fuzzy Model estimation:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|psin         |Input vector data         |Input vector data                 |
+-------------+--------------------------+----------------------------------+
|nsin         |Input vector data         |Input vector data                 |
+-------------+--------------------------+----------------------------------+
|belsup       |String list               |String list                       |
+-------------+--------------------------+----------------------------------+
|plasup       |String list               |String list                       |
+-------------+--------------------------+----------------------------------+
|cri          |String                    |String                            |
+-------------+--------------------------+----------------------------------+
|wgt          |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|initmod      |Input File name           |Input File name                   |
+-------------+--------------------------+----------------------------------+
|desclist     |String list               |String list                       |
+-------------+--------------------------+----------------------------------+
|maxnbit      |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|optobs       |Boolean                   |Boolean                           |
+-------------+--------------------------+----------------------------------+
|out          |Output File name          |Output File name                  |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Positive Vector Data:** Ground truth vector data for positive samples.

- **Input Negative Vector Data:** Ground truth vector data for negative samples.

- **Belief Support:** Dempster Shafer study hypothesis to compute belief.

- **Plausibility Support:** Dempster Shafer study hypothesis to compute plausibility.

- **Criterion:** Dempster Shafer criterion (by default (belief+plausibility)/2).

- **Weighting:** Coefficient between 0 and 1 to promote undetection or false detections (default 0.5).

- **initialization model:** Initialization model (xml file) to be used. If the xml initialization model is set, the descriptor list is not used (specified using the option -desclist).

- **Descriptor list:** List of the descriptors to be used in the model (must be specified to perform an automatic initialization).

- **Maximum number of iterations:** Maximum number of optimizer iteration (default 200).

- **Optimizer Observer:** Activate the optimizer observer.

- **Output filename:** Output model file name (xml file) contains the optimal model to perform informations fusion.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_DSFuzzyModelEstimation -psin cdbTvComputePolylineFeatureFromImage_LI_NOBUIL_gt.shp -nsin cdbTvComputePolylineFeatureFromImage_LI_NOBUIL_wr.shp -belsup "ROADSA" -plasup "NONDVI" "ROADSA" "NOBUIL" -initmod Dempster-Shafer/DSFuzzyModel_Init.xml -maxnbit 4 -optobs true -out DSFuzzyModelEstimation.xml

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the DSFuzzyModelEstimation application 
	DSFuzzyModelEstimation = otbApplication.Registry.CreateApplication("DSFuzzyModelEstimation")

	# The following lines set all the application parameters:
	DSFuzzyModelEstimation.SetParameterString("psin", "cdbTvComputePolylineFeatureFromImage_LI_NOBUIL_gt.shp")

	DSFuzzyModelEstimation.SetParameterString("nsin", "cdbTvComputePolylineFeatureFromImage_LI_NOBUIL_wr.shp")

	DSFuzzyModelEstimation.SetParameterStringList("belsup", ['"ROADSA"'])

	DSFuzzyModelEstimation.SetParameterStringList("plasup", ['"NONDVI"', '"ROADSA"', '"NOBUIL"'])

	DSFuzzyModelEstimation.SetParameterString("initmod", "Dempster-Shafer/DSFuzzyModel_Init.xml")

	DSFuzzyModelEstimation.SetParameterInt("maxnbit", 4)

	DSFuzzyModelEstimation.SetParameterString("optobs","1")

	DSFuzzyModelEstimation.SetParameterString("out", "DSFuzzyModelEstimation.xml")

	# The following line execute the application
	DSFuzzyModelEstimation.ExecuteAndWriteOutput()

Limitations
-----------

None.

Authors
-------

This application has been written by OTB-Team.

