#!/bin/bash

# for a script 
# -e means stop on error
set -e

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

# a usage function
usage(){
  echo "Synopsis: runGunzip.sh <fastq.gz file> <output directory>"
  exit 1
}

if [ $# -ne 2 ]; then
  echo "The script expects two arguments"
  usage
fi

if [ ! -f $1 ]; then
  echo "The first argument needs to be a file"
  usage
fi

if [ ! -d $2 ]; then
  echo "The second argument needs to be a directory"
  usage
fi

# $() is to execute the command and capture the output
# basename is the function that returns the filename without the file path
# ${//} is a construct to replace (substitute) in ${variable/pattern/replacement}
gunzip -c $1 > $2/$(basename ${1/.gz/})

