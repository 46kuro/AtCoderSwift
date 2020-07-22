import Foundation

public func character(string: String, of index: Int) -> Character {
    let i = string.index(string.startIndex, offsetBy: index)
    return string[i]
}
