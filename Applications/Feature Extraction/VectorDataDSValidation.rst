Vector Data validation
^^^^^^^^^^^^^^^^^^^^^^

Vector data validation based on the fusion of features using Dempster-Shafer evidence theory framework.

Detailed description
--------------------

This application validates or unvalidate the studied samples using the Dempster-Shafer theory.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{VectorDataDSValidation_param_table}, page~\pageref{VectorDataDSValidation_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+VectorDataDSValidation+.

Parameters table for Vector Data validation:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input vector data         |Input vector data                 |
+-------------+--------------------------+----------------------------------+
|descmod      |Input File name           |Input File name                   |
+-------------+--------------------------+----------------------------------+
|belsup       |String list               |String list                       |
+-------------+--------------------------+----------------------------------+
|plasup       |String list               |String list                       |
+-------------+--------------------------+----------------------------------+
|cri          |String                    |String                            |
+-------------+--------------------------+----------------------------------+
|thd          |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|out          |Output vector data        |Output vector data                |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Vector Data:** Input vector data to validate.

- **Descriptors model filename:** Fuzzy descriptors model (xml file).

- **Belief Support:** Dempster Shafer study hypothesis to compute belief.

- **Plausibility Support:** Dempster Shafer study hypothesis to compute plausibility.

- **Criterion:** Dempster Shafer criterion (by default (belief+plausibility)/2).

- **Criterion threshold:** Criterion threshold (default 0.5).

- **Output Vector Data:** Output VectorData containing only the validated samples.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_VectorDataDSValidation -in cdbTvComputePolylineFeatureFromImage_LI_NOBUIL_gt.shp -belsup cdbTvComputePolylineFeatureFromImage_LI_NOBUIL_gt.shp -descmod DSFuzzyModel.xml -out VectorDataDSValidation.shp

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the VectorDataDSValidation application 
	VectorDataDSValidation = otbApplication.Registry.CreateApplication("VectorDataDSValidation")

	# The following lines set all the application parameters:
	VectorDataDSValidation.SetParameterString("in", "cdbTvComputePolylineFeatureFromImage_LI_NOBUIL_gt.shp")

	VectorDataDSValidation.SetParameterStringList("belsup", ['cdbTvComputePolylineFeatureFromImage_LI_NOBUIL_gt.shp'])

	VectorDataDSValidation.SetParameterString("descmod", "DSFuzzyModel.xml")

	VectorDataDSValidation.SetParameterString("out", "VectorDataDSValidation.shp")

	# The following line execute the application
	VectorDataDSValidation.ExecuteAndWriteOutput()

Limitations
-----------

None.

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

http://en.wikipedia.org/wiki/Dempster-Shafer_theory

