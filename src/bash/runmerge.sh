#!/bin/bash -l
#SBATCH --job-name=merge
#SBATCH --output=log.txt
#SBATCH --error=error.txt
#SBATCH --partition=core
#SBATCH -n 1
#SBATCH -t 12:00:00
#SBATCH --mem=4GB
#SBATCH -A u2018009
#SBATCH --mail-user=laxmi.mishra@umu.se
#SBATCH --mail-type=ALL

# for a script 
# -e means stop on error
set -e

# a usage function
usage(){
  echo "Synopsis: runmerge.sh <fastq file> <output directory>"
  exit 1
}

if [ $# -ne 1 ]; then
  echo "The script expects one arguments"
  usage
fi

if [ ! -d $1 ]; then
  echo "The one argument needs to be a directory"
  usage
fi



# $() is to execute the command and capture the output
# basename is the function that returns the filename without the file path
# ${//} is a construct to replace (substitute) in ${variable/pattern/replacement}
perl ${SLURM_SUBMIT_DIR:-$(pwd)}/../src/perl/merge_R1R2_for_multiple_fastqs.pl $1 
