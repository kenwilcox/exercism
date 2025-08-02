unit module SecretHandshake;

sub handshake ( $number ) is export {
    my @result = ();
    if ($number +& 1 == 1) {@result.push("wink")};
    if ($number +& 2 == 2) {@result.push("double blink")};
    if ($number +& 4 == 4) {@result.push("close your eyes")};
    if ($number +& 8 == 8) {@result.push("jump")};
    if ($number +& 16 == 16) {@result .= reverse};
    @result;
}
