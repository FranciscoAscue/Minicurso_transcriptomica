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
