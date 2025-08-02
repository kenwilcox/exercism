#[derive(Debug, Clone, Copy)]
pub enum Category {
    Ones = 1,
    Twos,
    Threes,
    Fours,
    Fives,
    Sixes,
    FullHouse,
    FourOfAKind,
    LittleStraight,
    BigStraight,
    Choice,
    Yacht,
}

type Dice = [u8; 5];

pub fn score(dice: Dice, category: Category) -> u8 {
    let mut sort = dice;
    sort.sort_unstable();
    match category {
        Category::FullHouse => (sort[0] != sort[4]
            && ((sort[0] == sort[1] && sort[2] == sort[4]) || (sort[0] == sort[2] && sort[3] == sort[4])))
            .then_some(dice.iter().sum()),
        Category::FourOfAKind => (sort[0] == sort[3] || sort[1] == sort[4]).then_some(4 * dice[1]),
        Category::LittleStraight => (sort == [1, 2, 3, 4, 5]).then_some(30),
        Category::BigStraight => (sort == [2, 3, 4, 5, 6]).then_some(30),
        Category::Choice => Some(dice.iter().sum()),
        Category::Yacht => (sort[0] == sort[4]).then_some(50),
        _ => Some(dice.iter().filter(|&&d| d == category as u8).sum()),
    }
    .unwrap_or(0)
}
