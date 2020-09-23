import Foundation

class ABC176F: Task {
    typealias Executer = ABC176FTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["2", "1 2 1 2 2 1"], outputs: ["2"]),
            (inputs: ["3", "1 1 2 2 3 3 3 2 1"], outputs: ["1"]),
            (inputs: ["3", "1 1 2 2 2 3 3 3 1"], outputs: ["3"])
        ]
    }()
}

class ABC176FTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let N = Int(readLine()!)!
        let AN = readLine()!.split(separator: " ").compactMap { Int($0) }
    }
}
