#!/usr/bin/python3

## pip install --upgrade pip  
## pip install Bio

from Bio import Entrez
from Bio import SeqIO

Entrez.email ="francisco.ascue@unmsm.edu.pe"

info = Entrez.einfo()

data = info.read()

record = Entrez.read(info)


handle = Entrez.efetch(db="nucleotide",id="NC_045512.2",rettype="fasta", retmode="text")

print(handle.read())

