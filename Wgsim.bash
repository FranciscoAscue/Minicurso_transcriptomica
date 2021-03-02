#!/bin/bash

### Simulacion de reads 

echo "Started at `date`"

wgsim -1151 -2151 -d300 -r0 -e0 -N200000 -R0 -X0 virus.fasta covid19_1.fq covid19_2.fq

# -1151 forward reads 151 pb  
# -2151 reverse reads 151 pb
# -d300 tamaño de la libreria 
# -r0 tasa de mutacion 0
# -e0 tasa de errores de secuenciamiento 0
# -N cuantos reads(lecturas) se generan de cada uno (forward y reverse)
# -R indels fraccion 
# -X probalidad de indels 

echo "Numbers of reads (forward and reverse)"

cat virus2_1.fasta virus2_2.fasta | fgrep "@" | wc -l

echo "Finished at `date`"

