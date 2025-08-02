//Solution goes in Sources

class Year {
    private var year: Int
    init(calendarYear: Int) {
        year = calendarYear
    }
    var isLeapYear: Bool {
        year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
    }
}
