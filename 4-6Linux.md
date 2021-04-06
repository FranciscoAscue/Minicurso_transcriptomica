<p align="center">
    <img src="https://www.umassmed.edu/globalassets/informatics/images/slideshow-home/informatics_home.jpg?format=jpeg&quality=80">
</p>

Pipelines y Scripts para Bioinformática
=======================================

## CONTENIDO

- [BASH PIPELINES](#bash-pipelines)
- [BASH SCRIPTS](#bash-scripts)
- [SYNTAXIS](#syntaxis)
- [SCRIPTS PARA BIOINFORMATICA](#scripts-para-bioinformatica)

## BASH PIPELINES

<p align="center" width="100%">
    <img width="37%" src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Pipeline.svg/1200px-Pipeline.svg.png"> 
    <img width="60%" src="https://thumbs.gfycat.com/LikelyEmbarrassedAnophelesmosquito-size_restricted.gif"> 
</p>

### Conteo de secuencias en FastQ
``` bash
fgrep -i "@S" file.fq | wc -l

cat file.fq | echo $((`wc -l`/4))
```
### Nombre de los genes anotados 
``` bash
grep $'\tgene\t' sequence.gff3 | perl -ne '/ID=([^;]+)/ and printf("%s\n", $1)'

grep $'\tgene\t' sequence.gff3 | awk '{print $9}' | cut -d';' -f1 | sed "s/ID=//g"
```
### Mesclando scripts:

``` bash
grep $'\tgene\t' sequence.gff3 | awk '{print $5-$4";"$9}'| sed 's/Name=//g' | awk -F';' '{print $3"\t"$1}' | sort -k2n  > Tamaño_genes.txt

awk '{print $3}' sequence.gff3 | sort -d | uniq -c
```

## BASH SCRIPTS

## SYNTAXIS
   
## SCRIPTS PARA BIOINFORMATICA
