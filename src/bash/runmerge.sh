#!/bin/bash

#for submitting batch scripts
#SBATCH --job-name=gunzip
#SBATCH --output=log.txt
#SBATCH --error=error.txt
#SBATCH --partition=core
#SBATCH -n 1
#SBATCH -t 12:00:00
#SBATCH --mem=4GB
#SBATCH -A u2018009
#SBATCH --mail-user=laxmi.mishra@umu.se
#SBATCH --mail-type=ALL

gunzip /filepath/*.gz
