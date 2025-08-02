pub fn check(candidate: &str) -> bool {
    let mut chars = std::collections::HashSet::new();
    candidate.to_lowercase().chars()
        .filter(|c| c.is_alphabetic())
        .all(|c| chars.insert(c))
}
