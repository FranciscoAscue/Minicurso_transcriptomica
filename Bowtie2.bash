#!/bin/bash

###bowtie2

###CONSTANTS

WD="$HOME/Minicurso_transcriptomica"
REF="${WD}/data/reference/index/indexname"
RES="${WD}/results"
READS="${WD}/data/reads/"
r1="${READS}/fastqfile_1.fq"
r2="${READS}/fastqfile_2.fq"
OD="${RES}/map"

###EXECUTION
echo "started at `date`"

echo "mkdir -p ${OD}"
mkdir -p ${OD}

echo "bowtie -end-to-end -I 0 -X 1000 -p 30 -x ${REF} -1 $r1 -2$r2 -S ${OD}/output.sam"
bowtie -end-to-end -I 0 -X 1000 -p 30 -x ${REF} -1 $r1 -2$r2 -S ${OD}/output.sam
echo "samtools view -u@ 10 ${OD}/output.sam | samtools sort -@ 10 -o ${OD}/output.sorted.bam -"
samtools view -u@ 8 ${OD}/output.sam | samtools sort -@ 40 -o ${OD}/output.sorted.bam -
echo "samtools index ${OD/output.sorted.bam"
samtools index ${OD}/output.sorted.bam

echo "Finished at `date`"


