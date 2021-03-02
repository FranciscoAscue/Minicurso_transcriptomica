#!/bin/bash
#####################################################################################################################
#					WORK SPACE AND DOWNLOAD GENOME REFERENCE			    	    #
#						  BY: FRANCISCO ASCUE						    #
#					email: francisco.ascue131@gmail.com					    #
#####################################################################################################################

### Inputs

PJT=$1
GF=$2

### Make tree directory 

echo "started at `date`"

echo "mkdir -p $PJT/{data/{reads,reference},results,scripts/logs}"
mkdir -p $PJT/{data/{reads,reference},results,scripts/logs}

### Download reference genome
echo "esearch -db nucleotide -query "$GF" | efetch -format fasta > ${GF}.fasta"
esearch -db nucleotide -query "$GF" | efetch -format fasta > $PJT/data/reference/${GF}.fasta

echo "finished at `date`"
