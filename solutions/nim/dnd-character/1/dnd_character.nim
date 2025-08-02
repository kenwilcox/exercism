import std/[math, random]

type
  Character* = object
    strength*: int
    dexterity*: int
    constitution*: int
    intelligence*: int
    wisdom*: int
    charisma*: int
    hitpoints*: int

randomize()
proc d6: int = rand(1..6)

proc ability*: int =
  var rolls = [d6(), d6(), d6(), d6()]
  sum(rolls) - min(rolls)

proc modifier*(n: int): int =
  floorDiv(n - 10, 2)

proc initCharacter*: Character =
  let con = ability()

  Character(
    strength: ability(),
    dexterity: ability(),
    constitution: con,
    intelligence: ability(),
    wisdom: ability(),
    charisma: ability(),
    hitpoints: 10 + modifier(con)
  )