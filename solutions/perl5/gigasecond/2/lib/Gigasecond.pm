package Gigasecond;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<add_gigasecond>;

use Time::Piece;

sub add_gigasecond ($time) {
    return (Time::Piece->strptime($time, '%FT%T') + 10 **9)->datetime;
}


1;
