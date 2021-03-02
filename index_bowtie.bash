#!/bin/bash

###bowtie2-build 

###CONSTANTS

WD="/mnt/disco2/fascue/Cporecellus"
REF="${WD}/data/reference/------"
IDX="${REF}/index"

###EXECUTION
echo "started at ´date´"
echo "mkdir -p ${OD}"

mkdir -p ${IDX}

echo "bowtie2-build -threads 30 ${REF} ${IDX}/cavpor3"
bowtie2-build -threads 30 ${REF} ${IDX}/cavpor3

echo "Finished at ´date´"
