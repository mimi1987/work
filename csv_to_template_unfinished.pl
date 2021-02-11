use strict;
use warnings;

use v5.30;

use feature qw(say);

use Tie::IxHash;
use Data::Dumper;


# GLOBAL VARIABLES
#my$csv_path = <STDIN>; ALTERNATIV!!!!
my $csv_path = 'C:\Users\Geizhals\Downloads\Produktfinder-2021-02-09.csv';
tie my %header_hash, "Tie::IxHash";


# SUBROUTINES

# Extract The Header
sub get_header {
  my $header_row = shift;

  $header_row or print "Please pass the header row.\n";
  my @headers = split /;/, $header_row;
  return @headers;
}


# Create A Hashtable With The Header Values As Keys
sub make_hash_from_header {
  my @headers = @_;
  foreach my $key (@headers){
    $header_hash{$key} = '';
  }
  return %header_hash;
}

# To Get A Record By His Product Number
sub get_record_by_product_number {
  my ($product_number, $records_ref) = @_;
  shift @$records_ref; # Get rid of header record

  foreach my $record (@$records_ref){
    chomp $record;
    if($record =~ /^$product_number/i){
      my @record = split /;/, $record;
      return @record;
    }else{
      next;
    }
    say "Couldn't Find The Product Number : $product_number";
  }
}

# Map Record Fields To Keys In Header Hashtable
sub map_fields_to_header_hash {
  my ($header_hash, $record_by_product_number) = @_;
  my %mapped_hash;
  while (my $key = keys %$header_hash){
    foreach my $value (@$record_by_product_number){
      $mapped_hash{$key} = $value;
    }
  }
  return %mapped_hash;
}

# MAIN PROGRAM
if(-e $csv_path){
  open my $CSV, '<', $csv_path;

  my @csv_array = <$CSV>;
  my @header = get_header(@csv_array);
  my %header_hash = make_hash_from_header(@header);

  foreach my $value (@header){
    say $value;
  }
  print '#'x30, "\n";

  while (my ($k, $v) = each %header_hash){
    say "$k => $v";
  }
  my @record_by_product_number = get_record_by_product_number("MR.JU411.001", \@csv_array);


  #my %mapped_hash = map_fields_to_header_hash(\%header_hash, \@record_by_product_number);

  # while (my ($k, $v) = each %mapped_hash){
  #   say "$k => $v";
  # }
}else{
  say "File Doesn't Exists : $!";
}
