(module
  ;; returns num^e
  (func $pow (param $num i32) (param $e i32) (result i32)
    (local $i i32)
    (local $sum i32)
    (local.set $sum (i32.const 1))
    loop $loop
      (local.set $sum (i32.mul (local.get $sum) (local.get $num)))
      (local.tee $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $loop (i32.ne (local.get $e)))
    end
    (local.get $sum)
  )

  ;; returns 1 if armstrong number, 0 otherwise
  (func (export "isArmstrongNumber") (param $candidate i32) (result i32)
    (local $n i32) (local $c i32) (local $s i32) (local $i i32)
    (local.set $c (local.get $candidate))
    loop $count
      (local.set $n (i32.add (local.get $n) (i32.const 1)))
      (local.tee $c (i32.div_u (local.get $c) (i32.const 10)))
      (br_if $count (i32.gt_u (i32.const 0)))
    end

    (local.set $c (local.get $candidate))
    loop $sum
      (i32.rem_u (local.get $c) (i32.const 10))
      (call $pow (local.get $n))
      (local.set $s (i32.add (local.get $s)))
      (local.set $c (i32.div_u (local.get $c) (i32.const 10)))
      (local.tee $i (i32.add (local.get $i) (i32.const 1)))
      (br_if $sum (i32.lt_u (local.get $n)))
    end
    (i32.eq (local.get $s) (local.get $candidate))
  )
)
