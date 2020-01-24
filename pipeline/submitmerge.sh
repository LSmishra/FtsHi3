#!/bin/bash

# be safe
set -e

# variables
in=../data/gunzip
out=../data/merge

# create the output directory if it does not exist
if [ ! -d $out ]; then
  mkdir -p $out
fi

# list the files
for f in $(find $in -name "*.fastq") ; do
  fnam=$(basename ${f/.fastq/})
  sbatch -o $out/$fnam.out -e $out/$fnam.err -J fastq-$fnam ../src/bash/runmerge.sh $f $out
done

# a note on variables
# I can write $fnam.err it will be replaced by the value of $fnam followed by the string ".err"
# I can not write $fnam_err, because it will look for a variable $fnam_err. 
# To actually print $fnam followed by "_err", I need to ${fnam}_err
# . (dot) is a special case, using ${fnam} is safer
# Using ${} is also not needed if the variable is the last element in a concatenation; i.e. gz-$fnam
