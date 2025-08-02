package KindergartenGarden;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<plants>;

sub plants ( $diagram, $student ) {
    my %plants = (
        C => 'clover',
        G => 'grass',
        R => 'radishes',
        V => 'violets',
    );

    my $idx = index("ABCDEFGHIJKL", substr($student, 0, 1)) * 2;
    my $len = length $diagram;
    $len = $len / 2 + 1;
    my $x0 = %plants{substr $diagram, $idx, 1};
    my $x1 = %plants{substr $diagram, $idx + 1, 1};
    my $x2 = %plants{substr $diagram, $idx + $len, 1};
    my $x3 = %plants{substr $diagram, $idx + 1 + $len, 1};
    return [$x0, $x1, $x2, $x3]
}

1;
