(module
  (func $is_triangle (param f32 f32 f32) (result i32)
    local.get 0
    local.get 1
    f32.add
    local.get 2
    f32.gt
    local.get 1
    local.get 2
    f32.add
    local.get 0
    f32.gt
    local.get 0
    local.get 2
    f32.add
    local.get 1
    f32.gt
    i32.and
    i32.and
  )

  (func $is_equilateral (export "isEquilateral") (param f32 f32 f32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $is_triangle
    local.get 0
    local.get 1
    f32.eq
    local.get 1
    local.get 2
    f32.eq
    i32.and
    i32.and
  )

  (func $is_isoceles (export "isIsosceles") (param f32 f32 f32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $is_triangle
    local.get 0
    local.get 1
    f32.eq
    local.get 1
    local.get 2
    f32.eq
    local.get 0
    local.get 2
    f32.eq
    i32.or
    i32.or
    i32.and
  )

  (func (export "isScalene") (param f32 f32 f32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $is_isoceles
    i32.const 0
    i32.eq
    local.get 0
    local.get 1
    local.get 2
    call $is_triangle
    i32.and

  )
)
