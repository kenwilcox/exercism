package Gigasecond;

use v5.38;

use Exporter qw<import>;
our @EXPORT_OK = qw<add_gigasecond>;

use Time::Piece;

sub add_gigasecond ($time) {
    (Time::Piece->strptime($time, '%FT%T') + 10 **9)->datetime;
}

