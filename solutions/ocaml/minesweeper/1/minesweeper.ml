open Stdlib

let annotate board =
  let count_adjacent y x =
    let block y x =
      let subseq length getter i =
        Seq.ints (i - 1)
        |> Seq.take 3
        |> Seq.filter (fun x -> 0 <= x && x < length)
        |> Seq.map getter
      in
      subseq (List.length board) (List.nth board) y
      |> Seq.flat_map (fun row -> subseq (String.length row) (String.get row) x)
    in
    block y x |> Seq.filter (( == ) '*') |> Seq.length
  in
  let annotate_cell y x = function
    | ' ' ->
        let mines = count_adjacent y x in
        if mines == 0 then ' ' else mines + Char.code '0' |> Char.chr
    | c -> c
  in
  List.mapi (fun y row -> String.mapi (annotate_cell y) row) board
