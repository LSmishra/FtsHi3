#!/bin/bash -l
#SBATCH --job-name=itagger
#SBATCH --output=itagger_log.txt
#SBATCH --error=itagger_error.txt
#SBATCH --partition=core
#SBATCH -n 1
#SBATCH -t 2-00:00:00
#SBATCH --mem=32GB
#SBATCH -A u2018009
#SBATCH --mail-user=laxmi.mishra@umu.se
#SBATCH --mail-type=ALL

# for a script 
# -e means stop on error
set -e

# variables
bind="/mnt:/mnt"
image=/mnt/picea/projects/singularity/itagger.simg

# a usage function
usage(){
  echo "Synopsis: runitagger.sh <config file> <lib file> <out directory>"
  exit 1
}

if [ $# -ne 3 ]; then
  echo "The script expects one arguments"
  usage
fi

if [ ! -f $1 ]; then
  echo "The first argument needs to be a file"
  usage
fi

if [ ! -f $2 ]; then
  echo "The second argument needs to be a file"
  usage
fi

if [ ! -d $3 ]; then
  echo "The third argument needs to be a directory"
  usage
fi

# $() is to execute the command and capture the output
# basename is the function that returns the filename without the file path
# ${//} is a construct to replace (substitute) in ${variable/pattern/replacement}
# \ is an escape character the commandline goes on the next line. Make sure that it is the last character on the line
singularity -exec --bind $bind $image itagger.pl \
--config $1 --lib $2 --dir $3
