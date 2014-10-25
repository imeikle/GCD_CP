README
======
This repository contains this README file, the R script developed to perform the analysis and the Codebook.

The script requires the <code>dplyr</code> package to be installed, and for the UCI HAR data to be present in the working directory, unzipped but otherwise in the original directory structure.

Raw data
--------
- Two data sets, <code>test</code> and <code>train</code>, contained in directories of the same name.
  - Each includes a list of subject ids, a list of activities performed by those subjects (stored as integers) and a table of measurements derived from raw data. The raw data is also included in these directories, but was not considered in this analysis as it had already been processed.
  
- Labels for the derived measurements and for the activities.

Transformation
--------------
The two data sets were combined. First, the respective tables of measurements were combined vertically, as were the lists of activities and the lists of subject ids. The activity labels were used to convert the activities to factors. The column headings of the measurements were then labelled, with parentheses and whitespace removed and commas converted to dashes. The three data frames produced were then combined horizontally to produce a single, tidy data frame.

This data frame was converted to a <code>dplyr</code> data table and reduced by removing those columns that did not report the mean or standard deviation of measurements in the time and frequency domain. A typographic error that had duplicated the word 'Body' in several names was corrected.

Several intermediate outputs were produced during transformation, including:

- <code>data</code>: a data frame containing the merged, labelled data from the the test and train sub-directories.
- <code>data_tbl</code>: the previous data frame converted to a dplyr-style data table.
- <code>data_grp</code>: selected columns as mandated by the assignement in a data table ordered by activity and subject.

The final output, <code>data_summ</code>, summarises <code>data_grp</code> by calculating the mean of each measurement.
