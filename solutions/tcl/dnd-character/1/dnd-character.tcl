namespace eval dnd {
    namespace export character ability modifier
    namespace ensemble create

    proc modifier {score} {
        expr {($score - 10) / 2}
    }

    proc d6 {} {
        expr {1 + int(rand() * 6)}
    }

    proc ability {} {
        set dice [list [d6] [d6] [d6] [d6]]
        set take [lsort -integer $dice]
        ::tcl::mathop::+ {*}[lrange $take 1 end]
    }

    proc character {} {
        set ch [dict create]
        foreach stat {charisma dexterity intelligence strength wisdom constitution} {
            dict set ch $stat [ability]
        }
        dict set ch hitpoints [expr {10 + [modifier [dict get $ch constitution]]}]
        expr {$ch}
    }
}
