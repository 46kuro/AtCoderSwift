import Foundation

class ABC171D: Task {
    typealias Executer = ABC171DTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["4", "1 2 3 4", "3", "1 2", "3 4", "2 4"], outputs: ["11", "12", "16"]),
            (inputs: ["4", "1 1 1 1", "3", "1 2", "2 1", "3 5"], outputs: ["8", "4", "4"]),
            (inputs: ["2", "1 2", "3", "1 100", "2 100", "100 1000"], outputs: ["102", "200", "2000"])
        ]
    }()
}

class ABC171DTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        _ = Int(readLine()!)!
        let AN = readLine()!.split(separator: " ").compactMap { Int($0) }
        let Q = Int(readLine()!)!
        let BCQ: [(Int, Int)] = (1...Q).map { _ in
            let bc = readLine()!.split(separator: " ").compactMap { Int($0) }
            return (bc[0], bc[1])
        }

        var dict = [Int: Int]()
        for an in AN {
            if dict[an] == nil {
                dict[an] = 1
            } else {
                dict[an]! += 1
            }
        }

        var sum = dict.reduce(0) { $0 + ($1.key * $1.value) }
        for bc in BCQ {
            if dict[bc.0] != nil {
                let diff = (bc.1 - bc.0) * dict[bc.0]!
                sum += diff

                if dict[bc.1] != nil {
                    dict[bc.1]! += dict[bc.0]!
                } else {
                    dict[bc.1] = dict[bc.0]
                }
                dict[bc.0] = 0
            }
            print(sum)
        }
    }
}
