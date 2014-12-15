Hyperspectral data unmixing
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Estimate abundance maps from an hyperspectral image and a set of endmembers.

Detailed description
--------------------

The application applies a linear unmixing algorithm to an hyperspectral data cube. This method supposes that the mixture between materials in the scene is macroscopic and simulates a linear mixing model of spectra.
The Linear Mixing Model (LMM) acknowledges that reflectance spectrum associated with each pixel is a linear combination of pure materials in the recovery area, commonly known as endmembers. Endmembers can be estimated using the VertexComponentAnalysis application.
The application allows to estimate the abundance maps with several algorithms : Unconstrained Least Square (ucls), Fully Constrained Least Square (fcls), Image Space Reconstruction Algorithm (isra) and Non-negative constrained Least Square (ncls) and Minimum Dispertion Constrained Non Negative Matrix Factorization (MDMDNMF).


Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{HyperspectralUnmixing_param_table}, page~\pageref{HyperspectralUnmixing_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+HyperspectralUnmixing+.

Parameters table for Hyperspectral data unmixing:

+-------------+--------------------------+----------------------------------+
|Parameter Key|Parameter Type            |Parameter Description             |
+=============+==========================+==================================+
|in           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|out          |Output image              |Output image                      |
+-------------+--------------------------+----------------------------------+
|ie           |Input image               |Input image                       |
+-------------+--------------------------+----------------------------------+
|ua           |Choices                   |Choices                           |
+-------------+--------------------------+----------------------------------+
|ua ucls      | *Choice*                 |UCLS                              |
+-------------+--------------------------+----------------------------------+
|ua ncls      | *Choice*                 |NCLS                              |
+-------------+--------------------------+----------------------------------+
|ua isra      | *Choice*                 |ISRA                              |
+-------------+--------------------------+----------------------------------+
|ua mdmdnmf   | *Choice*                 |MDMDNMF                           |
+-------------+--------------------------+----------------------------------+
|inxml        |XML input parameters file |XML input parameters file         |
+-------------+--------------------------+----------------------------------+
|outxml       |XML output parameters file|XML output parameters file        |
+-------------+--------------------------+----------------------------------+

- **Input Image Filename:** The hyperspectral data cube to unmix.

- **Output Image:** The output abundance map.

- **Input endmembers:** The endmembers (estimated pure pixels) to use for unmixing. Must be stored as a multispectral image, where each pixel is interpreted as an endmember.

- **Unmixing algorithm:** The algorithm to use for unmixing. Available choices are: 

- **UCLS** : Unconstrained Least Square


- **NCLS** : Nonnegative constrained Least Square


- **ISRA** : Image Space Reconstruction Algorithm


- **MDMDNMF** : Minimum Dispertion Constrained Non Negative Matrix Factorization



- **Load otb application from xml file:** Load otb application from xml file.

- **Save otb application to xml file:** Save otb application to xml file.



Example
-------

To run this example in command-line, use the following: 
::

	otbcli_HyperspectralUnmixing -in cupriteSubHsi.tif -ie cupriteEndmembers.tif -out HyperspectralUnmixing.tif double -ua ucls

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the HyperspectralUnmixing application 
	HyperspectralUnmixing = otbApplication.Registry.CreateApplication("HyperspectralUnmixing")

	# The following lines set all the application parameters:
	HyperspectralUnmixing.SetParameterString("in", "cupriteSubHsi.tif")

	HyperspectralUnmixing.SetParameterString("ie", "cupriteEndmembers.tif")

	HyperspectralUnmixing.SetParameterString("out", "HyperspectralUnmixing.tif")
	HyperspectralUnmixing.SetParameterOutputImagePixelType("out", 7)

	HyperspectralUnmixing.SetParameterString("ua","ucls")

	# The following line execute the application
	HyperspectralUnmixing.ExecuteAndWriteOutput()

Limitations
-----------

None

Authors
-------

This application has been written by OTB-Team.

See Also
--------

These additional ressources can be useful for further information: 

VertexComponentAnalysis

