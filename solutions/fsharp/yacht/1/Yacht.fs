module Yacht

type Category = 
    | Ones | Twos | Threes | Fours | Fives | Sixes
    | FullHouse | FourOfAKind | LittleStraight | BigStraight | Choice
    | Yacht

type Die = One | Two | Three | Four | Five | Six
type DiceCount = int * Die
type SortedDice = SortedDice of DiceCount list

let availableDice = [One; Two; Three; Four; Five; Six]
let scoreDie (count,d) = 
    availableDice |> List.findIndex ((=) d) |> ((+) 1 >> (*) count)
let sortDice (dice: Die list) = 
    dice 
    |> List.groupBy id 
    |> List.map (fun (d,ds) -> (ds.Length, d))
    |> List.sortByDescending id
    |> SortedDice

let rec scoreSorted category (SortedDice dice) = 
    match (category, dice) with
        | Yacht, [(5,_)] -> 50
        | Ones, (_, One as d)::_ -> scoreDie d
        | Twos, (_, Two as d)::_ -> scoreDie d
        | Threes, (_, Three as d)::_ -> scoreDie d
        | Fours, (_, Four as d)::_ -> scoreDie d
        | Fives, (_, Five as d)::_ -> scoreDie d
        | Sixes, (_, Six as d)::_ -> scoreDie d
        | FullHouse, [3, _ as d1; 2, _ as d2] -> scoreDie d1 + scoreDie d2
        | FourOfAKind, (n, d1)::_ when n >= 4 -> scoreDie (4,d1)
        | LittleStraight, [(_, Five); _; _; _; _] -> 30
        | BigStraight, [(_, Six); _; _; _; (_, Two)] -> 30
        | Choice, dice -> List.sumBy scoreDie dice
        | _, _::xs -> scoreSorted category (SortedDice xs)
        | _, [] -> 0

let score category = 
    sortDice >> scoreSorted category