#!/bin/bash

# Enviroments



# Execution 
for chr in {1..22} X Y MT
  do
    esearch -db gene -query "Homo sapiens [ORGN] AND $chr [CHR]" |
    efilter -query "alive [PROP] AND genetype protein coding [PROP]" |
    efetch -format docsum |
    xtract -pattern DocumentSummary -NAME Name \
      -block GenomicInfoType -if ChrLoc -equals "$chr" \
        -tab "\n" -element ChrLoc,"&NAME" |
    sort | uniq | cut -f 1 | sort-uniq-count-rank
  done
