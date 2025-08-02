pub fn expected_minutes_in_oven() -> Int {
  40
}

pub fn remaining_minutes_in_oven(actual_minutes) -> Int {
  expected_minutes_in_oven() - actual_minutes
}

pub fn preparation_time_in_minutes(number_of_layers) -> Int {
  number_of_layers * 2
}

pub fn total_time_in_minutes(layers, oven_time) -> Int {
  preparation_time_in_minutes(layers) + oven_time
}

pub fn alarm() -> String {
  "Ding!"
}