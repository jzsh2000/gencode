#!/usr/bin/env bash
set -ueo pipefail

# input file is somethine like 'gencode.v27.basic.annotation.gtf.gz'
echo -e "seqname,source,start,end,strand,gene_id,gene_type,gene_name"
zcat "$1" \
    | grep -v '^#' \
    | awk 'BEGIN{OFS=","}$3=="gene"{print $1, $2, $4, $5, $7, $10, $12, $14}' \
    | tr -d '";'
