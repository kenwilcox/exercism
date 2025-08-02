//Solution goes in Sources
import Foundation

enum Plant: Character {
    case radishes = "R"
    case clover = "C"
    case grass = "G"
    case violets = "V"
}

class Garden {
    let garden: [String]
    let children: [String]

    init(_ diagram: String, children: [String] = []) {
        self.garden = diagram.components(separatedBy: "\n")
        self.children = children.sorted();
    }

    //plantsForChild("Bob")
    func plantsForChild(_ child: String) -> [Plant] {
        let childIndex = self.children.count > 0 ?
            (children.index(of: child) ?? 0) * 2 :
            (Int((child[child.index(child.startIndex, offsetBy: 0)].asciiValue! - Character("A").asciiValue!) * 2))
        
        let firstIndex = garden[0].index(garden[0].startIndex, offsetBy: childIndex)
        let secondIndex = garden[0].index(garden[0].startIndex, offsetBy: childIndex + 1)

        return [
            Plant(rawValue: garden[0][firstIndex])!,
            Plant(rawValue: garden[0][secondIndex])!,
            Plant(rawValue: garden[1][firstIndex])!,
            Plant(rawValue: garden[1][secondIndex])!
        ]
    }
}
