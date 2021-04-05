Differential Gene Expression using RNA-Seq (Workflow)
================

### Introduction

RNAseq is becoming the one of the most prominent methods for measuring celluar responses. Not only does RNAseq have the ability to analyze differences in gene expression between samples, but can discover new isoforms and analyze SNP variations. This tutorial will cover the basic workflow for processing and analyzing differential gene expression data and is meant to give a general method for setting up an environment and running alignment tools. Be aware that is not meant to be used for all types of analyses and data-types, and the alignment tools are not for every analysis. Additionally, this tutorial is focused on giving a general sense of the flow when performing these analysis. For larger scale studies, it is highly reccomended to use a HPC environment for increased RAM and computational power.

### Getting Setup

#### A. Installating programs


``` bash
git clone https://github.com/FranciscoAscue/Curso_transcriptomica.git

bash preinstall.sh
```


``` bash
── RNA_Seq/
  │   └── genome/                   <- Host genome file (.FASTA) , Genome annotation file (.GTF/.GFF)
  │  
  │   └── reads/                    <- Location of input RNAseq data
  │  
  │   └── results/                   <- Data generated during processing steps
  │       ├── quality/               <- Main alignment files for each sample
  │           ├──multiQC/            <- Overall report of logs for each step
  │           ├──rawdata/            <- Overall report of logs for each step
  │       ├── trimmed/               <-  Log from running STAR alignment step
  │       ├── sortmerna/             <- STAR alignment counts output (for comparison with featureCounts)
  │           ├── aligned/           <-  Sequences that aligned to rRNA databases (rRNA contaminated)
  │           ├── filtered/          <-  Sequences with rRNA sequences removed  (rRNA-free)
  │           ├── logs/              <- logs from running SortMeRNA
  │       ├── map/                   <- Main alignment files for each sample
  │           ├── aligned_bam/       <-  Alignment files generated from STAR (.BAM)
  │           ├── aligned_logs/      <- Log from running STAR alignment step
  │       ├── counts/                <- Summarized gene counts across all samples
  │  
  │   └── sortmerna_db/              <- Folder to store the rRNA databases for SortMeRNA
  │       ├── rRNA_databases/        <- rRNA sequences from bacteria, archea and eukaryotes
  │  
  │   └── scripts/                   <-  Folder to store the indexed genome files from STAR 
```

## CONTENIDO

- [DESCARGAR SECUENCIAS](#descargar-secuencias)
- [CONTROL DE CALIDAD](#control-de-calidad)
- [FILTRADO DE SECUENCIAS](#filtrado-de-secuencias)
- [FILTRADO DE rRNA](#filtrado-de-rrna)
- [ALINEAMIENTO](#alineamiento)
- [CONTEO DE SECUENCIAS](#conteo-de-secuencias)
- [IMPORTAR A R](#importar-a-r)

## DESCARGAR SECUENCIAS

## CONTROL DE CALIDAD
    
## FILTRADO DE SECUENCIAS

## FILTRADO DE rRNA

## ALINEAMIENTO

## CONTEO DE SECUENCIAS

## IMPORTAR A R

