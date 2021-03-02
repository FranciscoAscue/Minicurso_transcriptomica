#!/bin/bash

## ENVIROMENTS

wd="/home/fascue/data"
query="$1"
reads="$2"

## EXECUTION

echo "started at `date`"

echo "esearch -db Nucleotide -query ""${query}"" | efetch -format fasta > "${query}".fasta"

esearch -db Nucleotide -query ""${query}"" | efetch -format fasta > "${query}".fasta

echo "wgsim -1151 -2151 -d300 -r0 -e0 -N"${reads}" -R0 -X0 "${query}".fasta virus2_1.fasta virus2_2.fasta"

wgsim -1151 -2151 -d300 -r0 -e0 -N"${reads}" -R0 -X0 "${query}".fasta virus2_1.fasta virus2_2.fasta

echo "Numbers of reads (forward and reverse)"

cat virus2_1.fasta virus2_2.fasta | fgrep "@" | wc -l

echo "Finished at `date`"

