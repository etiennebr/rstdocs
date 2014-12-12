Optical calibration
^^^^^^^^^^^^^^^^^^^

Perform optical calibration TOA/TOC (Top Of Atmosphere/Top Of Canopy). Supported sensors: QuickBird, Ikonos, WorldView2, Formosat, Spot5, Pleiades, Spot6. For other sensors the application also allows to provide calibration parameters manually.

Detailed description
--------------------

The application allows to convert pixel values from DN (for Digital Numbers) to physically interpretable and comparable values. Calibrated values are called surface reflectivity and its values lie in the range [0, 1].The first level is called Top Of Atmosphere (TOA) reflectivity. It takes into account the sensor gain, sensor spectral response and the solar illuminations.The second level is called Top Of Canopy (TOC) reflectivity. In addition to sensor gain and solar illuminations, it takes into account the optical thickness of the atmosphere, the atmospheric pressure, the water vapor amount, the ozone amount, as well as the composition and amount of aerosol gasses.It is also possible to indicate an AERONET file which contains atmospheric parameters (version 1 and version 2 of Aeronet file are supported.If the sensor is not supported by the metadata interface factory of OTB, users still have the possibility to give the needed parameters to the application.For TOA conversion, these parameters are :  day and month of acquisition, or flux normalization coefficient; sun elevation angle; gains and biases, one pair of values for each band (passed by a file); solar illuminations, one value for each band (passed by a file).For the conversion from DN (for Digital Numbers) to spectral radiance (or 'TOA radiance') L, the following formula is used :(1)	L(b) = DN(b)/gain(b)+bias(b)	(in W/m2/steradians/micrometers)	with b being a band ID.These values are provided by the user thanks to a simple txt file with two lines, one for the gains and one for the biases.Each value must be separated with colons (:), with eventual spaces. Blank lines are not allowed. If a line begins with the '#' symbol, then it is considered as comments.Note that sometimes, the values provided by certain metadata files assume the formula L(b) = gain(b)*DC(b)+bias(b).In this case, be sure to provide the inverse gain values so that the application can correctly interpret them.In order to convert TOA radiance to TOA reflectance, the following formula is used :(2)	R(b) = (pi*L(b)*d*d) / (ESUN(b)*cos(θ))	(no dimension)	where :  L(b) is the spectral radiance for band b  pi is the famous mathematical constant (3.14159...)  d is the earthsun distance (in astronomical units) and depends on the acquisition's day and month  ESUN(b) is the mean TOA solar irradiance (or solar illumination) in W/m²/micrometers θ is the solar zenith angle in degrees. Note that the application asks for the solar elevation angle, and will perfom the conversion to the zenith angle itself (ze. angle = 90°  el. angle).Note also that ESUN(b) not only depends on the band b, but also on the spectral sensitivity of the sensor in this particular band. In other words, the influence of spectral sensitivities is included within the ESUN different values.These values are provided by the user thanks to a txt file following the same convention as before.Instead of providing the date of acquisition, the user can also provide a flux normalization coefficient 'fn'. The formula used instead will be the following : (3) 	R(b) = (pi*L(b)) / (ESUN(b)*fn*fn*cos(θ)) Whatever the formula used (2 or 3), the user should pay attention to the interpretation of the parameters he will provide to the application, by taking into account the original formula that the metadata files assumes.Below, we give two examples of txt files containing information about gains/biases and solar illuminations : gainbias.txt :# Gain values for each band. Each value must be separated with colons (:), with eventual spaces. Blank lines not allowed.10.4416 : 9.529 : 8.5175 : 14.0063# Bias values for each band.0.0 : 0.0 : 0.0 : 0.0 solarillumination.txt : # Solar illumination values in watt/m2/micron ('micron' means actually 'for each band').# Each value must be separated with colons (:), with eventual spaces. Blank lines not allowed.1540.494123 : 1826.087443 : 1982.671954 : 1094.747446Finally, the 'Logs' tab provides usefull messages that can help the user in knowing the process different status.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{OpticalCalibration_param_table}, page~\pageref{OpticalCalibration_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+OpticalCalibration+.

Parameters table for Optical calibration:

+------------------------+--------------------------+------------------------------------------------------------+
|Parameter Key           |Parameter Type            |Parameter Description                                       |
+========================+==========================+============================================================+
|in                      |Input image               |Input image                                                 |
+------------------------+--------------------------+------------------------------------------------------------+
|out                     |Output image              |Output image                                                |
+------------------------+--------------------------+------------------------------------------------------------+
|ram                     |Int                       |Int                                                         |
+------------------------+--------------------------+------------------------------------------------------------+
|level                   |Choices                   |Choices                                                     |
+------------------------+--------------------------+------------------------------------------------------------+
|level toa               | *Choice*                 |Image to Top Of Atmosphere reflectance                      |
+------------------------+--------------------------+------------------------------------------------------------+
|level toatoim           | *Choice*                 |TOA reflectance to Image                                    |
+------------------------+--------------------------+------------------------------------------------------------+
|level toc               | *Choice*                 |Image to Top Of Canopy reflectance (atmospheric corrections)|
+------------------------+--------------------------+------------------------------------------------------------+
|milli                   |Boolean                   |Boolean                                                     |
+------------------------+--------------------------+------------------------------------------------------------+
|clamp                   |Boolean                   |Boolean                                                     |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui                   |Group                     |Group                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.minute            |Int                       |Int                                                         |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.hour              |Int                       |Int                                                         |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.day               |Int                       |Int                                                         |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.month             |Int                       |Int                                                         |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.year              |Int                       |Int                                                         |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.fluxnormcoeff     |Float                     |Float                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.sun               |Group                     |Group                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.sun.elev          |Float                     |Float                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.sun.azim          |Float                     |Float                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.view              |Group                     |Group                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.view.elev         |Float                     |Float                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.view.azim         |Float                     |Float                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.gainbias          |Input File name           |Input File name                                             |
+------------------------+--------------------------+------------------------------------------------------------+
|acqui.solarilluminations|Input File name           |Input File name                                             |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo                    |Group                     |Group                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.aerosol            |Choices                   |Choices                                                     |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.aerosol noaersol   | *Choice*                 |No Aerosol Model                                            |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.aerosol continental| *Choice*                 |Continental                                                 |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.aerosol maritime   | *Choice*                 |Maritime                                                    |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.aerosol urban      | *Choice*                 |Urban                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.aerosol desertic   | *Choice*                 |Desertic                                                    |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.oz                 |Float                     |Float                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.wa                 |Float                     |Float                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.pressure           |Float                     |Float                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.opt                |Float                     |Float                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.aeronet            |Input File name           |Input File name                                             |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.rsr                |Input File name           |Input File name                                             |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.radius             |Int                       |Int                                                         |
+------------------------+--------------------------+------------------------------------------------------------+
|atmo.pixsize            |Float                     |Float                                                       |
+------------------------+--------------------------+------------------------------------------------------------+
|inxml                   |XML input parameters file |XML input parameters file                                   |
+------------------------+--------------------------+------------------------------------------------------------+
|outxml                  |XML output parameters file|XML output parameters file                                  |
+------------------------+--------------------------+------------------------------------------------------------+

**Input**
Input image filename (values in DN).

**Output**
Output calibrated image filename.

**Available RAM (Mb)**
Available memory for processing (in MB).

**Calibration Level**
 Available choices are: 

- **Image to Top Of Atmosphere reflectance**

- **TOA reflectance to Image**

- **Image to Top Of Canopy reflectance (atmospheric corrections)**


**Convert to milli reflectance**
Flag to use milli-reflectance instead of reflectance. This allows to save the image with integer pixel type (in the range [0, 1000]  instead of floating point in the range [0, 1]. In order to do that, use this option and set the output pixel type (-out filename double for example).

**Clamp of reflectivity values between [0, 100]**
Clamping in the range [0, 100]. It can be useful to preserve area with specular reflectance.

**Acquisition parameters**
This group allows to set the parameters related to the acquisition conditions.

- **Minute:** Minute (0-59).

- **Hour:** Hour (0-23).

- **Day:** Day (1-31).

- **Month:** Month (1-12).

- **Year:** Year.

- **Flux Normalization:** Flux Normalization Coefficient.

- **Sun angles:** This group contains the sun angles.

- **Sun elevation angle (°):** Sun elevation angle (in degrees).

- **Sun azimuth angle (°):** Sun azimuth angle (in degrees).



- **Viewing angles:** This group contains the sensor viewing angles.

- **Viewing elevation angle (°):** Viewing elevation angle (in degrees).

- **Viewing azimuth angle (°):** Viewing azimuth angle (in degrees).



- **Gains | biases:** Gains | biases.

- **Solar illuminations:** Solar illuminations (one value per band).



**Atmospheric parameters (for TOC)**
This group allows to set the atmospheric parameters.

- **Aerosol Model:** 

 Available choices are: 

- **No Aerosol Model**

- **Continental**

- **Maritime**

- **Urban**

- **Desertic**
- **Ozone Amount:** Ozone Amount.

- **Water Vapor Amount:** Water Vapor Amount (in saturation fraction of water).

- **Atmospheric Pressure:** Atmospheric Pressure (in hPa).

- **Aerosol Optical Thickness:** Aerosol Optical Thickness.

- **Aeronet File:** Aeronet file containing atmospheric parameters.

- **Relative Spectral Response File:** Sensor relative spectral response file By default the application gets these informations in the metadata.

- **Window radius (adjacency effects):** Window radius for adjacency effects correctionsSetting this parameters will enable the correction ofadjacency effects.

- **Pixel size (in km):** Pixel size (in km )used tocompute adjacency effects, it doesn't have tomatch the image spacing.



**Load otb application from xml file**
Load otb application from xml file.

**Save otb application to xml file**
Save otb application to xml file.

Example
-------

To run this example in command-line, use the following: 
::

	otbcli_OpticalCalibration -in QB_1_ortho.tif -level toa -out OpticalCalibration.tif

To run this example from Python, use the following code snippet: 

::

	#!/usr/bin/python

	# Import the otb applications package
	import otbApplication

	# The following line creates an instance of the OpticalCalibration application 
	OpticalCalibration = otbApplication.Registry.CreateApplication("OpticalCalibration")

	# The following lines set all the application parameters:
	OpticalCalibration.SetParameterString("in", "QB_1_ortho.tif")

	OpticalCalibration.SetParameterString("level","toa")

	OpticalCalibration.SetParameterString("out", "OpticalCalibration.tif")

	# The following line execute the application
	OpticalCalibration.ExecuteAndWriteOutput()

:Limitations:

None

:Authors:

This application has been written by OTB-Team.

:See Also:

These additional ressources can be useful for further information: 

The OTB CookBook

