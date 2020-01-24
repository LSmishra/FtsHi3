#!/bin/bash

#for submitting batch scripts
#SBATCH --job-name=itagger_STRW
#SBATCH --mem-per-cpu=48GB
#SBATCH --time=48:00:00
#SBATCH --output=log.txt
#SBATCH --error=error.txt
#SBATCH --partition=core
#SBATCH --mail-user=laxmi.mishra@umu.se
#SBATCH --mail-type=ALL

source /global/home/users/colemand/.bash_profile 
#this is used if you have specified a specific scratch space for interediate files

module load cutadapt/1.7.1
module load flash/1.2.11
module load fastx_toolkit/0.0.14-intel
module load usearch/v7
module load python/2.7.8
module load java/1.8.0_05

/global/home/users/colemand/ActivePerl-5.18/bin/perl /global/home/users/colemand/jgi_itagger/bin/itagger.pl \
--config /clusterfs/vector/scratch/colemand/itags/VESTA_Strawberry/VESTA_Final/config_16S_template.ini \
--lib /clusterfs/vector/scratch/colemand/itags/VESTA_Strawberry/VESTA_Final/VESTA_Final_itagger_files.txt \
--dir /clusterfs/vector/scratch/colemand/itags/VESTA_Strawberry/VESTA_Final/itagger_output/

#Run itagger using sbatch:
 sbatch itagger_submit_template.sh