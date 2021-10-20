use v5.30.0;

# Global Variables
my $read_path = 'C:\Users\michaelm\Downloads\eaton.txt';
my $write_path = 'C:\Users\michaelm\Downloads\eaton_ids.txt';
my @IDs;

# Files Handles
open READ, '<', $read_path or die "Couldn't open file, because of error: $!\n";
open WRITE, '>', $write_path or die "Couldn't open file, because of error: $!\n";

# Main Program

# Find the IDs from READ in the format '(123456)' and push it into the list @IDs
while (my $line = <READ>)
{
  my $id = $line =~ m/\((\d{6})\)/ ? $1 : undef;
  push @IDs, $id;
}

# Sort the @IDs in descending order
@IDs = sort @IDs;

# Write the found ids into the WRITE file handle.
foreach my $id (@IDs)
{
  print WRITE "$id\n";
}

# Print a message that the program finished.
say "All lines are written into the file: $write_path";
