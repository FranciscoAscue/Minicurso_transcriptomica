#!/usr/bin/perl 

# https://metacpan.org/pod/Bio::AlignIO

#usage: bio_alignIO.pl input_file output_file

use Bio::AlignIO;

my $ia = shift;
my $oa = shift;
 
$in  = Bio::AlignIO->new(-file   => $ia ,
                         -format => 'clustalw');
$out = Bio::AlignIO->new(-file   => ">$oa" ,
                         -format => 'fasta');
 
while ( my $aln = $in->next_aln() ) {
    $out->write_aln($aln);
}
