package Darts;

use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<score_dart>;

use Math::Complex;

sub score_dart ( $x, $y ) {
    my $val = abs(Math::Complex->make($x,$y));
    if ($val > 10) {return 0}
    if ($val > 5) {return 1}
    if ($val > 1) {return 5}
    return 10;
}
