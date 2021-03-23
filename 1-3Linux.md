## COMANDO PRÁCTICOS



## CONTENIDO

- [BASH PIPELINES](#bash-pipelines)
- [Basic awk & sed](#basic-awk--sed)
- [awk & sed for bioinformatics](#awk--sed-for-bioinformatics)
- [sort, uniq, cut, etc.](#sort-uniq-cut-etc)
- [find, xargs, and GNU parallel](#find-xargs-and-gnu-parallel)
- [seqtk](#seqtk)
- [GFF3 Annotations](#gff3-annotations)
- [Other generally useful aliases for your .bashrc](#other-generally-useful-aliases-for-your-bashrc)
- [Etc.](#etc)


## BASH PIPELINES

### Eliminar espacios en blanco

    `sed '/^$/d' file.txt`

    `grep . file.txt`

    `grep "\S" file.txt`


## Imprimir lineas entre rangos

### `awk 'NR>=20&&NR<=80' input.txt`


## Extraer 10 lineas al azar de un documento

### `shuf file.txt | head -n 10`


## Separar multifasta

### `awk '/^>/{s=++d".fa"} {print > s}' multi.fa`


## Separar una secuencia especifica de un fasta


### `samtools faidx file.fasta`

### `samtools faidx "ID_seq" file.fasta > ID_seq.fasta`

## Conteo de secuencias en FastQ

### `fgrep -i "@S" file.fq | wc -l`

### ```cat file.fq | echo $((`wc -l`/4))```

## Nombre de los genes anotados 

### `grep $'\tgene\t' sequence.gff3 | perl -ne '/ID=([^;]+)/ and printf("%s\n", $1)'`

### `grep $'\tgene\t' sequence.gff3 | awk '{print $9}' | cut -d';' -f1 | sed "s/ID=//g"`

## Mesclando scripts:

    grep $'\tgene\t' sequence.gff3 | awk '{print $5-$4";"$9}'| sed 's/Name=//g' | awk -F';' '{print $3"\t"$1}' | sort -k2n  > Tamaño_genes.txt

### ```awk '{print $3}' sequence.gff3 | sort -d | uniq -c```



```bash

```


