use v5.30.0;
use LWP::Simple;
use IO::Handle;

# Shows the output every second in the loop when using sleep.
STDOUT->autoflush(1);

# Global Variables.
my $read_file_path = 'C:\Users\Geizhals\Downloads\eaton_ids.txt';
my $base_storage_path_for_pdfs = 'C:\\Users\\Geizhals\\Downloads\\';
my @IDs;
my $download_url = 'https://datasheet.eaton.com/datasheet.php';
my $model = '?model=';
my $parameter = '&locale=en_GB&type=pdf';

# Open the file handles READ to read the Eaton IDs.
open READ, '<', $read_file_path or die "Couldn't open the file: $!\n";


# Main Program

# Store all the IDs from the eaton IDs file.
while (my $line = <READ>)
{
  chomp $line;
  push @IDs, $line if $line =~ /\d{6}/;
}

# Download all the PDF files from the eaton website.
foreach my $ID (@IDs)
{
  my $url = "";
  $url = $download_url . $model . $ID . $parameter;
  say "Downloaded: $url";
  getstore $url, "$base_storage_path_for_pdfs" . "$ID.pdf" or warn "Download Failed!";
  sleep(5);
}

# END of the program.
close READ;
say "All Downloads are finished.";
