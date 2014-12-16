A brief tour of Monteverdi
==========================

Introduction
------------

The **OTB Applications** package makes available a set of simple
software tools, which were designed to demonstrate what can be done with
**Orfeo Toolbox** . Many users started using these applications for real
processing tasks, so we tried to make them more generic, more robust and
easy to use. **Orfeo Toolbox** users have been asking for an integrated
application for a while, since using several applications for a complete
processing (ortho-rectification, segmentation, classification, etc.) can
be a burden. Recently, the OTB team received a request from CNES’
Strategy and Programs Office in order to provide an integrated
application for capacity building activities (teaching, simple image
manipulation, etc.). The specifications included ease of integration of
new processing modules.

Installation
------------

The application is called **Monteverdi** , since this is the name of the
Orfeo composer. The application allows you to build interactivelly
remote sensing processes based on the **Orfeo Toolbox** . This is also
in remembering of the great (and once open source) Khoros/Cantata
software.

Installation of **Monteverdi** is very simple. Standard installer
packages are available on the main platforms thanks to OTB-Developpers
and external users. These packages are available few days after the
release. Get the latest information on binary packages on the `Orfeo
ToolBox website <http://orfeo-toolbox.org>`_  in the section download.

We will discribe in the following sections the way to install monteverdi
on:

-  Windows platform (XP/Seven)

-  Ubuntu 12.04 and higher

-  OpenSuse 12.X and higher

-  MacOSX 10.8

If you want build from source or if we don’t provide packages for your
system, some informations are available into the `OTB Software
Guide <http://orfeo-toolbox.org/SoftwareGuide>`_  , in the section
**(**\ Building from Source)

Windows XP/Seven/8.1
~~~~~~~~~~~~~~~~~~~~

For Windows XP/Seven/8.1 users, there is a classical standalone
installation program for Monteverdi, available from the `OTB download
page <http://sourceforge.net/projects/orfeo-toolbox/>`_  after each
release.

Since version 1.12, it is also possible to get Monteverdi package
through `OSGeo4W <http://trac.osgeo.org/osgeo4w/>`_  for Windows
XP/Seven users. Package for Monteverdi is available directly in the
OSGeo4W installer when you select the **otb-monteverdi** package. Follow
the instructions in the OSGeo4W installer and select the
**otb-monteverdi**. The installer will proceed with the installation of
the package and all its dependencies. Monteverdi will be directly
installed in the OSGeo4W repository and a shortcut will be added to your
desktop and in the start menu (in the OSGeo4W folder). You can now use
directly Monteverdi from your desktop, from the start menu and from an
OSGeo4W shell with command ``monteverdi``. Currently, you should use the
32bit OSGeo4W installer but we will soon distribute monteverdi package
for 64 bit installer.

MacOS X
~~~~~~~

A standard DMG package is available for Monteverdi for MacOS X 10.8.
Please go the `OTB download
page <http://sourceforge.net/projects/orfeo-toolbox/>`_  . Click on the
file to launch Monteverdi. This DMG file is also compatible with MacOSX
10.9.

Ubuntu 12.04 and higher
~~~~~~~~~~~~~~~~~~~~~~~

For Ubuntu 12.04 and higher, Monteverdi package may be available as
Debian package through APT repositories.

Since release 1.14, Monteverdi packages are available in the
`ubuntugis-unstable <https://launchpad.net/~ubuntugis/+archive/ubuntugis-unstable>`_ 
repository.

You can add it by using these command-lines:

::

    sudo aptitude install add-apt-repository
    sudo apt-add-repository ppa:ubuntugis/ubuntugis-unstable

Now run:

::

    sudo aptitude install monteverdi

If you are using *Synaptic*, you can add the repository, update and
install the package through the graphical interface.

**apt-add-repository** will try to retrieve the GPG keys of the
repositories to certify the origin of the packages. If you are behind a
http proxy, this step won’t work and apt-add-repository will stall and
eventually quit. You can temporarily ignore this error and proceed with
the update step. Following this, aptitude update will issue a warning
about a signature problem. This warning won’t prevent you from
installing the packages.

OpenSuse 11.X and higher
~~~~~~~~~~~~~~~~~~~~~~~~

For OpenSuse 12.X and higher, Monteverdi packages is available through
*zypper*.

First, you need to add the appropriate repositories with these
command-lines (please replace :math:`11.4` by your OpenSuse version):

