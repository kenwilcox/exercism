(module
  (memory (export "mem") 1)

  (data (i32.const 100) "black,brown,red,orange,yellow,green,blue,violet,grey,white")

  ;; Return buffer of comma separated colors
  ;; black,brown,red,orange,yellow,green,blue,violet,grey,white
  (func (export "colors") (result i32 i32)
    (return (i32.const 100) (i32.const 58))
  )

  ;; Called each time a module is initialized
  ;; Can be used to populate globals similar to a constructor
  (func $initialize)
  (start $initialize)

  ;; Given a valid resistor color, returns the associated value 
  (func (export "colorCode") (param $offset i32) (param $len i32) (result i32)
    (local $counter i32)
    (local $index i32)
    (local $match i32)

    loop $compare
      (if (i32.eq(i32.load8_s(i32.add(i32.const 100)(local.get $counter)))(i32.const 44)) (then 
		(local.set $index (i32.add(local.get $index)(i32.const 1))))
      )

      (if (i32.eq (i32.load8_s(i32.add(i32.const 100)(local.get $counter)))(i32.load8_s(i32.add (local.get $offset)(local.get $match)))) (then 
        (local.set $match (i32.add (local.get $match) (i32.const 1))))
      (else (local.set $match (i32.const 0)))
      )

      (if (i32.eq (local.get $match)(local.get $len)) (then 
        (return (local.get $index)))
      )

      (local.set $counter (i32.add (local.get $counter) (i32.const 1)))
      (br_if $compare (i32.le_u (local.get $counter)(i32.const 58)))
    end
    
    (return (i32.const -1))
  )
)
