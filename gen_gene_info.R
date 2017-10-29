library(tidyverse)
library(stringr)

csv_file = commandArgs(TRUE)[1]
rds_file = str_replace(csv_file, '\\.csv$', '.rds')

write_rds(read_csv(commandArgs(TRUE)[1]), rds_file)
