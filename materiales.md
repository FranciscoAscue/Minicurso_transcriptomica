[HOME](README.md) - [INFORMACION](README.md#organizador) - [INSTALACIONES](materiales.md) - [INDICE DEL CURSO](Indice.md)


Instalaciones del curso
=====================

## Descargar repositorio

Si desea descargar este repositorio instale previamente `git` (si no lo tiene instalado), clone el repositorio en la direción `$HOME` con el siguiente comando, los manuales del curso estan incluidos en formato `markdown`
```bash
git clone https://github.com/FranciscoAscue/Curso_transcriptomica.git   
```
## Instalar programas

Para la instalación de programas ejecutar los scripts según sea el caso:

>**Ubuntu 20.04 LTS**

>***En caso de contar con WSL (Windonws Subsystem Linux), descargar Ubuntu 20.04 LTS***

```bash
bash preinstall.sh
```

>**Ubuntu 18.04 LTS**

```bash 
bash preinstallUbuntu18.sh
```

>**Virtual Box (Ubuntu)**   

>Si cuenta con una maquina virtual con sistema operativo Linux (Sea Ubuntu 18.04 o 20.04 LTS) puede aplicar los comandos segun su versión. Aunque es recomendable que  instale **Windonws Subsystem Linux**, ya que consume menos memoria RAM.

El script proporcionado en el curso instala por defecto los siguientes paquetes y su respectivos prerrequitos.  

[fastqc](https://github.com/s-andrews/FastQC) [cutadapt](https://github.com/marcelm/cutadapt) [samtools](https://github.com/samtools/samtools) [subread](https://github.com/torkian/subread-1.6.1) [sortmerna](https://bioinfo.lifl.fr/RNA/sortmerna/) [rna-star](https://github.com/alexdobin/STAR) [ncbi-entrez-direct](https://www.ncbi.nlm.nih.gov/books/NBK25501/) [trim-galore](https://github.com/FelixKrueger/TrimGalore) [trimmomatic](https://github.com/timflutre/trimmomatic) [Jupyter](https://github.com/jupyter)


Si cuenta con alguno de estos programas, es recomendable que instale personalmente los programas restantes

## Softwares y paquetes adicionales

### Paquetes de R
```r

install.packages("BiocManager")
library(BiocManager)
BiocManager::install("ggplot2")
BiocManager::install("DEseq2")
BiocManager::install("Vent")
BiocManager::install("EnhancedVolcano")
BiocManager::install("vsn")
BiocManager::install("dplyr")
BiocManager::install("pheatmap")
BiocManager::install("PoiClaClu")
BiocManager::install("genefilter")
BiocManager::install("limma")

```

### software con GUI.

[Blast2GO](https://www.blast2go.com/) (Free Trial)    
[Cytoscape](https://cytoscape.org/)     
[BiNGO](https://www.psb.ugent.be/cbd/papers/BiNGO/Home.html)   
