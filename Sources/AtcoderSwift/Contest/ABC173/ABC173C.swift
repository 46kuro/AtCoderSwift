import Foundation

class ABC173C: Task {
    typealias Executer = ABC173CTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [(inputs: ["2 3 2", "..#", "###"], outputs: ["5"]), (inputs: ["2 3 4", "..#", "###"], outputs: ["1"]), (inputs: ["2 2 3", "##", "##"], outputs: ["0"]), (inputs: ["6 6 8", "..##..", ".#..#.", "#....#", "######", "#....#", "#....#"], outputs: ["208"])]
    }()
}

class ABC173CTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

        func bitAllSearch(from value: Int) -> [[Int]] {
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

        func character(string: String, of index: Int) -> Character {
            let i = string.index(string.startIndex, offsetBy: index)
            return string[i]
        }

        let firstLine = readLine()!.split(separator: " ").compactMap { Int($0) }
        let h = firstLine[0]
        let w = firstLine[1]
        let k = firstLine[2]

        let chwList = (1...h).map { _ in readLine()! }
        let hBitList = bitAllSearch(from: h)
        let wBitList = bitAllSearch(from: w)

        var result = 0
        hBitList.forEach { hBits in
            wBitList.forEach { wBits in
                var total = 0
                hBits.forEach { hBit in
                    wBits.forEach { wBit in
                        if character(string: chwList[hBit], of: wBit) == "#" {
                            total += 1
                        }
                    }
                }
                if total == k {
                    result += 1
                }
            }
        }
        print(result)
    }
}
