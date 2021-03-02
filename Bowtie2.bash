#!/bin/bash

###bowtie2

###CONSTANTS

WD="/mnt/disco2/fascue/Cporecellus"
REF="${WD}/data/reference/index/cavpor3"
RES="${WD}/results"
READS="${WD}/data/reads/------"
r1="${READS}/----_1.fq"
r2="${READS}/----_2.fq"
OD="${RES}/map"

###EXECUTION
echo "started at `date`"

echo "mkdir -p ${OD}"
mkdir -p ${OD}

echo "bowtie -end-to-end -I 0 -X 1000 -p 30 -x ${REF} -1 $r1 -2$r2 -S ${OD}/cavtsc.sam"
bowtie -end-to-end -I 0 -X 1000 -p 30 -x ${REF} -1 $r1 -2$r2 -S ${OD}/cavtsc.sam
echo "samtools view -u@ 10 ${OD}/cavtsc.sam | samtools sort -@ 10 -o ${OD}/cavtsc.sorted.bam -"
samtools view -u@ 8 ${OD}/cavtsc.sam | samtools sort -@ 40 -o ${OD}/cavtsc.sorted.bam -
echo "samtools index ${OD/cavtsc.sorted.bam"
samtools index ${OD}/cavtsc.sorted.bam

echo "Finished at `date`"


