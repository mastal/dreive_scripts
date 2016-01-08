#!/usr/bin/perl -w

# Maria Stalteri
# 23/01/2015
# convertPreFilteredToFasta.pl

# Second of three scripts to process
# Cluster output files from Dreive.

#  convert the prefiltered  DREiVe output file,
#  which only has species mm9, hg19, and chicken,
# to fasta format

# 18/02/2015
# run the script as follows:
# $ ./convertPreFilteredToFasta.pl filtered_part2.txt > filtered.fasta

use strict;

my $cluster = "";
while (my $line = <>){

   
    # extract the cluster number
    if ($line =~ /^(Cluster \d+)/) {

        $cluster = $1;

    }
    elsif ($line =~ /^(hg19|mm9|galGal3)/){
       
        # make fasta header
        my $header = ">" . $cluster;

        $line =  $header . " " . $line;     
               
        print $line;
        
        # and also print the next line, which
        # should be the sequence

        $line = <>;
        print $line;

    }

}
