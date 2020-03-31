use strict;
use warnings;

my $run = 1;

while ($run)
{
  print "Matchrule: ";
  my $matchrule = <STDIN>;
  chomp $matchrule;
  if ($matchrule eq 'exit')
  {
    exit;
  }

  my @matchrule_parts = &split_matchrule($matchrule);
  $" = ', ';
  print "MP => @matchrule_parts\n";


}


sub split_matchrule
{
  my $matchrule = shift;
  my @matchrule_parts = split /\|/, $matchrule;

  return @matchrule_parts;
}
