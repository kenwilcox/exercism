module Bob

let response (input: string): string = 
    match input with
    | input when input.EndsWith("?") && input.ToUpper() = input && input.ToLower() <> input -> "Calm down, I know what I'm doing!"
    | input when input.Trim().EndsWith("?") -> "Sure."
    | input when input.ToUpper() = input && input.ToLower() <> input -> "Whoa, chill out!"
    | input when input.Trim() = "" -> "Fine. Be that way!"
    |_ -> "Whatever."