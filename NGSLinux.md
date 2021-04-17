[Pagian anterior <<](4-6Linux.md)  [Menu Curso](README.md#cronograma-de-actividades)  [>>Siguiente Pagina](transcriptomic.md)

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

![](https://www.researchgate.net/publication/334902338/figure/fig1/AS:941106548183066@1601388694174/Graph-representation-with-its-tabular-form-and-HISAT2-indexes-and-alignment-output-a.png)

<p align="center" width="100%">
    <img width="40%" src="https://lh3.googleusercontent.com/proxy/0d_bR1LQIE1jtGz787AbvVg5qch5GUM4qhcKyiY9lpdyFB5uQCNNM2Vh4nzv9M3Csalr8cFAfN2K_2hUcsKRyn0">
    <img width="50%" src="https://i.ytimg.com/vi/6BJbEWyO_N0/maxresdefault.jpg">
    <img width="90%" src="https://gtpb.github.io/ADER18F/pages/images/L05/NGSalignmentworkflow.jpg"
</p>

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

<p align="center" width="100%">
    <img width="60%" src="https://pbs.twimg.com/media/Eht2bwoWoAAW8O5.jpg">
    <img>
    <img>
    <img>
    <img width="70%" src="https://genome.cshlp.org/content/20/9/1165/F2.large.jpg">
    <img width="60%" src="https://www.pnas.org/content/pnas/113/52/E8396/F4.large.jpg">
</p>

```bash
spades.py -1 file_1.fq -2 file_2.fq -s file.single.fq -m 2 -k 31,41,51 -o outputDir
```
```bash
#!/bin/bash

### CONSTANTS
READS="${MNTD3}/data/reads"
RES="${MNTD3}/results/maps"
OD="${RES}/assembly"

WD="~/Curso_transcriptomica/SARS"
REF="${WD}/data/reference/NC_000.fasta"
RES="${WD}/results"
READS="${WD}/data/reads/"
r1="${READS}/sars2_1.fq"
r2="${READS}/sars2_2.fq"
OD="${RES}/map"
### EXECUTION

echo "Started at `date`"

for i in SA42911 SA42912 SA42913 SA42914 SA42976 SA42977 SA42978 SA42979 SA42980 SA42981
       do
               mkdir -p ${OD}/$i/spades
               echo "spades.py -1 ${RES}/${i}map/mito${i}_1.fq -2 ${RES}/${i}map/mito${i}_2.fq -m 4 -t 4 -k 41,51,61 -o ${OD}/${i}/spades"
               spades.py -1 ${RES}/${i}map/mito${i}_1.fq -2 ${RES}/${i}map/mito${i}_2.fq -m 4 -t 4 -k 41,51,61 -o ${OD}/${i}/spades
       done

echo "Finished at `date`"
```

## VALIDACION DE ENSAMBLAJE

```bash
quast.py -r refseq.fasta -e -o outputdir fasta_assemblyScaffold.fa
``` 



[Pagian anterior <<](4-6Linux.md)  [Menu Curso](README.md#cronograma-de-actividades)  [>>Siguiente Pagina](transcriptomic.md)
