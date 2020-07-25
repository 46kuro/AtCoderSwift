import Foundation

class ABC171B: Task {
    typealias Executer = ABC171BTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["5 3", "50 100 80 120 80"], outputs: ["210"]),
            (inputs: ["1 1", "1000"], outputs: ["1000"])
        ]
    }()
}

class ABC171BTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let NK = readLine()!.split(separator: " ").compactMap { Int($0) }
        let PN = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
        let k = NK[1]
        print(PN[0..<k].reduce(0) { $0 + $1 })
    }
}
