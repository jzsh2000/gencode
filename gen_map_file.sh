#!/usr/bin/env bash
set -ueo pipefail

# input file is somethine like 'gencode.v27.transcripts.fa.gz'
zcat "$1" \
    | bioawk -c fastx '{print $name}' \
    | cut -d'|' -f1,6 \
    | tr '|' '\t'
