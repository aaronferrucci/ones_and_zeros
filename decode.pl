use strict;
use warnings;

sub _bin2hex($);
sub _bin2hex($)
{
  my $input_hrs = shift;
  my @output_hrs = ();
  my $done = 0;

  for my $hr (@$input_hrs) {
    my $bin = $hr->{bin};
    if ($bin eq "") {
      $done = 1;
      last;
    }
    my $val = $hr->{val};
    $bin =~ /(.)(.*)/;
    my $digit = $1;
    my $rest = $2;
    if ($digit eq 'x') {
      push @output_hrs, {bin => $rest, val => 2 * $val + 0};
      push @output_hrs, {bin => $rest, val => 2 * $val + 1};
    } else {
      push @output_hrs, {bin => $rest, val => 2 * $val + ($digit ? 1 : 0)};
    }
  }

  return $done ? $input_hrs : _bin2hex([@output_hrs]);

}

sub bin2hex($)
{
  my $bin = shift;

  my $hr = {
    bin => $bin,
    val => 0,
  };

  my $results = _bin2hex([$hr]);
  my @vals = ();
  for my $hr (@$results) {
    push @vals, $hr->{val};
  }

  return [@vals];
}

while (<>) {
  next if (/^\s*#/);
  my @binstrs = split(/\s+/);
  for my $binstr (@binstrs) {
    my $decode = bin2hex($binstr);
    my @chars = map {chr} @$decode;
    @chars = grep {/^[[:print:]]+$/} @chars;
    if (@chars <= 8) {
      printf("%8s ", join('', @chars));
    } else {
      print "$binstr ";
    }
  }
  print "\n";
}

