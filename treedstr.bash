#!/bin/bash
#####################################################################################################################
#					WORK SPACE AND DOWNLOAD GENOME REFERENCE			    	    #
#						  BY: FRANCISCO ASCUE						    #
#					email: francisco.ascue131@gmail.com					    #
#####################################################################################################################

if [ $? != 0 ] ; then echo "Terminating..." >&2 ; exit 1 ; fi

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

