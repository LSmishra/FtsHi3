#!/bin/bash

#for submitting batch scripts
#SBATCH --job-name=LaxmiPerl
#SBATCH --mem-per-cpu=48GB
#SBATCH --partition=core
#SBATCH --time=48:00:00
#SBATCH --output=log.txt
#SBATCH --error=error.txt
#SBATCH -A u2018009
#SBATCH -n 1
#SBATCH --mail-user=laxmi.mishra@umu.se
#SBATCH --mail-type=ALL

perl /filepath/merge_R1R2_for_multiple_fastqs.pl /filepathtofolderwithunzippedR1R2files/
