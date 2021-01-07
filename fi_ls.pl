use strict;
use utf8;
use Data::Dumper;
use Tie::IxHash;
use Win32::Clipboard;

my $CLIP = Win32::Clipboard();

sub main
{

  # Eingabe vom Template Leitungschutzschalter
  #print("Template LS:\n");
  #chomp(my $ls = <STDIN>);
  my $ls = "Polanzahl: 4
Bemessungsspannung: keine Angabe
Bemessungsstrom: 63A
Auslösecharakteristik: A, G
Bemessungsschaltvermögen: 3kA
Energiebegrenzungsklasse: keine Angabe
Breite: 72mm
Teilungseinheiten: 4
Besonderheiten: keine Angabe";

  # Unnötige Zeilen entfernen
  $ls =~ s/^Energiebegrenzungsklasse:.+\n//img;
  $ls =~ s/Bemessungsschaltvermögen/Kurzschlussschaltvermögen/ig;
  #print "$ls\n";

  # Umwandeln des Template Strings in ein Hash.
  my @ls_array = split /\n|:/, $ls;
  my %ls_hash = @ls_array;

  tie my %fi_hash, 'Tie::IxHash';

  %fi_hash = (
  Typ => "RCCB",
  Polanzahl => "keine Angabe",
  Bemessungsspannung => "keine Angabe",
  Bemessungsstrom => "keine Angabe",
  Bemessungsfehlerstrom => "keine Angabe",
  Kurzschlussschaltvermögen => "keine Angabe",
  Fehlerstromtyp => "keine Angabe",
  Auslösecharakteristik => "keine Angabe",
  Abschaltzeit => "keine Angabe",
  Schutzart => "IP20",
  Breite => "keine Angabe",
  Teilungseinheiten => "keine Angabe",
  Einbautiefe => "keine Angabe",
  Besonderheiten => "keine Angabe"
  );

# Werte von Template LS an Template Fi übertragen
foreach my $key (keys(%ls_hash))
{
  $fi_hash{$key} = $ls_hash{$key};
}

# Test für Clipboard
my $text = "";

# Template FI ausgeben
while (my ($k, $v) = each(%fi_hash))
{
  print("$k: $v\n");
  $text .= "$k: $v\n";
}

# Polanzahl richtige Schreibweise sicherstellen
$text =~ s/Polanzahl:\s+4/Polanzahl: 3 + N/i;
$text =~ s/Polanzahl:\s+2/Polanzahl: 1 + N/i;

$CLIP->Set($text);

}

# Aufruf Hauptprogramm
main();
