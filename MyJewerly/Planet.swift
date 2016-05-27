import SpriteKit

enum CookieType: Int, CustomStringConvertible {
    case Unknown = 0, Earth, Ceres, Mars, Moon, Sun, Uranus,Saturn
    
    var spriteName: String {
        let spriteNames = ["Earth","Ceres","Mars","Moon","Sun","Uranus","Saturn"]
        
        return spriteNames[rawValue - 1]
    }
    
    var highlightedSpriteName: String {
        return spriteName + "-Highlighed"
    }
    
    static func random() -> CookieType {
        return CookieType(rawValue: Int(arc4random_uniform(7)) + 1)!
    }
    
    var description: String {
        return spriteName
    }

}

class Cookie: CustomStringConvertible,Hashable {
    var column: Int
    var row: Int
    let cookieType: CookieType
    var sprite: SKSpriteNode?
    
    init(column: Int, row: Int, cookieType: CookieType) {
        self.column = column
        self.row = row
        self.cookieType = cookieType
    }
    var description: String {
        return "type:\(cookieType) square:(\(column),\(row))"
    }
    
    var hashValue: Int {
        return row*10 + column
    }
}

func ==(lhs: Cookie, rhs: Cookie) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}