use v5.30.0;

# Global Vaiables
my $id_file_path = 'C:\Users\michaelm\Downloads\csv_ids.txt';
my $local_files_path = 'C:\Users\michaelm\Downloads\paths-to-pdfs.txt';
my $csv_import_file = 'C:\Users\michaelm\Downloads\csv_eaton_pdf_import.csv';
my @IDs;
my @Paths;
my %csv;

# File Handles
open ID, '<', $id_file_path;
open PATHS, '<', $local_files_path;
open CSV, '>', $csv_import_file;

# Main Program

# Add the Ids from the file handle ID into @IDs.
while (my $id = <ID>)
{
  chomp $id;
  push @IDs, $id;
}

# Add the paths from the file handle PATHS into @Paths.
while (my $path = <PATHS>)
{
  chomp $path;
  push @Paths, $path;
}

# Write the header files.
print CSV "GH-ID;Link zum File\n";

# Write the records into the csv file.
for (my $i; $i<=$#IDs+1;$i++)
{
  print CSV "$IDs[$i];$Paths[$i]\n";
}

# Close all the file handles.
close ID;
close PATHS;
close CSV;

# Finish the Program
say "Finished writing to the CSV file.";
