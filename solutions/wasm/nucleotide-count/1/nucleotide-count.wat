(module
  (memory (export "mem") 1)

  (func (export "countNucleotides") (param $offset i32) (param $length i32) (result i32 i32 i32 i32)
    (local $A i32)
    (local $C i32)
    (local $G i32)
    (local $T i32)

    (local $i i32) (local $char i32)
    (if (i32.eqz(local.get $length))(then (return (i32.const 0)(i32.const 0)(i32.const 0)(i32.const 0))))

    (loop $loop
      (local.set $char (i32.load8_u(i32.add(local.get $offset)(local.get $i))))

      (if (i32.eq (local.get $char)(i32.const 65))
        (then (local.set $A (i32.add(local.get $A)(i32.const 1))))
        (else (if (i32.eq (local.get $char)(i32.const 67))
          (then (local.set $C (i32.add(local.get $C)(i32.const 1))))
          (else (if (i32.eq (local.get $char)(i32.const 71))
            (then (local.set $G (i32.add(local.get $G)(i32.const 1))))
            (else (if (i32.eq (local.get $char)(i32.const 84))
              (then (local.set $T (i32.add(local.get $T)(i32.const 1))))
              (else (return (i32.const -1)(i32.const -1)(i32.const -1)(i32.const -1))))
            ))
          ))
        )
      )

      (local.set $i (i32.add(local.get $i)(i32.const 1)))
      (br_if $loop (i32.lt_u(local.get $i)(local.get $length)))
    )
    (return 
      (local.get $A)
      (local.get $C)
      (local.get $G)
      (local.get $T)
    )
  )
)
