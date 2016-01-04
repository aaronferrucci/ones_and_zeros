use strict;
use warnings;

# Given a list of input data items:
#   [
#     bin => <something>, # binary digits, in [01x]
#     val => <something>, # value computed so far
#   ]
#
# extract the msb of 'bin' and recur on the rest:
# a. if msb is 0, val is 2*val
# b. if msb is 1, val is 2*val + 1
# c. if msb is x, spawn two subvalues, 2*val, 2*val + 1
#
# base case: bin is empty string. In that case, done here, return all.
sub _bin2hex($);
sub _bin2hex($)
{
  my $input_hrs = shift;
  my @output_hrs = ();

  for my $hr (@$input_hrs) {
    my $bin = $hr->{bin};
    if ($bin eq "") {
      return $input_hrs;
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

  return _bin2hex([@output_hrs]);

}

# Input: a binary string, optionally with don't-care ('x').
# examples:
#   01101001
#   01x
#   xxxxx
#   000000001
#   01010101x
#
# Output: a list of all possible values for the input.
# examples:
# input: 0101
# output: (5)
# input: x
# output: (0, 1)
# input: 0101010x
# output: (0x55, 0x56)
sub bin2hex($)
{
  my $bin = shift;

  # Format an initial data structure for the recursive routine.
  my $hr = {
    bin => $bin,
    val => 0,
  };

  my $results = _bin2hex([$hr]);

  # Extract the values from the recursive routine.
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
    # Restrict consideration to printable characters.
    @chars = grep {/^[[:print:]]+$/} @chars;
    if (@chars <= 8) {
      printf("%8s ", join('', @chars));
    } else {
      print "$binstr ";
    }
  }
  print "\n";
}

