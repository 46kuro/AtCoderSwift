import Foundation

class ABC172B: Task {
    typealias Executer = ABC172BTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["cupofcoffee", "cupofhottea"], outputs: ["4"]),
            (inputs: ["abcde", "bcdea"], outputs: ["5"]),
            (inputs: ["apple", "apple"], outputs: ["0"])
        ]
    }()
}

class ABC172BTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

    }
}
