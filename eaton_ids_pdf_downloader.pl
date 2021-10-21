use v5.30.0;
use LWP::Simple;

# Global Variables.
my $read_file_path = 'C:\Users\michaelm\Downloads\eaton_ids.txt';
my $base_storage_path_for_pdfs = 'C:\\Users\\michaelm\\Downloads\\';
my @IDs;
my $download_url = 'https://datasheet.eaton.com/datasheet.php';
my $model = '?model=';
my $parameter = '&locale=de_DE&type=pdf';

# Open the file handles READ to read the Eaton IDs.
open READ, '<', $read_file_path or die "Couldn't open the file: $!\n";


# Main Program

# Store all the IDs from the eaton IDs file.
while (my $id = <READ>)
{
  chomp $id;
  push @IDs, $id;
}

# Download all the PDF files from the eaton website.
foreach my $ID (@IDs)
{
  $download_url = $download_url . $model . $ID . $parameter;
  getstore $download_url, "$base_storage_path_for_pdfs" . "$ID.pdf" or warn "Download Failed!";
  sleep 3;
}

# END of the program.
say "All Downloads are finished.";
