#!/bin/bash

# be safe
set -e

# variables
in=../data/merge
out=../data/itagger
cfg=../doc/config_16S_template.ini
lib=$out/lib.txt

# create the output directory if it does not exist
if [ ! -d $out ]; then
  mkdir -p $out
fi

# create the lib file
find $in -type f -name "*.fastq" | \
xargs -I {} bash -c 'echo $(basename ${0/.fastq/}) $(realpath $0)' {} | \
sed -e 's/ /\t/' > $lib

# list the files
sbatch ../src/bash/runitagger.sh $cfg $lib $out

# a note on variables
# I can write $fnam.err it will be replaced by the value of $fnam followed by the string ".err"
# I can not write $fnam_err, because it will look for a variable $fnam_err. 
# To actually print $fnam followed by "_err", I need to ${fnam}_err
# . (dot) is a special case, using ${fnam} is safer
# Using ${} is also not needed if the variable is the last element in a concatenation; i.e. gz-$fnam
#cancel job that you dont need scancel u lmishra##