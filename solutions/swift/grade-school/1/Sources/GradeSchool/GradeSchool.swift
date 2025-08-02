//Solution goes in Sources

class GradeSchool {
    private var _roster = [Int:[String]]()
    var roster: [Int:[String]] {
        get { return _roster}
    }
    
    //school.addStudent("Aimee", grade: 2)
    func addStudent(_ name: String, grade: Int) {
        //roster[grade]?.append(name)
        var list = _roster[grade] ?? [String]()
        list.append(name)
        _roster[grade] = list
    }
    
    // school.studentsInGrade(5)
    func studentsInGrade(_ grade: Int) -> [String] {
        guard let result = _roster[grade] else {return [String]()}
        return result
    }
    
    // school.sortedRoster
    var sortedRoster:[Int:[String]] {
        get {
            var ret = [Int:[String]]()
            for key in _roster.keys.sorted() {
                ret[key] = _roster[key]?.sorted()
            }
            return ret
        }
    }
}
