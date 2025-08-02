fun concat (lists: int list list): int list =
  case lists of
    [] => []
   | h::t => h@(concat t)

fun reverse (list: int list): int list =
  let 
    fun f (h::t) acc = f t (h::acc)
    |f [] acc = acc
  in
    f list []
    end

fun filter (function: int -> bool, list: int list): int list =
  case list of
    [] => []
    | h::t => if (function h) then (h::(filter (function, t))) else (filter (function, t))


fun map (function: int -> int, list: int list): int list =
  case list of
    [] => []
   | h::t => (function h)::(map (function, t))

fun append (list1: int list, list2: int list): int list =
  list1@list2

fun length (ns: int list): int =
  case ns of 
    [] => 0
   | h::t => 1 + length t

fun foldl (function: int * int -> int, initial: int, list: int list): int =
  case list of
    [] => initial
   | h::t => foldl (function, (function (initial, h)), t)

fun foldr (function: int * int -> int, initial: int, list: int list): int =
  foldl (fn (a, b) => function(b, a), initial, reverse list)