::

    sudo zypper ar
    http://download.opensuse.org/repositories/games/openSUSE_11.4/ Games
    sudo zypper ar
    http://download.opensuse.org/repositories/Application:/Geo/openSUSE_11.4/ GEO
    sudo zypper ar
    http://download.opensuse.org/repositories/home:/tzotsos/openSUSE_11.4/ tzotsos

Now run:

::

    sudo zypper refresh
    sudo zypper install Monteverdi

Alternatively you can use the One-Click Installer from the `openSUSE
Download
page <http://software.opensuse.org/search?q=Orfeo&baseproject=openSUSE%3A11.4&lang=en&include_home=true&exclude_debug=true>`_ 
or add the above repositories and install through Yast Package
Management.

There is also support for the recently introduced ’rolling’ openSUSE
distribution named ’Tumbleweed’. For Tumbleweed you need to add the
following repositories with these command-lines:

::

    sudo zypper ar
    http://download.opensuse.org/repositories/games/openSUSE_Tumbleweed/ Games
    sudo zypper ar
    http://download.opensuse.org/repositories/Application:/Geo/openSUSE_Tumbleweed/ GEO
    sudo zypper ar
    http://download.opensuse.org/repositories/home:/tzotsos/openSUSE_Tumbleweed/ tzotsos

and then add the monteverdi packages as shown above.

Anatomy of the applications
---------------------------

What does it look like?
~~~~~~~~~~~~~~~~~~~~~~~

image1 [fig:mainwindow]

This is Monteverdi’s main window (figure  [fig:mainwindow]) where the
menus are available and where you can see the different modules, which
have been set up for the processing. Input data are obtained by readers.
When you choose to use a new module, you select its input data, and
therefore, you build a processing pipeline sequentially. Figure
 [fig:inputswindow] shows the generic window which allows to specify
output(s) of Monteverdi’s modules.

image2 [fig:inputswindow]

Let’s have a look at the different menus. The first one is of course the
“File” menu. This menu allows you to open a data set, to save it and to
cache it. The “data set” concept is interesting, since you don’t need to
define by hand if you are looking for an image or a vector file. Of
course, you don’t need to do anything special for any particular file
format. So opening a data set will create a “reader” which will appear
in the main window. At any time, you can use the “save data set” option
in order to store to a file the result of any processing module.

Open an image with **Monteverdi** 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The application allows to interactively select raster/vector dataset by
browsing your computer. Monteverdi takes advantage of the automatic
detection of images’ extensions to indicate the dataset type (optical,
SAR or vector data).

The input dataset is added to the “Data and Process” tree, which
describes the dataset content and each node corresponds to a layer.

Visualize an image with **Monteverdi** 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This module allows to visualize raster or vector data. It allows to
create RGB composition from the input rasters. It is also possible to
add vector dataset which are automatically reprojected in the same
projection of the input image or Digital Elevation informations.

The viewer offers three types of data visualisation:

-  The Scroll window : to navigate quickly inside the entire scene

-  The Full resolution window: the view of the region of interest
   selected in the scroll window

-  The Zoom window

