<p align="center" width="100%">
    <img src="https://www.researchgate.net/profile/Victoria-Dominguez-Del-Angel/publication/322946559/figure/fig2/AS:590843312361473@1517879431449/General-steps-in-a-genome-assembly-workflow-Input-and-output-data-are-indicated-for-each.png">
</p>

## CONTENIDO

- [SIMULACION DE READS](#simulacion-de-reads)
- [CONTROL CALIDAD](#control-calidad)
- [FILTRADO DE READS](#filtrado-de-reads)
- [ENSAMBLAJE](#ensamblaje)
- [VALIDACION DE ENSAMBLAJE](#validacion-de-ensamblaje)

## SIMULACION DE READS

```bash
SimRead -- Program to create simulation reads for illumina sequencing in GNU/Linux. 

created by Francisco Ascue (francisco.ascue131@gmail.com)

usage: SimRead -n <project> -g <N.A. NCBI> -r <20000> -f <fastqfile>

where:
    -h                  Show this help text
    -n  <name>          Name of project
    -g  <N.A. NCBI>     N.A. of reference genome
    -r  <number>        Number of reads simulated
    -f  <str>           Name of fastq files
    -s  <number>        set the seed value (default: 42)
    -m  <float>         Rate of mutation of reference genome
    -e  <float>         Rate of error sequencing simulation
    

SimRead -n SARS -g NC_045512.2 -r 6000 -f sars2 -e 0.01

── $SARS/
   │   └── data/                        <- Folder to store reads and references files
   │       ├── reads/                   <- Reads illumina simulated
   │           ├──sars2_1.fastq           <- Forward read
   │           ├──sars2_2.fastq           <- Reverse read
   │           
   │       ├── reference/                <- Host genomes files (.fasta)
   │           ├──NC_045512.2.fasta          <- NCBI download fasta file
   │  
   │   └── results/                     <- Folder to store data generated during processing steps
   │  
   │   └── scripts/                     <- Folder to store scripts for data processing
           ├── logs/                    <- Results logs during processing steps
```

## CONTROL CALIDAD

```bash
fastqc -t 2 cavtsc_forward_paired.fq.gz cavtsc_reverse_paired.fq.gz -o /mnt/disco2/fascue/cporcellus/results/fastqc/
```

## FILTRADO DE READS

<p align="center">
    <img width="75%" src="https://usermanual.wiki/Document/TrimmomaticManualV032.1972804677/asset-6.png">
</p>

```bash
TrimmomaticPE -phred33 -threads 2 file_1.fastq file_2.fastq file_forward_paired.fq.gz file_forward_unpaired.fq.gz file_reverse_paired.fq.gz file_revers_unpaired.fq.gz ILLUMINACLIP:TruSeq3-PE-2.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:50

ILLUMINACLIP:<fastaWithAdaptersEtc>:<seed mismatches>:<palindrome clip threshold>:<simple clip threshold>
LEADING:<quality> 
TRAILING:<quality> 
SLIDINGWINDOW:<windowSize>:<requiredQuality> 
MINLEN:<length>

```

## ALINEAMIENTO

### Preparacion del index 

```bash

#!/bin/bash

###bowtie2-build 

###CONSTANTS

WD="~/Curso_transcriptomica/SARS"
REF="${WD}/data/reference/NC_000.fasta"
IDX="${REF}/index"

###EXECUTION
echo "started at ´date´"

echo "mkdir -p ${IDX}"
mkdir -p ${IDX}

bowtie2-build -threads 2 ${REF} ${IDX}/sars

echo "Finished at ´date´"

```
### Alineamiento de secuencias

```bash
#!/bin/bash

###bowtie2

###CONSTANTS

WD="~/Curso_transcriptomica/SARS"
REF="${WD}/data/reference/NC_000.fasta"
RES="${WD}/results"
READS="${WD}/data/reads/"
r1="${READS}/sars2_1.fq"
r2="${READS}/sars2_2.fq"
OD="${RES}/map"

###EXECUTION
echo "started at `date`"

echo "mkdir -p ${OD}"
mkdir -p ${OD}

bowtie -end-to-end -I 0 -X 1000 -p 30 -x ${REF} -1 $r1 -2$r2 -S ${OD}/cavtsc.sam

samtools view -u@ 8 ${OD}/cavtsc.sam | samtools sort -@ 40 -o ${OD}/cavtsc.sorted.bam -

samtools index ${OD}/cavtsc.sorted.bam

echo "Finished at `date`"
```

## ENSAMBLAJE
```bash
spades.py -1 file_1.fq -2 file_2.fq -s file.single.fq -m 2 -k 31,41,51 -o outputDir
```

## VALIDAD DE ENSAMBLAJE

```bash
quast.py -r refseq.fasta -e -o outputdir fasta_assemblyScaffold.fa
``` 
