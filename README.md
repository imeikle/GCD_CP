README
======
This repository contains this README file, the R script developed to perform the analysis and the Codebook.

The script requires the <code>dplyr</code> package to be installed, and for the UCI HAR data to be present in the working directory, unzipped but otherwise in the original directory structure.

The data transformation is described in the Codebook and through comments in the script. Several intermediate outputs are produced, including:

- <code>data</code>: a data frame containing the merged, labelled data from the the test and train sub-directories.
- <code>data_tbl</code>: the previous data frame converted to a dplyr-style data table.
- <code>data_grp</code>: selected columns as mandated by the assignement in a data table ordered by activity and subject.

The final output, <code>data_summ</code>, summarises <code>data_grp</code> by calculating the mean of each measurement.
