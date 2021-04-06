<p align="center" width="100%">
    <img src="https://www.researchgate.net/profile/Victoria-Dominguez-Del-Angel/publication/322946559/figure/fig2/AS:590843312361473@1517879431449/General-steps-in-a-genome-assembly-workflow-Input-and-output-data-are-indicated-for-each.png">
</p>

## CONTENIDO

- [SIMULACION DE READS](#simulacion-de-reads)
- [CONTROL CALIDAD](#control-calidad)
- [FILTRADO DE READS](#filtrado-de-reads)
- [ALINEAMIENTO](#alineamiento)
- [ALINEAMIENTO](#)
- [ALINEAMIENTO](#)
- [ALINEAMIENTO](#)
- 
## SIMULACION DE READS

## CONTROL CALIDAD

## FILTRADO DE READS

## ALINEAMIENTO

```bash

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

```

```bash
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
```

## OTROS
