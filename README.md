
[HOME](README.md) - [MANUALES](1-3Linux.md) - [INFORMACION](README.md#organizador)|

<img align="right" width="15%" src="Images/descarga.jpeg">

Análisis del Transcriptoma Usando Linux 
=========

Este repositorio contiene los scripts y archivos que se utilizarán durante el curso. 

## Descargar repositorio
Instale previamente `git` (si no lo tiene instalado), clone el repositorio en la direción `$HOME`
```bash
git clone https://github.com/FranciscoAscue/Curso_transcriptomica.git   
```
### Instalar programas

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

>**Otras versiones de Linux (debian, lubuntu, biolinux, linux Mint, etc.)**

>Si presenta algunas de estas distribuciones puede obtar por instalar los programas que utilizaremos durante el curso o sino ponerse en contacto con los organizadores del curso para que puedan apoyarlo en el proceso```

|                                               |                                               |
|-----------------------------------------------|-----------------------------------------------|
| <img width="100%" src="Images/descarga2.jpg"> | <img width="100%" src="Images/descarga3.jpg"> |
| <img width="100%" src="Images/descarga4.jpg"> | <img width="100%" src="Images/descarga5.jpg"> |

## Numero de participantes

12 Personas

## Requisitos

- Estudiantes de tercer año en adelante o posgrado.
- PC con sistema operativo Linux (Ubuntu u otro con arquitectura debían) o Windows 10 (<a href="https://docs.microsoft.com/en-us/windows/wsl/install-win10">configurar Windows subsystem for Linux</a>). 
- Memoria interna libre: 50 Gb, RAM: min. 4 Gb. Procesador: Core i5 o equivalente.
- Manejo de línea comandos en Linux y conocimientos en R.


## Cronograma de actividades

**Linux para Bionformatica**

| Horario  |  Presentador  |  Actividad | Programas a utilizar |
|:----------:|:-------------:|:-----------:|:---------------------:|
|1:30 pm-2:00 pm |Francisco Ascue|Introducción|-|
|2 pm - 2:30 pm |Francisco Ascue| Entorno Linux (¿ Por qué usar Linux ?), Comandos prácticos|bash, awk <br />  [ver manual](1-3Linux.md)|
|2:30 pm - 3:30 pm|Francisco Ascue|Programas y lenguajes para Bioinformática|biopython, bioconductor, bioperl. <br /> [ver manual](1-3Linux.md)|
|3:30 pm - 4:00 pm|-|Receso|-|
|4:00 pm - 5:00 pm|Francisco Ascue|Pipelines y Scripts para Bioinformática|bash script <br /> [ver manual](4-6Linux.md)|
|5:00 pm - 6:00 pm|Francisco Ascue|Archivos y formatos para datos de NGS|[FastQ](Images/FastQ.jpg),[SAM](Images/SAM.jpg), [GFF3](Images/gff3.jpg), [GTF](Images/gtf.jpg), [VCF](Images/vcf.png) <br /> [ver manual](NGSLinux.md)|
|6:00 pm - 7:30 pm|Francisco Ascue|Procesamiento de datos de NGS|fastqc, trimmomatic, bowtie2, spades <br /> [ver manual](NGSLinux.md)|

**RNA-seq para el Análisis transcriptomico**

| Horario  |  Presentador  |  Actividad | Programas a utilizar |
|:----------:|:-------------:|:-----------:|:---------------------:|
|09:00 am-9:30 am |Carlo Gustavo Mormontoy|Introducción al Transcriptomica.|-|
|9:30 am - 10:00 am |-|Revisión de programas y soporte de instalación|-|
|10:00 am - 12:00 pm|Francisco Ascue|Bloque I: Análisis de secuencias: mapeo, recuento y ensamblaje.|STAR, featureCounts, SortMeRNA, Samtools <br />  [ver manual](transcriptomic.md)|
|12:00 pm - 1:30 pm|-|Almuerzo|-|
|1:30 pm - 3:30 pm|Carlo Gustavo Mormontoy|Bloque II: Normalización y expresión diferencial.|DEseq2, Vennt, EnhancedVolcano|
|3:30 pm - 4:30 pm|Carlo Gustavo Mormontoy|Bloque III: Anotación funcional y enriquecimiento.|Blast2GO, Cytoscape (BiNGO)|
|4:30 pm - 6:00 pm|Francisco Ascue|Bloque IV: Expresión diferencial y miscellaneous.|ggplot, pheatmap, KEGG.db, GO,db|

## CERTIFICACIONES

Para los interesados en obtener el certificado de participación se requerirá su asistencia obligatoria durante todo el minicurso y la calificación mínima de 14/20 en el examen de conclusión del minicurso. Además, los postulantes deben participar activamente durante el minicurso respondiendo las preguntas y expresar sus dudas libremente (usando el chat o audio del zoom, y compartiendo pantalla si es necesario para ayudarle eficientemente durante el minicurso).

## ORGANIZADOR

Hamutay - Young Peruvian Scientists Network for Bioscience Research.

### Apoyo Institucional

Sociedad Peruana de Biología
ISCB RSG of Peru

### Auspiciador
Milrd

## Sofwares y pacquetes

Samtools: https://github.com/samtools/samtools    
featureCounts: https://pubmed.ncbi.nlm.nih.gov/24227677/    
SortMeRNA: https://bioinfo.lifl.fr/RNA/sortmerna/     
STAR: https://github.com/alexdobin/STAR     
DEseq2: https://bioconductor.org/packages/release/bioc/html/DESeq2.html     
Vennt: https://github.com/drpowell/vennt     
EnhancedVolcano: https://github.com/kevinblighe/EnhancedVolcano     
Blast2GO: https://www.blast2go.com/ (Free Trial)    
Cytoscape: https://cytoscape.org/     
BiNGO: https://www.psb.ugent.be/cbd/papers/BiNGO/Home.html   

