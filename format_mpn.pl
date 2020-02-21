use strict;
use v5.30.0;
use Win32::Clipboard;

my $cb = Win32::Clipboard();

sub format_mpn {
  my $mpn = shift;
  
  $mpn = lc $mpn;
  $mpn =~ s/(\d+)/_$1_/g;
  $mpn =~ s/\A_//;
  $mpn =~ s/_\Z//;
  $mpn =~ s/\A/\\y/;
  $mpn =~ s/\Z/\\y\|/;

  $cb->Set($mpn);
}


while (1)
{
  print("Paste/Enter the merchant code: ");
  my $mpn = <STDIN>;
  chomp($mpn);
  if (lc($mpn) eq "exit")
  {
    exit;
  }

  format_mpn $mpn;

}
