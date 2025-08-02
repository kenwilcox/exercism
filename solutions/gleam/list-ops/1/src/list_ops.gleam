pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  foldr(first, second, fn(acc, a) {[a, ..acc]})
}

pub fn concat(lists: List(List(a))) -> List(a) {
  foldl(lists, [], append)
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  use acc, a <- foldr(list, [])
  case function(a) {
    True -> [a, ..acc]
    False -> acc
  }
}

pub fn length(list: List(a)) -> Int {
  foldl(list, 0, fn(len, _) {len+1})
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  foldr(list, [], fn(acc, a) {[function(a), ..acc]})
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [head, ..tail] -> foldl(tail, function(initial, head), function)
    [] -> initial
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  list |> reverse |> foldl(initial, function)
}

pub fn reverse(list: List(a)) -> List(a) {
  foldl(list, [], fn(acc, a) {[a, ..acc]})
}
