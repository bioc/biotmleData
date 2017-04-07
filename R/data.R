#' Sample baseline covariates and Illumina microarray data from a 2007 study
#'
#' A dataset containing various baseline covariates and microarray expression
#' measures from Illumina arrays used in a 2007 study.
#'
#' @format A \code{SummarizedExperiment} containing Illumina microarray data
#'         from the Ref-8 BeadChips platform in the "assay" slot and phenotype
#'         data on subjects in the "colData" slot:
#' \describe{
#'   This is example data to be used in testing the \code{biomarkertmle}
#'   procedure. Consult the vignettes for how to use this data.
#' }
#' @return A \code{SummarizedExperiment} containing biomarkers and baseline
#'         covariates.
#'
"illuminaData"

#' Results obtained from running biomarkertmle on the "illuminaData" sample data
#'
#' Example results obtained from running the TMLE-based estimation procedure on
#' the example data included with this package (\code{illuminaData}).
#'
#' @format A \code{biotmle} object containing the results of running
#'         \code{biomarkertmle}.
#' \describe{
#'   These results are included here for the sake of making the vignettes build
#'   more quickly. The user will likely not benefit from using this data set.
#' }
#' @return A \code{biotmle} object containing results from \code{biomarkertmle}.
#'
"biomarkerTMLEout"
