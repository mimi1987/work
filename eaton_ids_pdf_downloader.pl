use v5.30.0;
use IO::Handle;
use LWP::UserAgent;
use HTTP::Request;

# Shows the output every second in the loop when using sleep.
STDOUT->autoflush(1);

# Create and set UserAgent object
my %options = (
  agent => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:53.0) Gecko/20100101 Firefox/53.0"
);
my $browser = LWP::UserAgent->new(%options);
$browser->ssl_opts(
  verify_hostname => 0,
);

# Global Variables.
my $read_file_path = 'C:\\Users\\michaelm\\Downloads\\eaton_ids.txt';
my $base_storage_path_for_pdfs = 'C:\\Users\\michaelm\\Downloads\\';
my @IDs;
my $download_url = 'https://datasheet.eaton.com/datasheet.php';
my $model = '?model=';
my $parameter = '&locale=de_DE&type=pdf';

# Open the file handle READ to read the Eaton IDs.
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
  my $file_path = "";

  $url = $download_url . $model . $ID . $parameter;
  $file_path = "$base_storage_path_for_pdfs" . "$ID.pdf";

  say "Download: $url";
  say "File Path: $file_path";

  my $req = HTTP::Request->new(GET => $url);

  my $response = $browser->request($req);

  if ($response->is_success)
  {
    open PDF, '>', $file_path;
    binmode(PDF);
    print PDF $response->content;
    close PDF;
  }
  else
  {
    print "Error in " . $response->status_line;
  }

  sleep(5);
}

# END of the program.
close READ;
say "All Downloads are finished.";
