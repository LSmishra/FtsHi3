##was written by Ling Xu, Jan. 2016
use warnings;
use strict;


my ($path) = @ARGV;
die "Don't have enough arguments\n" if @ARGV != 1;

opendir D1, "$path" or die $!;
my @array=grep(!/\.\.?$/, readdir D1);

my @array_S= sort(@array);
my $n=@array_S;

for(my $i=0;$i<$n/2;$i++){

   my $R1 = shift(@array_S);
   my $R2 = shift(@array_S);
   my $s=rindex($R1,'R1');
   my $merged=(substr($R1,0,$s)).".fastq";
   #for UCB specific filenames, replaces the Sample and Lane strings in the name
   #eg. Blank6_S108_L001.fastq becomes Blank_6.fastq
   $merged =~ s/(.*)_S\d+_L\d+_(\.fastq)/$1$2/;

open my $FILEA, "<".$path."/$R1" || die "cannot open the file at $!";
open my $FILEB, "<".$path."/$R2" || die "cannot open the file at $!";
open my $OUTFILE, ">".$path."/$merged" || die "cannot open the file at $!";

while(<$FILEA>) { # The last line should not has character, such as line break.
    chomp;
    print $OUTFILE "$_\n";
    chomp(my $a=<$FILEA>);
    print $OUTFILE "$a\n"; 
    chomp(my $b=<$FILEA>);
    print $OUTFILE "$b\n"; 
    chomp(my $c=<$FILEA>);
    print $OUTFILE "$c\n";  

    chomp(my $d=<$FILEB>);
    print $OUTFILE "$d\n"; 
    chomp(my $e=<$FILEB>);
    print $OUTFILE "$e\n";
    chomp(my $f=<$FILEB>);
    print $OUTFILE "$f\n";
    chomp(my $g=<$FILEB>);
    print $OUTFILE "$g\n";
}

close $FILEA;
close $FILEB;
close $OUTFILE;}