(module
  (memory (export "mem") 1)

  (global $a i32 (i32.const 97))
  (global $z i32 (i32.const 122))
  (global $A i32 (i32.const 65))
  (global $Z i32 (i32.const 90))
  
  (func (export "rotate") (param $textOffset i32) (param $textLength i32) (param $shiftKey i32) (result i32 i32)
    (local $pos i32) (local $letter i32) (local $end i32)
    (local.set $pos (local.get $textOffset))
    (local.set $end (i32.add (local.get $textOffset) (local.get $textLength)))

    loop $loop
      (local.set $letter (i32.load8_u (local.get $pos)))
      (i32.store8 (local.get $pos) (call $convert (local.get $letter) (local.get $shiftKey)))
      (local.set $pos (i32.add (local.get $pos) (i32.const 1)))
      (br_if $loop (i32.lt_u (local.get $pos) (local.get $end)))
    end
    (return (local.get $textOffset) (local.get $textLength))
  )

  (func $lower (param $letter i32) (result i32)
    (return (i32.and (i32.ge_u (local.get $letter) (global.get $a))
            (i32.le_u (local.get $letter) (global.get $z))))
  )

  (func $upper (param $letter i32) (result i32)
    (return (i32.and (i32.ge_u (local.get $letter) (global.get $A))
            (i32.le_u (local.get $letter) (global.get $Z))))
  )

  (func $convert (param $letter i32) (param $shiftKey i32) (result i32) (local $letterOffset i32)
    (if (i32.or 
	  (call $lower (local.get $letter))
      (call $upper (local.get $letter)))
    (then (local.set $letterOffset 
		(select (global.get $a)
		  (global.get $A)
          (call $lower (local.get $letter))))
	)
    (else (return (local.get $letter))))

    (return (i32.add (local.get $letterOffset)
			(i32.rem_u (i32.add (local.get $shiftKey) 
            (i32.sub (local.get $letter) (local.get $letterOffset)))
            (i32.const 26))))
  )
)
