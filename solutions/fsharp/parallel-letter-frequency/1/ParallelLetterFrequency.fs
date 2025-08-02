module ParallelLetterFrequency
open System

let freq (text : string) = 
    text.ToLower()
    |> Seq.filter Char.IsLetter
    |> Seq.countBy id

let frequency texts =
    [ for t in texts ->
        async {
            return freq t
        }
    ]
    |> Async.Parallel
    |> Async.RunSynchronously
    |> Seq.concat
    |> Seq.groupBy fst
    |> Seq.map (fun (char, count) -> (char, count |> Seq.sumBy snd))
    |> Map.ofSeq