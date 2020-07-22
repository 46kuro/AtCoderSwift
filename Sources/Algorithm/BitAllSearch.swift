import Foundation

public func bitAllSearch(from value: Int) -> [[Int]] {
    (0..<(1<<value)).reduce([[Int]]()) { result, bit in
        result + [(0..<value).reduce([Int]()) {
            if bit & 1<<$1 != 0 {
                return $0 + [$1]
            } else {
                return $0
            }
        }]
    }
}
