package Series;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<slices>;

sub slices ( $series, $slice_length ) {
    die "series cannot be empty" unless length($series);
    die "slice length cannot be greater than series length" if $slice_length > length($series);
    die "slice length cannot be zero" if !$slice_length;
    die "slice length cannot be negative" if 0 > $slice_length;

    my @results = ();
    for (my $i = 0; $i < length($series) - $slice_length+1; $i++) {
        push @results, substr($series, $i, $slice_length);
    }
    return \@results;
}

1;
