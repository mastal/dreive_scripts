#!/usr/bin/perl -w

# Maria Stalteri
# 23/01/2015
# preFilterFile.pl

# script one of three to process Cluster
# files from Dreive;

# prefilters DREiVe output file,
# leaving only the species mm9, hg19, and chicken

# 18/02/2015 edited typo in command-line example
# run the script as follows:
# $ ./preFilterFile.pl part2.txt > filtered_part2.txt

use strict;

while (my $line = <>){
    if ($line =~ /^Cluster/) {

        print $line;

    }
    elsif ($line =~ /^(hg19|mm9|galGal3)/){
       
        print $line;
        
        # and also print the next line, which
        # should be the sequence

        $line = <>;
        print $line;

    }

}
