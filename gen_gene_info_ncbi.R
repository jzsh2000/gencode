library(tidyverse)

gene_info <- read_rds('gencode.v27/gene_info.rds')
gene_info_ncbi <- read_tsv("ncbi/Homo_sapiens.gene_info.gz") %>%
    select(-1) %>%
    group_by(Symbol) %>%
    slice(1) %>%
    ungroup() %>%
    arrange(GeneID)

gene_info_full <- gene_info %>%
    left_join(gene_info_ncbi, by = c("gene_name" = "Symbol")) %>%
    filter(!is.na(GeneID))

write_rds(gene_info_full, 'gencode.v27/gene_info.ncbi.rds')
