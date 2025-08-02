import gleam/dict
import gleam/int
import gleam/list
import gleam/string

pub type School = dict.Dict(Int, List(String))

pub fn create() -> School { dict.new() }

pub fn roster(school: School) -> List(String) {
  let grades = list.sort(dict.keys(school), int.compare)
  list.flat_map(over: grades, with: fn(g){grade(school, g)})
}

pub fn add(
  to school: School,
  student student: String,
  grade g: Int,
) -> Result(School, Nil) {
  let current = grade(school, g)
  case list.contains(roster(school), student) {
    True -> Error(Nil)
    False -> Ok(dict.insert(school, g, list.sort([student, ..current], string.compare)))
  }
}

pub fn grade(school: School, desired_grade: Int) -> List(String) {
  case dict.get(school, desired_grade) {
    Ok(students) -> students
    Error(_) -> []
  }
}
