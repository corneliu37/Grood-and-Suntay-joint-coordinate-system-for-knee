# Grood-and-Suntay-joint-coordinate-system-for-knee
Grood and Suntay joint coordinate system for description of knee kinematics 



This software implements the Grood and Suntay joint coordinate system for the clinical description of the three-dimensional motion of the knee.  The Grood and Suntay joint coordinate system is described in the research paper : 

Grood E.S., Suntay W.J., “A joint coordinate system for the clinical description of three-dimensional motions: application to the knee”, J Biomech Eng., 1983 May; 105(2),  1983. 

The software was used in producing the numerical results shown in various research papers such as :

Arsene, CT, Gabrys, B., “Probabilistic finite element predictions of the human lower limb model in the total knee replacement”, Med Eng Phys, Aug; 35(8): 1116-32, 2013.

Description of the Matlab files:

Uncerpasl.m – starts the process of calculating the knee joint coordinate system; 

Anglesn.m – calculates the angles and the displacements of interest for the tibio-femoral component 

Anglespf.m – calculates the angles and the displacements of interest for the patello-femoral component 

Readinput.m – reads the text files containing the raw data obtained from the Finie Element simulations such as : 

a)	femur_COG_I_X - means the X coordinate of the I point which defines   a coordinate system together with points J and K with respect to the  center of gravity (COG) of the femoral component. 
   
b)	femur_COG_X - means the X coordinate of the center of gravity (COG) of the femoral component which together with points I, J , K forms a sort of local coordinate system attached to the femoral component.

All the text files such as femur_COG_I_X_1.txt, femur_COG_I_Y_1.txt, etc were produced with the finite element software PAM-CRASH/PAMOPT from the company ESI, Paris, France (https://www.esi-group.com).  The text files contain a single result consisting of 0.12 seconds of the passive flexion cycle and therefore are of no real use but only to verify that the Grood and Suntay Matlab software code works.  

Please acknowledge the project financed by the European Union Framework Programme 6 (FP6) entitled Decision Support Software for Orthopaedic Surgery  and Mr Corneliu T.C. Arsene if you are going to use this software anywhere in your work. The license for this software is a Creative Commons Attribution 4.0 International License (CCL).  This project has also a DOI :  https://doi.org/10.6084/m9.figshare.7441469.v2

It is provided here with no warranty. Direct all questions and requests to galenpalimpsestproject@gmail.com.
