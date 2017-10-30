IRMAS: A DATASET FOR INSTRUMENT RECOGNITION IN MUSICAL AUDIO SIGNALS
====================================================

Description

This dataset includes musical audio excerpts with annotations of the predominant instrument(s) present. It was used for the evaluation in the following article:

Bosch, J. J., Janer, J., Fuhrmann, F., & Herrera, P. “A Comparison of Sound Segregation Techniques for Predominant Instrument Recognition in Musical Audio Signals”, in Proc. ISMIR (pp. 559-564), 2012

IRMAS is intended to be used for training and testing methods for the automatic recognition of predominant instruments in musical audio. The instruments considered are: cello, clarinet, flute, acoustic guitar, electric guitar, organ, piano, saxophone, trumpet, violin, and human singing voice. This dataset is derived from the one compiled by Ferdinand Fuhrmann in his PhD thesis (http://www.dtic.upf.edu/~ffuhrmann/PhD/), with the difference that we provide audio data in stereo format, the annotations in the testing dataset are limited to specific pitched instruments, and there is a different amount and lenght of excerpts.

Files included
-----------------------
The dataset is divided into training and testing data

Training data
------------------------------------------
Audio files: 6705 audio files in 16 bit stereo wav format sampled at 44.1kHz. They are excerpts of 3 seconds from more than 2000 distinct recordings. 

Annotations: The annotation of the predominant instrument of each excerpt is both in the name of the containing folder, and in the file name: cello (cel), clarinet (cla), flute (flu), acoustic guitar (gac), electric guitar (gel), organ (org), piano (pia), saxophone (sax), trumpet (tru), violin (vio), and human singing voice (voi). The number of files per instrument are: cel(388), cla(505), flu(451), gac(637), gel(760), org(682), pia(721), sax(626), tru(577), vio(580), voi(778). 

Additionally, some of the files have annotations in the filename regarding the presence ([dru]) or non presence([nod]) of drums, and the musical genre: country-folk ([cou_fol]), classical ([cla]), pop-rock ([pop-roc]), latin-soul ([lat-sou]).

These data include music from the actual and various decades from the past century, thus differing in audio quality to a great extent. It further covers a great variability in the musical instrument types, performers, articulations, as well as general recording and production styles. In addition, we tried to maximize the distribution spread of musical genres inside the collection to prevent the extraction of information related to genre characteristics. Two students were paid to obtain the data for 11 pitched instruments from the pre-selected music tracks, with the objective of extracting excerpts containing a continuous presence of a single predominant target instrument. Hence, assigning more than one instrument to a given excerpt was not allowed.

Testing data
---------------------

Audio: 2874 excerpts  in 16 bit stereo wav format sampled at 44.1kHz.

Annotation files:

The annotations for an excerpt named: “excerptName.wav” are given in “excerptName.txt”. More than one instrument may be annotated in each excerpt, one label per line.

This part of the dataset contains excerpts from a diversity of western musical genres, with varied instrumentations, and it is derived from the original testing dataset from Fuhrmann (http://www.dtic.upf.edu/~ffuhrmann/PhD//). No tracks from the training data were included in the dataset. Two subjects were paid for annotating half of the collection. After completion, the data was swapped among the subjects in order to double-check the annotation. Moreover the generated annotations were reviewed by a third person to guarantee maximum possible correctness of the data. 10 initially selected pieces were discarded after this process because they were too difficult to get enough agreement.

To build the IRMAS dataset, we divided each file from the original dataset into excerpts, which have the following properties: 1) the annotated instruments are the same in the whole excerpt, 2) the length is between 5 and 20 seconds, and 3) the excerpts are stereo. The first property allows us to disregard segmentation according to the instrumentation into the recognition evaluation, since the presence of instruments typically changes amongst or even within sections of a music piece. The second property ensures that the instrument labeling process has enough information to output the labels with a certain confidence. The third property corresponds to the use case of interest: professionally produced music recordings, in stereo format. Compared to the original dataset, we include only the annotations of the considered pitched instruments:  cello (cel), clarinet (cla), flute (flu), acoustic guitar (gac), electric guitar (gel), organ (org), piano (pia), saxophone (sax), trumpet (tru), violin (vio), and human singing voice (voi). Other instruments such as bass, percussion or sections such as brass or strings are thus not included in the annotations.

Conditions of Use
-----------------
The IRMAS dataset is offered free of charge for non-commercial use only.  You can not redistribute it nor modify it. 
Dataset by Juan J. Bosch, Ferdinand Fuhrmann, Perfecto Herrera, Music Technology Group - Universitat Pompeu Fabra (Barcelona)
This work is licensed under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License

Please Acknowledge IRMAS in Academic Research
---------------------------------------------------
When IRMAS is used for academic research, we would highly appreciate if scientific publications of works partly based on the IRMAS dataset quote the following publication:

Bosch, J. J., Janer, J., Fuhrmann, F., & Herrera, P. “A Comparison of Sound Segregation Techniques for Predominant Instrument Recognition in Musical Audio Signals”, in Proc. ISMIR (pp. 559-564), 2012

The creation of this dataset was partially supported by “La Caixa” Fellowship Program, and the following projects: Classical Planet: TSI-070100-2009-407 (MITYC), DRIMS: TIN2009-14247-C02-01 (MICINN) and MIRES: EC-FP7 ICT-2011.1.5 Networked Media and Search Systems, grant agreement No. 287711. Additionally supported by TECNIO network promoted by ACC1Ó agency by the Catalan Government.

Feedback
------------------------
Problems, positive feedback, negative feedback, help to improve the annotations... it is all welcome! Send your feedback to: juan.bosch@upf.edu AND mtg@upf.edu
In case of a problem report please include as many details as possible.