use strict;
use warnings;
use Win32::Clipboard;

my $CLIP = Win32::Clipboard();

while (1) {
  print "Artikelnummer: ";
  chomp(my $artikelnummer = <STDIN>);
  print "Artikelnummer alt: $artikelnummer\n";
  $artikelnummer =~ s/[\s\t]+/_/ig;
  $artikelnummer =~ s/^/\|\\y/;
  $artikelnummer =~ s/$/\\y/;
  print "Artikelnummer neu: $artikelnummer\n";
  $CLIP->Set(lc($artikelnummer));
}
