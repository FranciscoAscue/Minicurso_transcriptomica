[Página anterior<<](NGSLinux.md)  [Menu Curso](README.md#cronograma-de-actividades)

Analisis de datos RNA-Seq
================

## Introducción


### Instalacion de programas


``` bash
git clone https://github.com/FranciscoAscue/Curso_transcriptomica.git

#Ubuntu20
bash preinstall.sh

#Ubuntu18

bash preinstall.sh
```
### Directorio de trabajo

``` bash
── RNA_Seq/
  │   └── genome/                    <- genoma de referencia (.FASTA) , anotación de genoma (.GTF/.GFF)
  │  
  │   └── reads/                     <- RNAseq data
  │  
  │   └── results/                   <- Archivos generados
  │       ├── quality/               <- Archivos de calidad
  │           ├──multiQC/            <- calidad conjunta
  │           ├──rawdata/            <- calidad de data cruda
  │       ├── trimmed/               <- Archivos filtrados
  │       ├── sortmerna/             <- Archivos filtrados de rRNA
  │           ├── aligned/           <- Secuencias alineadas a rRNA databases (con contenido de rRNA)
  │           ├── filtered/          <- Secuencias con rRNA removidos  (libre de rRNA)
  │           ├── logs/              <- logs
  │       ├── map/                   <- Alineamientos al genoma de referencia
  │           ├── aligned_bam/       <- Archivos de alineamiento (.BAM)
  │           ├── aligned_logs/      <- logs
  │       ├── counts/                <- Conteo de secuencias finales
  │  
  │   └── sortmerna_db/              <- rRNA databases
  │       ├── rRNA_databases/        <- rRNA (bacteria, archea y eukaryotes)
  │  
  │   └── scripts/                   <- Scripts usados con el curso
```

## REPOSITORIO DE DATOS DE TRANSCRIPTOMA

Los datos utilizados en este curso fueron descargados de [EMBL-EBI](https://www.ebi.ac.uk/), usando la base de datos de [Expression Atlas](https://www.ebi.ac.uk/gxa/home). Para mas detalles del los datos utilizados en este curso puede revisar el siguiente [Link](https://www.omicsdi.org/dataset/atlas-experiments/E-GEOD-46817) o puede visualizar directamente a partir de la base de datos **Expression Atlas** [E-GEOD-46817](https://www.ebi.ac.uk/gxa/experiments/E-GEOD-46817/Results) 


## CONTENIDO

- [DESCARGAR SECUENCIAS](#descargar-secuencias)
- [CONTROL DE CALIDAD](#control-de-calidad)
- [FILTRADO DE SECUENCIAS](#filtrado-de-secuencias)
- [FILTRADO DE rRNA](#filtrado-de-rrna)
- [ALINEAMIENTO](#alineamiento)
- [CONTEO DE SECUENCIAS](#conteo-de-secuencias)
- [IMPORTAR A R](#importar-a-r)

## DESCARGAR SECUENCIAS

### Para descargar desde SRA-db

```bash

### Sra-tool kit

prefetch -O ~/Minicurso_transcriptomica/RNA_seq/reads SRR8495--

# prefetch.2 -a 'ascp|/PATH_to_aspera/.aspera/connect/etc/asperaweb_id_dsa.openssh' -X 100G -O SRR8495-- SRX8495--

fasterq-dump SRR8495--.sra -S -m 1G -O ~/Minicurso_transcriptomica/RNA_seq/reads -e 2

```

### Para descargar datos utilizados en el curso

```bash
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=FILEID' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=FILEID" -O FILENAME && rm -rf /tmp/cookies.txt
```


|SAMPLE| FILEID | FILENAME |   
|:----------:|:-------------:|:-----------:|
|SRR849504| `1p6jTh3JYK3mCmusOj3dj_fRLc2G4v5-s` |	NC_000021.9_1.fq |
|| `1R9R9d9vETQNuOwKOqXUQfkIufmrBXWef` |  NC_000021.9_2.fq |
|SRR849505| `1dGt-SSyze4yuNqtN9MPXGIeBj42I3YFf` |	 NC_000021.9_1.fq |
|| `18eSbO-rEWt9iv22vlPlb8YaisudC8UIq` |  NC_000021.9_2.fq |
|SRR849506|	`1FGk-0jAOMk2msL6buFAnMhYgpXve4Z8t` |  NC_000021.9_1.fq |
|| `18vp7LD-makAdcrpyaoqNOp6D1J6dvtEr` |  NC_000021.9_2.fq |
|SRR849507|	`1WceQz3qDvlFAhBQMt4YJPSCguUYNcaJr` |  NC_000021.9_1.fq |
|| `1CGjXGrTS6iIJ2e_Y2bcvfBI60FenlAB7` |  NC_000021.9_2.fq |
|SRR849508|	`1HZBUwCGjuYFjyHkavdzkh6rQ1W3EFA9l` |  NC_000021.9_1.fq |
|| `1pTT17NMb2UYs1ZRS96a2z8nXyDEz2_tR` |  NC_000021.9_2.fq |
|SRR849509| `1_1s_6A-sRxhcWgIUTMU3PiCgp6gbEC17`	|  NC_000021.9_1.fq |
|| `1ZetrrsOnbHlGLD43RwwJjBSBVP35ABy-` |  NC_000021.9_2.fq |
|SRR849510|	`1XC8kvuDazTsf5_GDLGoE-c4WrRfZyagw` |  NC_000021.9_1.fq |
|| `1Hb9PfckXKXT_pegNF_AOA3SVa4oh6zRA` |  NC_000021.9_2.fq |


## CONTROL DE CALIDAD

```bash

# fastqc

fastqc -t 2 NC_000021.9_1.fq NC_000021.9_2.fq -o ~/Minicurso_transcriptomica/results/quality/multiQC/

#### Output

── results/multiQC/
    └── NC_000021.9_1.html     <- Estadisticas de calidad NC_000021.9_1.fq
    └── NC_000021.9_2.html     <- Estadisticas de calidad NC_000021.9_2.fq
    └── NC_000021.9_1.zip      <- Datos obtenidos por Fastqc
    └── NC_000021.9_2.zip      <- Datos obtenidos por Fastqc 

# multiqc

cd ~/Minicurso_transcriptomica/results/quality/multiQC/

multiqc .

#### Output

── results/multiQC/
    └── multiqc_report.html     <-  Estadisticas de calidad de todos los archivos fastqc (.html) 
    └── multiqc_data/           <-  Datos que multiqc encontró de varios archivos de registro (.zip)
```
    
## FILTRADO DE SECUENCIAS

```bash 

#trim_galore 
    trim_galore \
    --quality 20 \
    --fastqc \
    --length 25 \
    --output_dir results/trimmed/ \
    reads/sample.fastq
```

## FILTRADO DE rRNA

```bash
## sortmerna

    # Save variable of rRNA databases
    # Save the location of all the databases into one folder
    sortmernaREF=sortmerna_db/rRNA_databases/silva-arc-16s-id95.fasta,sortmerna_db/index/silva-arc-16s-id95:\
    sortmerna_db/rRNA_databases/silva-arc-23s-id98.fasta,sortmerna_db/index/silva-arc-23s-id98:\
    sortmerna_db/rRNA_databases/silva-bac-16s-id90.fasta,sortmerna_db/index/silva-bac-16s-id95:\
    sortmerna_db/rRNA_databases/silva-bac-23s-id98.fasta,sortmerna_db/index/silva-bac-23s-id98:\
    sortmerna_db/rRNA_databases/silva-euk-18s-id95.fasta,sortmerna_db/index/silva-euk-18s-id95:\
    sortmerna_db/rRNA_databases/silva-euk-28s-id98.fasta,sortmerna_db/index/silva-euk-28s-id98

    # Run SortMeRNA (~15min)
    sortmerna \
    --ref $sortmernaREF \
    --reads results/2_trimmed_output/sample_trimmed.fq \
    --aligned results/3_rRNA/aligned/sample_aligned.fq \
    --other results/3_rRNA/filtered/sample_filtered.fq \
    --fastx \
    --log \
    -a 4 \
    -v

    # Move logs into the correct folder
    mv -v results/3_rRNA/aligned//sample_aligned.log results/3_rRNA/logs

```


## ALINEAMIENTO

# This can take up to 30 minutes to complete
    STAR \
    --runMode genomeGenerate \
    --genomeDir genome/star_index \
    --genomeFastaFiles genome/*.fna \
    --sjdbGTFfile annotation/*.gtf \
    --runThreadN 4

#### Command

    # Help
    STAR -h

    # Run STAR (~10min)
    STAR \
    --genomeDir genome/star_index \
    --readFilesIn results/trimmed/sample_filtered.fq  \
    --runThreadN 4 \
    --outSAMtype BAM SortedByCoordinate \
    --quantMode GeneCounts

    # Move the BAM file into the correct folder
    mv -v results/4_aligned_sequences/sampleAligned.sortedByCoord.out.bam results/4_aligned_sequences/aligned_bam/

    # Move the logs into the correct folder
    mv -v results/4_aligned_sequences/${BN}Log.final.out results/4_aligned_sequences/aligned_logs/
    mv -v results/4_aligned_sequences/sample*Log.out results/4_aligned_sequences/aligned_logs/

#### Output

``` bash
── results/4_aligned_sequences/
    └── aligned_bam/sampleAligned.sortedByCoord.out.bam   <- Sorted BAM alignment fole
    └── aligned_logs/sampleLog.final.out                  <- Log of STAR alignment rate
    └── aligned_logs/sampleLog.out                        <- Log of steps take during STAR alignment
```

## CONTEO DE SECUENCIAS

 # Help
    featureCounts -h

    # Change directory into the aligned .BAM folder
    cd results/4_aligned_sequences/aligned_bam

    # Store list of files as a variable
    dirlist=$(ls -t ./*.bam | tr '\n' ' ')
    echo $dirlist

    # Run featureCounts on all of the samples (~10 minutes)
    featureCounts \
    -a ../../annotation/* \
    -o ../../results/5_final_counts/final_counts.txt \
    -g 'gene_name' \
    -T 4 \
    $dirlist

    # Change directory back to main folder
    cd ../../../

#### Output

``` bash
── results/5_final_counts/
    └── final_counts.txt                <- Final gene counts across all samples
    └── final_counts.txt.summary        <- Summary of gene summarization 


    htseq-count -s no -r pos -t exon -f bam  <BAMFILE> <GTF> > <SALIDA>
    
```


## IMPORTAR A R

``` r
source("https://bioconductor.org/biocLite.R")
biocLite("DESeq2") ; library(DESeq2)
biocLite("ggplot2") ; library(ggplot2)
biocLite("clusterProfiler") ; library(clusterProfiler)
biocLite("biomaRt") ; library(biomaRt)
biocLite("ReactomePA") ; library(ReactomePA)
biocLite("DOSE") ; library(DOSE)
biocLite("KEGG.db") ; library(KEGG.db)
biocLite("org.Mm.eg.db") ; library(org.Mm.eg.db)
biocLite("org.Hs.eg.db") ; library(org.Hs.eg.db)
biocLite("pheatmap") ; library(pheatmap)
biocLite("genefilter") ; library(genefilter)
biocLite("RColorBrewer") ; library(RColorBrewer)
biocLite("GO.db") ; library(GO.db)
biocLite("topGO") ; library(topGO)
biocLite("dplyr") ; library(dplyr)
biocLite("gage") ; library(gage)
biocLite("ggsci") ; library(ggsci)
```


``` r
# Import gene counts table
# - skip first row (general command info)
# - make row names the gene identifiers
countdata <- read.table("example/final_counts.txt", header = TRUE, skip = 1, row.names = 1)

# Remove .bam + '..' from column identifiers
colnames(countdata) <- gsub(".bam", "", colnames(countdata), fixed = T)
colnames(countdata) <- gsub(".bam", "", colnames(countdata), fixed = T)
colnames(countdata) <- gsub("..", "", colnames(countdata), fixed = T)

# Remove length/char columns
countdata <- countdata[ ,c(-1:-5)]

# Make sure ID's are correct
head(countdata)
```

    ##               SRR1374924 SRR1374923 SRR1374921 SRR1374922
    ## 4933401J01Rik          0          0          0          0
    ## Gm26206                0          0          0          0
    ## Xkr4                 214        302        459        425
    ## Gm18956                0          0          0          0
    ## Gm37180                4          2          3          1
    ## Gm37363                1          0          0          1

##### 7c. Import metadata text file. The SampleID's must be the first column.

``` r
# Import metadata file
# - make row names the matching sampleID's from the countdata
metadata <- read.delim("example/metadata.txt", row.names = 1)

# Add sampleID's to the mapping file
metadata$sampleid <- row.names(metadata)

# Reorder sampleID's to match featureCounts column order. 
metadata <- metadata[match(colnames(countdata), metadata$sampleid), ]

# Make sure ID's are correct
head(metadata)
```

    ##            Group Replicate   sampleid
    ## SRR1374924 HiGlu      Rep2 SRR1374924
    ## SRR1374923 HiGlu      Rep1 SRR1374923
    ## SRR1374921 LoGlu      Rep1 SRR1374921
    ## SRR1374922 LoGlu      Rep2 SRR1374922

##### 7d. Make DESeq2 object from counts and metadata

``` r
# - countData : count dataframe
# - colData : sample metadata in the dataframe with row names as sampleID's
# - design : The design of the comparisons to use. 
#            Use (~) before the name of the column variable to compare
ddsMat <- DESeqDataSetFromMatrix(countData = countdata,
                                 colData = metadata,
                                 design = ~Group)


# Find differential expressed genes
ddsMat <- DESeq(ddsMat)
```

    ## estimating size factors

    ## estimating dispersions

    ## gene-wise dispersion estimates

    ## mean-dispersion relationship

    ## final dispersion estimates

    ## fitting model and testing

##### 7e. Get basic statisics about the number of significant genes

``` r
# Get results from testing with FDR adjust pvalues
results <- results(ddsMat, pAdjustMethod = "fdr", alpha = 0.05)

# Generate summary of testing. 
summary(results)
```

    ## 
    ## out of 10448 with nonzero total read count
    ## adjusted p-value < 0.05
    ## LFC > 0 (up)     : 996, 9.5% 
    ## LFC < 0 (down)   : 767, 7.3% 
    ## outliers [1]     : 0, 0% 
    ## low counts [2]   : 4709, 45% 
    ## (mean count < 7)
    ## [1] see 'cooksCutoff' argument of ?results
    ## [2] see 'independentFiltering' argument of ?results

``` r
# Check directionality of the log2 fold changes
## Log2 fold change is set as (LoGlu / HiGlu)
## Postive fold changes = Increased in LoGlu
## Negative fold changes = Decreased in LoGlu
mcols(results, use.names = T)
```

    ## DataFrame with 6 rows and 2 columns
    ##                        type                                  description
    ##                 <character>                                  <character>
    ## baseMean       intermediate    mean of normalized counts for all samples
    ## log2FoldChange      results log2 fold change (MAP): Group LoGlu vs HiGlu
    ## lfcSE               results         standard error: Group LoGlu vs HiGlu
    ## stat                results         Wald statistic: Group LoGlu vs HiGlu
    ## pvalue              results      Wald test p-value: Group LoGlu vs HiGlu
    ## padj                results                        fdr adjusted p-



[Pagian anterior <<](NGSLinux.md)  [Menu Curso](README.md#cronograma-de-actividades)
