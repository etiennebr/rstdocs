SOM Classification
^^^^^^^^^^^^^^^^^^

SOM image classification.

Detailed description
--------------------

Unsupervised Self Organizing Map image classification.

Parameters
----------

This section describes in details the parameters available for this application. Table [#]_ presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is *SOMClassification* .

.. [#] Table: Parameters table for SOM Classification.

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|vm           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|tp           |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|ts           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|sl           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|som          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|sx           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|sy           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|nx           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|ny           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|ni           |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|bi           |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|bf           |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|iv           |Float                     |Float                             |
+-------------+--------------------------+----------------------------------+
|ram          |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|rand         |Int                       |Int                               |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **InputImage:** Input image to classify.

- **OutputImage:** Output classified image (each pixel contains the index of its corresponding vector in the SOM).

- **ValidityMask:** Validity mask (only pixels corresponding to a mask value greater than 0 will be used for learning).

- **TrainingProbability:** Probability for a sample to be selected in the training set.

- **TrainingSetSize:** Maximum training set size (in pixels).

- **StreamingLines:** Number of lines in each streaming block (used during data sampling).

- **SOM Map:** Output image containing the Self-Organizing Map.

- **SizeX:** X size of the SOM map.

- **SizeY:** Y size of the SOM map.

- **NeighborhoodX:** X size of the initial neighborhood in the SOM map.

- **NeighborhoodY:** Y size of the initial neighborhood in the SOM map.

- **NumberIteration:** Number of iterations for SOM learning.

- **BetaInit:** Initial learning coefficient.

- **BetaFinal:** Final learning coefficient.

- **InitialValue:** Maximum initial neuron weight.

- **Available RAM (Mb):** Available memory for processing (in MB).

- **set user defined seed:** Set specific seed. with integer value.

- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_SOMClassification -in QB_1_ortho.tif -out SOMClassification.tif -tp 1.0 -ts 16384 -sl 32 -sx 32 -sy 32 -nx 10 -ny 10 -ni 5 -bi 1.0 -bf 0.1 -iv 0

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the SOMClassification application 
	SOMClassification = otbApplication.Registry.CreateApplication("SOMClassification")

	# The following lines set all the application parameters:
	SOMClassification.SetParameterString("in", "QB_1_ortho.tif")

	SOMClassification.SetParameterString("out", "SOMClassification.tif")

	SOMClassification.SetParameterFloat("tp", 1.0)

	SOMClassification.SetParameterInt("ts", 16384)

	SOMClassification.SetParameterInt("sl", 32)

	SOMClassification.SetParameterInt("sx", 32)

	SOMClassification.SetParameterInt("sy", 32)

	SOMClassification.SetParameterInt("nx", 10)

	SOMClassification.SetParameterInt("ny", 10)

	SOMClassification.SetParameterInt("ni", 5)

	SOMClassification.SetParameterFloat("bi", 1.0)

	SOMClassification.SetParameterFloat("bf", 0.1)

	SOMClassification.SetParameterFloat("iv", 0)

	# The following line execute the application
	SOMClassification.ExecuteAndWriteOutput()

Limitations
~~~~~~~~~~~

None

Authors
~~~~~~~

This application has been written by OTB-Team.

