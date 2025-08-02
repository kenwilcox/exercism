module TwoFer

let twoFer (input: string option): string =
    let name = match input with
               | Some(x) -> x
               | None -> "you"
    $"One for {name}, one for me."