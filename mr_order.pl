use strict;
use warnings;

use Win32::Clipboard;

my $CLIP = Win32::Clipboard();

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
  # print "MP => @matchrule_parts\n";

  print "Indices: ";
  my $index = <STDIN>;
  chomp $index;

  my @indices = &split_indices($index);
  # print("My indices are: ", join(', ', @indices), "\n");

  my @new_matchrule_order = &order_matchrule(\@matchrule_parts, \@indices);
  print("New matchrule order: ", join('|', @new_matchrule_order), "\n");
  $CLIP->Set(join '|', @new_matchrule_order);


}


sub split_matchrule
{
  my $matchrule = shift;
  my @matchrule_parts = split /\|/, $matchrule;

  return @matchrule_parts;
}

sub split_indices {
  my $index = shift;
  my @indices = split //, $index;
  return @indices;
}

sub order_matchrule
{
  my ($matchrule, $indices) = @_;
  my @new_matchrule_order;
  foreach my $index (@$indices)
  {
    push @new_matchrule_order, $matchrule->[$index];
  }

  return @new_matchrule_order;
}
