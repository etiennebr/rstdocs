Color Mapping
^^^^^^^^^^^^^

Maps an input label image to 8-bits RGB using look-up tables.

Detailed description
--------------------

This application allows to map a label image to a 8-bits RGB image (in both ways) using different methods.\\  -The custom method allows to use a custom look-up table. The look-up table is loaded from a text file where each line describes an entry. The typical use of this method is to colorise a classification map.\\  -The continuous method allows to map a range of values in a scalar input image to a colored image using continuous look-up table, in order to enhance image interpretation. Several look-up tables can been chosen with different color ranges.\\ -The optimal method computes an optimal look-up table. When processing a segmentation label image (label to color), the color difference between adjacent segmented regions is maximized. When processing an unknown color image (color to label), all the present colors are mapped to a continuous label list.\\  - The support image method uses a color support image to associate an average color to each region.

Parameters
----------

This section describes in details the parameters available for this application. Table~\ref{ColorMapping_param_table}, page~\pageref{ColorMapping_param_table} presents a summary of these parameters and the parameters keys to be used in command-line and programming languages. Application key is \verb+ColorMapping+.

Parameters table for Color Mapping:

+===========================+============================+====================================+
|       Parameter Key       |       Parameter Type       |       Parameter Description        |
+===========================+============================+====================================+
|            in             |        Input image         |            Input image             |
+---------------------------+----------------------------+------------------------------------+
|            out            |        Output image        |            Output image            |
+---------------------------+----------------------------+------------------------------------+
|            ram            |            Int             |                Int                 |
+---------------------------+----------------------------+------------------------------------+
|            op             |          Choices           |              Choices               |
+---------------------------+----------------------------+------------------------------------+
| op.colortolabel.notfound  |            Int             |                Int                 |
+---------------------------+----------------------------+------------------------------------+
|          method           |          Choices           |              Choices               |
+---------------------------+----------------------------+------------------------------------+
|     method.custom.lut     |      Input File name       |          Input File name           |
+---------------------------+----------------------------+------------------------------------+
|   method.continuous.lut   |          Choices           |              Choices               |
+---------------------------+----------------------------+------------------------------------+
|   method.continuous.min   |           Float            |               Float                |
+---------------------------+----------------------------+------------------------------------+
|   method.continuous.max   |           Float            |               Float                |
+---------------------------+----------------------------+------------------------------------+
| method.optimal.background |            Int             |                Int                 |
+---------------------------+----------------------------+------------------------------------+
|      method.image.in      |        Input image         |            Input image             |
+---------------------------+----------------------------+------------------------------------+
| method.image.nodatavalue  |           Float            |               Float                |
+---------------------------+----------------------------+------------------------------------+
|     method.image.low      |            Int             |                Int                 |
+---------------------------+----------------------------+------------------------------------+
|      method.image.up      |            Int             |                Int                 |
+---------------------------+----------------------------+------------------------------------+
|           inxml           | XML input parameters file  |     XML input parameters file      |
+---------------------------+----------------------------+------------------------------------+
|          outxml           | XML output parameters file |     XML output parameters file     |
+---------------------------+----------------------------+------------------------------------+
