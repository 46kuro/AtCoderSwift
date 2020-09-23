import Foundation

class ABC178E: Task {
    typealias Executer = ABC178ETestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["3", "1 1", "2 4", "3 2"], outputs: ["4"]),
            (inputs: ["2", "1 1", "1 1"], outputs: ["0"]),
        ]
    }()
}

class ABC178ETestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

    }
}
