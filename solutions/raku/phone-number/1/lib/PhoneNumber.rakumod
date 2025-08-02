unit module PhoneNumber;

constant @errors = (
   '11 digits must start with 1',
   'must not be greater than 11 digits',
   'must not be fewer than 10 digits',
   'letters not permitted',
   'punctuations not permitted',
   'area code cannot start with zero',
   'area code cannot start with one',
   'exchange code cannot start with zero',
   'exchange code cannot start with one',
);

sub clean-number ($number) is export {
    my @digits = $number.comb.grep(* ~~ /<alnum>|<punct>/).grep(* !~~ / <[().-]> /);

    if any(@digits) ~~ /<alpha>/ { die @errors[3] };
    if any(@digits) ~~ /<punct>/ { die @errors[4] };

    @digits .= grep(/<digit>/);
    
    if @digits.elems == 11 and @digits[0] != 1 { die @errors[0] };
    if @digits.elems > 11 { die @errors[1] };
    if @digits.elems < 10 { die @errors[2] };
    if @digits.elems == 11 {@digits = @digits[1..10]};

    if @digits[0] == 0 { die @errors[5] };
    if @digits[0] == 1 { die @errors[6] };
    if @digits[3] == 0 { die @errors[7] };
    if @digits[3] == 1 { die @errors[8] };
    
    @digits.join
}
