<?php
declare(strict_types=1);

function meetup_day(int $year, int $month, string $which, string $weekday): DateTimeImmutable
{
    return (new DateTimeImmutable())
        -> modify($which == 'teenth' ? 
                  "first $weekday $year/$month/12" :
                 "$which $weekday of $year/$month/01");
}
