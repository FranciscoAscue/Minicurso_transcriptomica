## pip install --upgrade pip  
# pip install cython
# pip install pysam (ubuntu)
# pip install bio

from Bio import Entrez
from Bio import SeqIO

Entrez.email ="francisco.ascue@unmsm.edu.pe"

info = Entrez.einfo()

data = info.read()

record = Entrez.read(info)
data

handle = Entrez.efetch(db="nucleotide",id="NC_045512.2",rettype="fasta", retmode="text")

print(handle.read())

