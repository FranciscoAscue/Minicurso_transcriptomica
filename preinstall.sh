#!/bin/bash
### Preinstalaciones para el curso de Transcriptomica
### Francisco Ascue Orosco
### gmail: francisco.ascue131@gmail.com

normal=$'\e[0m'                           # (works better sometimes)
bold=$(tput bold)                         # make colors bold/bright
red="$bold$(tput setaf 1)"                # bright red text
green=$(tput setaf 2)                     # dim green text
fawn=$(tput setaf 3); beige="$fawn"       # dark yellow text
yellow="$bold$fawn"                       # bright yellow text
darkblue=$(tput setaf 4)                  # dim blue text
blue="$bold$darkblue"                     # bright blue text
purple=$(tput setaf 5); magenta="$purple" # magenta text
pink="$bold$purple"                       # bright magenta text
darkcyan=$(tput setaf 6)                  # dim cyan text
cyan="$bold$darkcyan"                     # bright cyan text
gray=$(tput setaf 7)                      # dim white text
darkgray="$bold"$(tput setaf 0)           # bold black = dark gray text
white="$bold$gray"                        # bright white text

if [ $UID -ne 0 ]
then
    sudo /bin/sh $0 $* && exit $?
    echo "${red}Ejecutar el script con: sudo bash preinstall.sh${normal}"
    exit 1
fi

if [ -x $(command -v apt) ]
then
	sudo apt update
	echo "${purple}##############################################################################################"
	echo "#################################${normal}${blue}INSTALANDO PRERREQUISITOS${normal}${purple}####################################"
	echo "##############################################################################################"
	sudo apt-get install git wget curl
	sudo apt-get install python3 python3-pyqt5.qtsvg python3-pyqt5 python3-pyqt5.qtsvg python3-pip

	if [ -x $(command -v pip3) ]
	then
		sudo -H pip3 install --upgrade pip
		echo "##############################################################################################"
		echo "###################################${normal}${cyan} INSTALANDO JUPYTER ${normal}${purple}#######################################"
		echo "##############################################################################################"
		pip3 install ipykernel
		pip3 install jupyter
	fi

	echo "------------------------------------${yellow}Instalando Kernel de BASH${purple}--------------------------------"
	sudo apt-get install libzmq3-dev libcurl4-openssl-dev libssl-dev jupyter-core jupyter-client
	pip3 install bash_kernel
	python3 -m bash_kernel.install
	echo "-------------------------------${yellow}Instalando paquetes de compilacion${purple}----------------------------"
	sudo apt-get install gcc make-guile ubuntu-make make build-essential libexpat1-dev
fi


### Instalacion de Programas bioinfo

mkdir -P Programas/bin
PGM="$HOME/Curso_trasncriptomica/Programas"
export PATH='${PGM}/bin:$PATH' >> ~/.bashrc

cd $PGM

echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "------------------------------------${cyan}INSTALACION DE PROGRAMAS DE BIOINFORMATICA${purple}-----------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"


if [ -x $(command -v curl) ]
then
	sudo apt install fastqc cutadapt samtools subread stringtie sortmerna rna_star
	curl -fsSL https://github.com/FelixKrueger/TrimGalore/archive/0.6.6.tar.gz -o trim_galore.tar.gz
	if [ -s "trim_galore.tar.gz" ]
	then
		tar xvzf trim_galore.tar.gz
		ln -s $PWD/TrimGalore-0.6.6/trim_galore $PWD/bin/
	fi

	#Instalacion adicional

	pip3 install gffutils	
	pip3 install bcbio-gff	
	pip3 install HTseq
	pip3 install multiqc
	sudo apt install ncbi-entrez-direct
fi

echo "${cyan}"
echo '''  __ _       _     _'''
echo ''' / _(_)     (_)   | |'''
echo '''| |_ _ _ __  _ ___| |_'''
echo '''|  _| |  _ \| / __|  _ \'''
echo '''| | | | | | | \__ \ | | |'''
echo '''|_| |_|_| |_|_|___/_| |_|'''

