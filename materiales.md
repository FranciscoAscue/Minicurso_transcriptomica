[HOME](README.md) - [INFORMACION](README.md#organizador) - [INSTALACIONES](materiales.md) - [INDICE DEL CURSO](Indice.md)


Instalaciones del curso
=====================

## Descargar repositorio

Si desea descargar este repositorio instale previamente `git` (si no lo tiene instalado), clone el repositorio en la direción `$HOME` con el siguiente comando, los manuales del curso estan incluidos en formato `markdown`
```bash
git clone https://github.com/FranciscoAscue/Curso_transcriptomica.git   
```
## Instalar programas

Para la instalación de programas ejecutar los sripts según sea el caso:

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

## Softwares y paquetes adicionales

### Paquetes de R
```r

install.package("BiocManager")
library(BiocManager)
BiocManager::install("ggplot2")
BiocManager::install("DEseq2")
BiocManager::install("Vennt")
BiocManager::install("EnhancedVolcano")
BiocManager::install("ggplot2")
BiocManager::install("vsn")
BiocManager::install("dplyr")
BiocManager::install("pheatmap")
BiocManager::install("PoiClaClu")
BiocManager::install("genefilter")
BiocManager::install("limma ")

```

### software con GUI.

[Blast2GO](https://www.blast2go.com/) (Free Trial)    
[Cytoscape](https://cytoscape.org/)     
[BiNGO](https://www.psb.ugent.be/cbd/papers/BiNGO/Home.html)   