-  The Pixel description: give access to dynamic informations on the
   current pixel pointed. Informations display are:

   -  The current index

   -  The pixel value

   -  The computed value (the dynamic of hte input image is modified to
      get a proper visualization

   -  The coordinates of the current pixel (longitude and latitude)

   -  In case where there is a Internet connection available, Monteverdi
      displays the estimate location of the current pixel (country +
      city)

image3 [fig:viewerpixeldescription]

The Visualization offers others great functionnalities which are
available in the detached window. It is for example possible to
superpose vector dataset to the input image (see figure
 [fig:viewervectordata]).

image4 [fig:viewervectordata]

The “Setup Tab” allows to modify the RGB composition or use the
grayscale mode to display only one layer.

image5 [fig:rgbcomposition]

The “Histogram Tab” get access to the dynamic of the displayed layers.
The basic idea is to convert the output of the pixel representation to a
RGB pixel for rendering on conventional displays. Values are constrained
to 0-255 with a transfer function and a clamping operation. By default,
the dynamic of each layer is modified by clamping the histogram at
:math:`min + 2\%` and :math:`max - 2\%`.

image6 [fig:histogram]

There is also possible to select pixel coordinates and get access to all
the informations available in the “Pixel description Box”.

image7 [fig:pixeldescriptioninformations]

Cache dataset
~~~~~~~~~~~~~

The “cache data set” (see figure  [fig:cachingmodule]) is a very
interesting functionality. As you know, **Orfeo Toolbox** implements
processing on demand, so when you build a processing pipeline, no
processing takes place unless you ask for it explicitly. That means that
you can plug together the opening of a data set, an orthorectification
and a spleckle filter, for example, but nothing will really be computed
until you trigger the pipeline execution. This is very convenient, since
you can quickly build a processing pipeline and let it execute
afterwards while you have a coffee. In **Monteverdi** , the process is
executed by saving the result of the last module of a pipeline. However,
sometimes, you may want to execute a part of the pipeline without having
to set the file name to the obtained result. You can do this by caching
a data set. That is, the result will be stored in a temporary file which
will be created in the “Caching” directory created by the application.
Another situation in which you may need to cache a data set is when you
need that the input of a module exists when you set its parameters. This
is nor a real requirement, since Monteverdi will generate the needed
data by streaming it, but this can be inefficient. This for instance
about visualization of the result of a complex processing. Using
streaming for browsing through the result image means processing the
visible part every time you move inside the image. Caching the data
before visualization will generate the whole data set in advance
allowing for a more swift display. All modules allow you to cache their
input data sets.

image8 [fig:cachingmodule]

Dynamic GUI definition
~~~~~~~~~~~~~~~~~~~~~~

The aim of **Monteverdi** is to provide a generic interface which is
based on the definition of the internal processes. In this frame, the
way that you have to manage modules are identical during the definition
of a new process. Selecting a module on the upper main window, open
automatically the “Inputs definition Window” wich allows to select data
which are inputs of the current module. **Monteverdi** module can manage
single or multiple inputs and these inputs can be images on your
computer or results of previous module already registered in the “Data
and Process” tree.

Dynamic I/O definition
~~~~~~~~~~~~~~~~~~~~~~

Management of image formats in **Monteverdi** works in the same manner
as in the **Orfeo Toolbox** . The principle is that the software
automatically recognize the image format. Communication between modules
follow also the same principle and the Input definition of modules
request to all available outputs of the same type in the “Data and
process” tree. Internally, all the treatments in **Monteverdi** are
computed in float precision by default. It is also possible to switch to
double precision by compiling the application from source and set the
CMAKE option compile float to ON.

Available modules
-----------------

I/O operations
~~~~~~~~~~~~~~

Extract region of interest
^^^^^^^^^^^^^^^^^^^^^^^^^^

It allows to extract regions of interest (ROI) from an image. There are
two ways to select the region:

-  By indicating the X and Y coordinatres of the upper-left coordinates
   and the X-Y size of the regions.

-  By interactivelly selecting the region of interest in the input
   image.

Concatenate image bands
^^^^^^^^^^^^^^^^^^^^^^^

With **Monteverdi** , you could generate a large scale of value added
informations from lots of inputs data. One of the basic functionnality
is to be able to superpose result’s layers into the same dataset.
Concatenating images into one single multiple-bands image (they need to
have the same size), and to be able to create for example RGB
composition with the inputs layer.

image9 [fig:concatenate]

Save dataset to file
^^^^^^^^^^^^^^^^^^^^

**Monteverdi** allows to export raster or vector dataset to a file to
your system. In the case of raster images, it is possible to cast output
pixel type. In **Monteverdi** all the processes are done in floating
point precision. On large remote sensing dataset, saving your result in
float data type could lead to file too large(more than 25 Go for
pan-sharpened 8 bands WorldView2 with a resolution of :math:`46`
centimeters). Since the module allows to cast pixels in other types :

-  unsigned char (8 bits)

-  short (16 bits)

-  int (32 bits)

-  float (32 bits)

-  double (64 bits)

-  unsigned short (16 bits)

-  unsigned int (32 bits)

image10 [fig:exportdataset]

Geometric process
~~~~~~~~~~~~~~~~~

In the frame of remote sensing process, one common operation is to be
able to superpose and manipulate data which come from different sources.
This section gives access to a large set of geometric operations. It
performs re-projection and orthorectification operations on Optical or
SAR dataset using the available sensor models (image informations
available in the meta-data are automatically read by the application).

Reprojection module
^^^^^^^^^^^^^^^^^^^

The application is derived from the otbOrthorectificationApplication in
the **OTB Applications** package and allow to produce orthorectified
imagery from level 1 product. The application is able to parse metadata
informations and set default parameters. The application contains 4
tabs:

-  Coordinates: Define the center or upper-left pixel coordinates of the
   orthorectified image (the longitude and latitude coordinates are
   calculated through meta-data informations. It is also possible to
   specify the map projection of the output.

-  Output image: The module allows to only orthorectified a Region Of
   interest inside the input dataset. This tab allows to set the size of
   the ROI around the center pixel coordinate or from the upper left
   index. The orthorectified imagery can also be resampled at any
   resolution in the line or column directions by setting the “Spacing
   X” and the “Spacing Y” respectively, and choosing interpolation
   method.

-  DEM: Indicate path to a directory containing SRTM elevation file. The
   application is able to detect inside the direcory which DEM files are
   relevant in the process. You can find detailed informations on how to
   get a usable DEM

-  Image extent: Compare the initial image extension with the preview
   the orthorectified result. This preview is automatically updated if
   the user change the “Size X” or “Size Y” values in the “Output Image”
   tab.

image11 [fig:ortho]

Estimating sensor model based on ground control points
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This module allows to take ground control points on a raster image where
no geographic informations are available. This GCPs list is making
correspondence between pixel coordinate in the input image and physical
coordinates. The list allows to derive a general function which convert
any pixel coordinates in physical positions. This function is based on a
RPC transformation (Rational Polynomial Coefficients). As a consequence,
the module enriches the output image with metadata informations defining
a RPC sensor model associated with the input raster. There are several
ways to generate the GCPs:

-  With Internet access: dynamically generate the correspondance on the
   input image and Open Street Map layers.

-  Without Internet access: Set manually Ground control points :
   indicate index position and cartographic coordinates in the input
   image.

It is also possible to import/export the list of Ground Control points
from/to an XML file.

Moreover, if the input image has GCPs in its metadata, the module allows
to add or remove points from the existing list, which is automatically
loaded.

Calibration
~~~~~~~~~~~

In the solar spectrum, sensors on Earth remote sensing satellites
measure the radiance reflected by the atmosphere-Earth surface system
illuminated by the sun. This signal depends on the surface reflectance,
but it is also perturbed by two atmospheric processes, the gaseous
absorption and the scattering by molecules and aerosols.

Optical calibration
^^^^^^^^^^^^^^^^^^^

In the case of the Optical calibration, the basic idea is to be able to
retrieve reflectance of the observed physical objects. The process can
be split in 3 main steps:

-  Derived luminance from the raw value in the input image.

-  Convert the luminance to reflectance to produce the TOA image(Top Of
   Atmosphere).

-  Inverse a radiative transfer code, which simulates the reflection of
   solar radiation by a coupled atmosphere-surface system. This step
   produce the TOC (Top of Canopy) imagery, which is the final result of
   the optical calibration module.

SAR calibration
^^^^^^^^^^^^^^^

The calibration and validation of the measurement systems are important
to maintain the reliability and reproducibility of the SAR measurements,
but the establishment of correspondence between quantities measured by
SAR and physical measure requires scientific background. The SAR
calibration module allows to estimate quantitative accuracy. For now
only calibration of TerraSARX data is available.

Filtering Operations
~~~~~~~~~~~~~~~~~~~~

Band Math
^^^^^^^^^

The Band Math module allows to perform complex mathematical operations
over images. It is based on the mathematical parser library muParser and
comes with a bunch of build-in functions and operators (listed
`here <http://muparser.sourceforge.net/mup_features.html#idDef2>`_ ).
This home-brewed digital calculator is also bundled with custom
functions allowing to compute a full expression result simply and really
quickly, since the filter supports streaming and multi-threading. The
**Monteverdi** module provides an intuitive way to easily perform
complex band computation. The module also prevents error in the
mathematical command by checking the expression as the user types it,
and notifying information on the detected error:

Figure  [fig:bandmathndviwithres] presents an example on how the band
math can produce a threshold image on the NDVI value computed in one
pass using built-in conditional operator “if” available in the parser.

An other operational example, on how this simple module can produce
reliable information. Figure  [fig:ndwi2] shows the result of the
subtraction of the Water indice on 2 images which was taken before and
during the crisis event. The difference was produced by the band math
module and allows to get a reliable estimation of the flood events.

image12 image13 [fig:bandmathndviwithres]

image14 [fig:ndwi2]

Connected Component Segmentation module
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The Connected Component Segmentation module allows segmentation and
object analysis using user defined criteria at each step. This module
uses `muParser <http://muparser.sourceforge.net/>`_  library using the
the same scheme as it is done in Band math module (see
[Band:sub:`m`\ ath module] for a detailled explanation). It relies on
three main steps process :

Mask definition :
    This mask is used as support of Connected Component segmentation
    (CC) . i.e zeros pixels are not taken into account by CC algorithm.
    Binarization criteria is defined by user, via muparser. This step is
    optional, if no Mask is given, entire image is processed. The
    following example creates a mask using *intensity* (mean of pixel
    values) parameter :

    ::

        intensity > 200

Segmentation :
    Connected Component Segmentation driven by user defined criteria.
    Segmentation process can be followed by a small object rejection
    step. The following example use *distance* (pixel intensity value
    difference ) parameter to define acception/rejection criteria
    between two adjacents pixels :

    ::

        distance < 10

Object analysis post processing :
    This step consists in post processing on each detected area using
    shape and statistical object characterization. The following example
    use *elongation* parameter to test labeled objects :

    ::

        SHAPE_elongation > 2

A detailled presentation of parameters and variables, can be found on
the
`wiki <http://wiki.orfeo-toolbox.org/index.php/Connected_component_segmentation_module>`_ .

Results are then exported in shape file format. Graphical user interface
is presented on Figure
[fig:connected:sub:`c`\ omponent\ :sub:`m`\ odule]. At each step
intemerdiate output can be seen using *Display* item list. Viewing
windows are updated by clicking on *Update* button. Available display
outputs are :

Input image :
    input image.

Mask Output :
    mask image created using formula.

Masked Image :
    input image multiplied by mask image.

Segmentation Output :
    output of Connected Component segmentation filter.

Segmentation after small object rejection :
    output of Connected Component segmentation after relabeling and
    small object rejection.

Filter Output :
    final output after object based analysis opening post processing.

image15 [fig:connected:sub:`c`\ omponent\ :sub:`m`\ odule]

Available variables for each expression can be found using item list
*variables names*. available functions can be found in help windows by
clicking on *Help* button. The module also prevents error in the
mathematical command by checking the expression as the user types it.
Background value is set to green if formula is right, in red otherwise.
If mask expression is left blank entire image is processed. If *Object
Analysis* expression is left blank the whole set of label objects is
considered.

After segmentation step, too small objects can be rejected using *Object
min area* input. Eliminating too small objects at this step is needed to
lighten further computation. min area is the pixel size of the label
object.

When a first pass have been done, Specific label object properties can
be displayed. Select the “Filter Output” visualization mode, Update the
visualization. Then use right click on selected object in image to
display object properties.

Clicking on *Save and Quit* button export output to Monteverdi in vector
data format.

A detailled presentation of this module, and examples can be found on
the
`wiki <http://wiki.orfeo-toolbox.org/index.php/Connected_component_segmentation_module>`_ .

A boat detection example is presented on Figure [fig:boat detection].
Results can be seen on Figure [fig:boat detection result].

image16 [fig:boat detection]

image17 [fig:boat detection result]

Feature extraction
^^^^^^^^^^^^^^^^^^

Under the term Feature Extraction, it include several techniques aiming
to detect or extract infor- mations of low level of abstraction from
images. These features can be objects : points, lines, etc.They can also
be measures : moments, textures, etc.

Mean-shift segmentation
^^^^^^^^^^^^^^^^^^^^^^^

For a given pixel, the Mean-shift algorithm will build a set of
neighboring pixels within a given spatial radius and a color range. The
spatial and color center of this set is then computed and the algorithm
iterates with this new spatial and color center. The Mean-shift can be
used for edge-preserving smoothing, or for clustering.

image18 [fig:meanshift]

Learning
~~~~~~~~

Supervised classification
^^^^^^^^^^^^^^^^^^^^^^^^^

Supervised classification is a procedure in which individual items are
placed into groups based on quantitative information on one or more
characteristics inherent in the items and based on a training set of
previously labeled items.

The supervised classification module is based on the Support Vector
Machine method which consists in searching for the separating surface
between 2 classes by the determination of the subset of training samples
which best describes the boundary between the 2 classes. This method can
be extended to be able to classify more than 2 classes.

The module allows to interactivelly describe learnings samples which
corresponds to polygons samples on the input images.

Then a SVM model is derived from this learning sample which allows to
classify each pixel of the input image in one of the defined class.

Non-supervised classification
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The non supervised classification module is based on the Kmeans
algorithm. The GUI allows to modify parameters of the algorithm and
produce a label image.

Specific SAR functionnalities
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This section give access to specific treatments related to the SAR
(Synthetic Aperture Radar) functionnalities.

Despeckle
^^^^^^^^^

SAR images are generally corrupted by speckle noise. To suppress speckle
and improve the radar image interpretability lots of filtering
techniques have been proposed. The module implements to well-known
despeckle methods: Frost and Lee.

Compute intensity and log-intensity
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compute the derived intensity and log-intensity from the input SAR
imagery.

Polarimetry
^^^^^^^^^^^

In conventional imaging radar the measurement is a scalar which is
proportional to the received backscattered power at a particular
combination of linear polarization (HH, HV, VH or VV). Polarimetry is
the measurement and interpretation of the polarization of this
measurement which allows to measure various optical properties of a
material. In polarimetry the basic measurement is a :math:`2x2` complex
scattering matrix yielding an eight dimensional measurement space
(Sinclair matrix). For reciprocal targets where :math:`HV=VH`, this
space is compressed to five dimensions: three amplitudes (:math:`|HH|`,
:math:`|HV|`, and :math:`|VV|`); and two phase measurements, (co-pol:
HH-VV, and cross-pol: HH-HV). (see
`grss-ieee <http://www.grss-ieee.org/technical-briefs/imaging-radar-polarimetry>`_ ).

Synthesis
'''''''''

Allow to construct an image that would be received from a polarimetric
radar having selected transmit and receive polarizations. The Synthesis
module waits for real and imaginary part (real images) of the HH, VV, VH
and HV images. The reciprocal case where case :math:`VH=HV`, is not
properly handled yet, for now the user has to set the same input for the
two HV and VH.

Conversion
''''''''''

As we saw in the previous main section, the basic measurement is a
:math:`2x2` complex scattering matrix yielding an eight dimensional
measurement space. But other measurements exist:

-  covariance matrix and with its reciprocal specific case

-  coherency matrix and with its reciprocal specific case

-  circular coherency matrix and with its reciprocal specific case

-  Mueller matrix and with its reciprocal specific case...

Modules in the Conversion subsection allow to proceed these conversions
between matrix representations. Allowed conversion and input images
types are described in the following figure  [fig:sarpolconv].

image19 [fig:sarpolconv]

Analysis
''''''''

This module allows to perform some of classical polarimetric analysis
methods. It allows to compute:

-  The polarimetric synthesis:

   -  input: 4 bands complex image

   -  output: mono channel real image

   -  parameters: the synthesis parameters (incident and reflected
      :math:`\psi` and :math:`\chi` angles)

-  The reciprocal H alpha image:

   -  input: 6 bands complex image

   -  output: 3 bands real image

.. image1 ./Art/MonteverdiImages/monteverdi_mainwindow.png
.. image2 ./Art/MonteverdiImages/monteverdi_inputs_window.png
.. image3 ./Art/MonteverdiImages/monteverdi_viewer_pixel_description.png
.. image4 ./Art/MonteverdiImages/monteverdi_viewer_vector_data.png
.. image5 ./Art/MonteverdiImages/monteverdi_viewer_rgb_composition.png
.. image6 ./Art/MonteverdiImages/monteverdi_viewer_histogram.png
.. image7 ./Art/MonteverdiImages/monteverdi_viewer_pixel_description.png
.. image8 ./Art/MonteverdiImages/monteverdi_caching_module.png
.. image9 ./Art/MonteverdiImages/monteverdi_concatenate_before_after.png
.. image10 ./Art/MonteverdiImages/monteverdi_export_dataset.png
.. image11 ./Art/MonteverdiImages/monteverdi_ortho_extent.png
.. image12 ./Art/MonteverdiImages/monteverdi_band_math_ndvi_threshold.png
.. image13 ./Art/MonteverdiImages/monteverdi_band_math_result.png
.. image14 ./Art/MonteverdiImages/monteverdi_NDWI2_substraction.png
.. image15 ./Art/MonteverdiImages/monteverdi_connected_component_segmentation.png
.. image16 ./Art/MonteverdiImages/monteverdi_Capture_Boats.png
.. image17 ./Art/MonteverdiImages/monteverdi_Capture_Boats_CC.png
.. image18 ./Art/MonteverdiImages/monteverdi_mean_shift.png
.. image19 ./Art/MonteverdiImages/monteverdi_sarpol_conversion_schema.png
