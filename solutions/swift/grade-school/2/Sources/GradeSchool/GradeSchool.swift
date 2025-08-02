//Solution goes in Sources

struct GradeSchool {
    typealias Roster = [ Int: [String] ]
    private(set) var roster: Roster = [:]

    var sortedRoster: Roster {
        roster.mapValues { $0.sorted() }
    }

    mutating func addStudent(_ name: String, grade: Int) {
        roster[ grade, default: [] ].append(name)
    }

    func studentsInGrade(_ grade: Int) -> [String] {
        roster[grade] ?? []
    }
}
