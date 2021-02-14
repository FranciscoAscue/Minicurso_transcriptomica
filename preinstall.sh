#!/bin/bash
### Preinstalaciones para el curso de Transcriptomica
### Francisco Ascue Orosco
### gmail: francisco.ascue131@gmail.com

if [ $UID -ne 0 ]
then
    sudo /bin/sh $0 $* && exit $?
    echo "Ejecutar el script con: sudo bash preinstall.sh"
    exit 1
fi

if [ -x $(command -v apt) ]
then
	sudo apt update
	echo "##############################################################################################"
	echo "#################################instalando prerrequisitos####################################"
	echo "##############################################################################################"
	sudo apt-get install git wget curl
	sudo apt-get install python3 python3-pyqt5.qtsvg python3-pyqt5 python3-pyqt5.qtsvg python3-pip

	if [ -x $(command -v pip3) ]
	then
		sudo -H pip3 install --upgrade pip
		echo "##############################################################################################"
		echo "################################### INSTALANDO JUPYTER #######################################"
		echo "##############################################################################################"
		pip3 install ipykernel
		pip3 install jupyter
	fi

	echo "------------------------------------Instalando Kernel de BASH--------------------------------"
	sudo apt-get install libzmq3-dev libcurl4-openssl-dev libssl-dev jupyter-core jupyter-client
	pip3 install bash_kernel
	python3 -m bash_kernel.install
	echo "-------------------------------Instalando paquetes de compilacion----------------------------"
	sudo apt-get install gcc make-guile ubuntu-make make build-essential libexpat1-dev
fi


### Instalacion de Programas bioinfo

mkdir -P Programas/bin
PGM="$HOME/Curso_trasncriptomica/Programas"
export PATH='${PGM}/bin:$PATH' >> .bashrc

cd $PGM

echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "-----------------------------------------------------------------------------------------------------------------"
echo "------------------------------------Instalacion de programas BIOINFORMATICA ... ---------------------------------"
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
	sudo apt install fastqc cutadapt samtools subread stringtie
	curl -fsSL https://github.com/FelixKrueger/TrimGalore/archive/0.6.6.tar.gz -o trim_galore.tar.gz
	if [ -s "trim_galore.tar.gz" ]
	then
		tar xvzf trim_galore.tar.gz
		ln -s $PWD/TrimGalore-0.6.6/trim_galore $PWD/bin/
	fi
	
	wget https://github.com/biocore/sortmerna/releases/download/v4.2.0/sortmerna-4.2.0-Linux.sh
	if [ -s "sortmerna-4.2.0-Linux.sh" ]
	then
		bash sortmerna-4.2.0-Linux.sh --skip-license
	fi

	wget https://github.com/alexdobin/STAR/archive/2.7.7a.tar.gz
	if [ -s "2.7.7a.tar.gz" ]
	then
		tar -xzf 2.7.7a.tar.gz
		cd STAR-2.7.7a/source/
		make STAR
		cd $PGM
		ln -S $PWD/STAR-2.7.7a.tar.gz $PWD/bin
	fi
	
	#Instalacion

	pip3 install gffutils	
	pip3 install bcbio-gff	
	pip3 install HTseq
	pip3 install multiqc
	sudo apt install ncbi-entrez-direct
fi



