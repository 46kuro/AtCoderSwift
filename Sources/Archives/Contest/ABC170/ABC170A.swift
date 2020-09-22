import Foundation

class ABC170A: Task {
    typealias Executer = ABC170ATestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["0 2 3 4 5"], outputs: ["1"]),
            (inputs: ["1 2 0 4 5"], outputs: ["3"])
        ]
    }()
}

class ABC170ATestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

    }
}