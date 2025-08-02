proc diamond {letter} {
    set A 65
    set letterValue [scan $letter %c]
    set size [expr {$letterValue - $A + 1}]
    set rows {}

    for {set i 0} {$i < $size} {incr i} {
        set char [format %c [expr {$A + $i}]]
        set outter [string repeat " " [expr {$size - $i - 1}]]
        if {$i == 0} {
          set line "$outter$char$outter"
        } else {
          set middle [string repeat " " [expr {2 * $i - 1}]]
          set line "$outter$char$middle$char$outter"
        }
        lappend rows $line
    }
    set diamond [concat $rows [lreverse [lrange $rows 0 end-1]]]
    return [join $diamond \n]
}
