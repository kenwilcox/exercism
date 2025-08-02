package AtbashCipher;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

use List::Util qw<pairvalues>;
my %dict;
@dict{ 'a' .. 'z' } = reverse( 'a' .. 'z' );
sub encode_atbash ($phrase) {
    return join( ' ', pairvalues split( /(\w{1,5})/, decode_atbash(@_) ) );
}
sub decode_atbash ($phrase) {
    return join '', map { /\d/ ? $_ : $dict{$_} } split( //, lc $_[0] =~ s/\W//gr );
}

1;
