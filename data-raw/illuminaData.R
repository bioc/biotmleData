library(here)
library(SummarizedExperiment)
"%ni%" = Negate("%in%")

load("./illumina2007.rda")

illuminaData <- illumina2007 %>%
  dplyr::select(which(colnames(.) %ni% c("box", "riboaveugml", "ng", "exclude",
                                         "hyb", "totalrnaug", "chip", "Chip.Id",
                                         "Chip.Section", "label.c", "benzene",
                                         "illumID", "berkeley_vial_label",
                                         "cRNA"))) %>%
  dplyr::filter(!duplicated(.$id)) %>%
  dplyr::mutate(
    benzene = I(newbenz),
    smoking = I(current_smoking)
  ) %>%
  dplyr::select(which(colnames(.) %ni% c("newbenz", "current_smoking")))

rownames(illuminaData) <- illuminaData$id

# make SummarizedExperiment
se = SummarizedExperiment(
  t(as.matrix(illuminaData[, -c(1:3, 22181:22182)])),
  colData=illuminaData[, c(2:3, 22181:22182)]
)
illuminaData <- se

save(illuminaData, file = paste0(normalizePath(here("..", "data")),
                                 "/illuminaData.rda"))
