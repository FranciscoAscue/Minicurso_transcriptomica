#!/bin/bash

###bowtie2-build 


###CONSTANTS
# $Project: project name of SimRead program
# $reference : Download genome reference

WD="$HOME/Minicurso_trasncriptomica/$Project"
REF="${WD}/data/reference/$reference"
IDX="${REF}/index"

###EXECUTION
echo "started at ´date´"
echo "mkdir -p ${OD}"

mkdir -p ${IDX}

echo "bowtie2-build -threads 2 ${REF} ${IDX}/cavpor3"
bowtie2-build -threads 2 ${REF} ${IDX}/cavpor3

echo "Finished at ´date´"
