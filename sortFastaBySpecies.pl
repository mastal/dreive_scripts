#!/usr/bin/perl -w

# Maria Stalteri
# 23/01/2014
# sortFastaBySpecies.pl

# third of 3 scripts to process Cluster
# output files from Dreive

# split the Cluster fasta file by species

# run the script as follows:
# $ ./sortFastaBySpecies.pl filtered.fasta human.fasta \
#    mouse.fasta  chicken.fasta


use strict;

# write output to 3 different files, so 
# open filehandles for reading and writing

my $inFile = $ARGV[0];
my $human = $ARGV[1];
my $mouse = $ARGV[2];
my $chicken = $ARGV[3];


open(IN, "< $inFile")
   or die "Unable to open input file $inFile.\n";

open(HG, "> $human")
   or die "Unable to open output file $human.\n";

open(MM, "> $mouse")
   or die "Unable to open output file $mouse.\n";

open(GG, "> $chicken")
   or die "Unable to open output file $chicken.\n";


while (my $line = <IN>){
   
    # match the fasta header line
    if ($line =~ /^>Cluster \d+ (hg19|mm9|galGal3)/) {

        my $species = $1;    

        # sort output by species
        if ($species =~ /hg19/){
      
            print HG $line;
        
            # and also print the next line, which
            # should be the sequence

            $line = <IN>;
            print HG $line;

        }
        elsif ($species =~ /mm9/){

            print MM $line;

            # and also print the next line, which
            # should be the sequence

            $line = <IN>;
            print MM $line;

        }
        elsif ($species =~ /galGal3/){

            print GG $line;

            # and also print the next line, which
            # should be the sequence

            $line = <IN>;
            print GG $line;

        }
    }
}
close(IN);
close(HG);
close(MM);
close(GG);


