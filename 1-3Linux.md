
## CONTENIDO

- [BASH PIPELINES](#bash-pipelines)
- [PYTHON SCRIPTS](#python-scripts)
- [R SCRIPTS](#r-scripts)
- [ENTREZ NCBI PERL](#entrez-ncbi-perl)


## BASH PIPELINES
### COMANDO PRÁCTICOS

Los lenguajes de programación tienen un gran cantidad de aplicaciones para bioinformatica, entre ellos linux representa una ventaja por que la terminal con la que nos comunicamos con linux corre un lenguaje de programación (BASH), al igual que otros lenguajes de programación nos permite la automatización de tareas en la cual se integran diversas herramientas. Como estaremos trabajando en el CLI cualquier comando está a un comando de distancia, bash tiene a su disposición el mismo centro de operaciones.
### Eliminar espacios en blanco

    sed '/^$/d' file.txt

    grep . file.txt

    grep "\S" file.txt


### Imprimir lineas entre rangos

    awk 'NR>=20&&NR<=80' input.txt


### Extraer 10 lineas al azar de un documento

    shuf file.txt | head -n 10


### Separar multifasta

    awk '/^>/{s=++d".fa"} {print > s}' multi.fa


### Separar una secuencia especifica de un fasta


    samtools faidx file.fasta

    samtools faidx "ID_seq" file.fasta > ID_seq.fasta

### Conteo de secuencias en FastQ

    fgrep -i "@S" file.fq | wc -l

    cat file.fq | echo $((`wc -l`/4))

### Nombre de los genes anotados 

    grep $'\tgene\t' sequence.gff3 | perl -ne '/ID=([^;]+)/ and printf("%s\n", $1)'

    grep $'\tgene\t' sequence.gff3 | awk '{print $9}' | cut -d';' -f1 | sed "s/ID=//g"

### Mesclando scripts:

    grep $'\tgene\t' sequence.gff3 | awk '{print $5-$4";"$9}'| sed 's/Name=//g' | awk -F';' '{print $3"\t"$1}' | sort -k2n  > Tamaño_genes.txt

```awk '{print $3}' sequence.gff3 | sort -d | uniq -c```

## PYTHON SCRIPTS


    from Bio import Entrez

    Entrez.email = "francisco.ascue@unmsm.edu.pe"
    handle = Entrez.efetch(db="Nucleotide", id="AY994334.1",rettype="fasta",retmode="text")
    print(handle.read())

## R SCRIPTS
    install.package("BiocManager")


## ENTREZ NCBI PERL
    esearch -db $"" -query $"" 



