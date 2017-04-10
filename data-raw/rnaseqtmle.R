# generate next-generation sequencing data and evaluate with biomarker TMLE

library(here)
library(dplyr)
library(biotmle)
library(SummarizedExperiment)
"%ni%" = Negate("%in%")

set.seed(6423709)
n <- 50
g <- 2500
cases_pois <- 50
controls_pois <- 10

ngs_cases <- as.data.frame(matrix(replicate(n, rpois(g, cases_pois)), g))
ngs_controls <- as.data.frame(matrix(replicate(n, rpois(g, controls_pois)), g))

ngs_data <- as.data.frame(cbind(ngs_cases, ngs_controls))
exp_var <- c(rep(1, n), rep(0, n))
batch <- rep(1:2, n)
covar <- rep(1, n * 2)
design <- as.data.frame(cbind(exp_var, batch, covar))

se <- SummarizedExperiment(assays = list(counts = DataFrame(ngs_data)),
                           colData = DataFrame(design))

rnaseqTMLEout <- biomarkertmle(se = se,
                               varInt = 1,
                               type = "exposure",
                               ngscounts = TRUE,
                               parallel = TRUE,
                               family = "gaussian",
                               g_lib = c("SL.mean", "SL.glm",
                                         "SL.randomForest"),
                               Q_lib = c("SL.mean", "SL.glm", "SL.randomForest",
                                         "SL.nnet")
                              )

save(rnaseqTMLEout, file = paste0(normalizePath(here("..", "data")),
                                  "/rnaseqtmleOut.rda"))
