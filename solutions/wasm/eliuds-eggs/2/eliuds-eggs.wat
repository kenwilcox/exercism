(module
  (func (export "eggCount") (param $number i32) (result i32)
    (local $result i32)
    loop
      (local.set $result (i32.add (local.get $result) (i32.and (local.get $number) (i32.const 1))))
      (br_if 0 (local.tee $number (i32.shr_u (local.get $number) (i32.const 1))))
    end
    (local.get $result)
  )
)
