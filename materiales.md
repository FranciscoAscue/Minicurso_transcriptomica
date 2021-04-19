[HOME](README.md) - [MATERIALES](materiales.md) - [INFORMACION](README.md#organizador)


Materiales del curso
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


|INDICE                                            |
|-------------------------------------------------|
|[1. INTRODUCCION A BIOINFORMATICA](1-3Linux.md)  |
||
|[1.1 INTRODUCCION A LINUX](1-3Linux.md#bash-pipelines)   |
|[1.2 INTRODUCCION A PYTHON](1-3Linux.md#python-scripts)   |
|[1.3 INTRODUCCION A R ](1-3Linux.md#r-scripts)   |
|[1.4 ENTREZ NCBI PERL](1-3Linux.md#entrez-ncbi-perl)   |
||
|[2. BASH SCRIPTS PARA NGS](4-6Linux.md)  |
||
|[2.1 BASH PIPELINES](4-6Linux.md#bash-pipelines)  |
|[2.2 BASH SCRIPTS](4-6Linux.md#bash-scripts)  |
|[2.3 SYNTAXIS](4-6Linux.md#syntaxis)  |
|[2.4 ARCHIVOS PARA DATOS NGS](4-6Linux.md#archivos-para-datos-ngs)  |
||
|[3. ANALISIS DE DATOS NGS](NGSLinux.md)  |
||
|[3.1 SIMULACION DE READS](NGSLinux.md#simulacion-de-reads)  |
|[3.2 CONTROL CALIDAD](NGSLinux.md#control-calidad)  |
|[3.3 FILTRADO DE READS](NGSLinux.md#filtrado-de-reads)  |
|[3.4 ENSAMBLAJE](NGSLinux.md#ensamblaje)  |
||
|[4. ANALISIS DE DATOS RNAseq](trancriptomic.md)|   
||
|[4.1 DESCARGAR SECUENCIAS](trancriptomic.md#descargar-secuencias)|
|[4.2 CONTROL DE CALIDAD](trancriptomic.md#control-de-calidad)|
|[4.3 FILTRADO DE SECUENCIAS](trancriptomic.md#filtrado-de-secuencias)|
|[4.4 FILTRADO DE rRNA](trancriptomic.md#filtrado-de-rrna)|
|[4.5 ALINEAMIENTO](trancriptomic.md#alineamiento)|
|[4.6 CONTEO DE SECUENCIAS](trancriptomic.md#conteo-de-secuencias)|
|[4.7 IMPORTAR A R](trancriptomic.md#importar-a-r)|




## Softwares y paquetes adicionales

SortMeRNA: https://bioinfo.lifl.fr/RNA/sortmerna/     
DEseq2: https://bioconductor.org/packages/release/bioc/html/DESeq2.html     
Vennt: https://github.com/drpowell/vennt     
EnhancedVolcano: https://github.com/kevinblighe/EnhancedVolcano     
Blast2GO: https://www.blast2go.com/ (Free Trial)    
Cytoscape: https://cytoscape.org/     
BiNGO: https://www.psb.ugent.be/cbd/papers/BiNGO/Home.html   
