import Foundation

class AISING2020A: Task {
    typealias Executer = AISING2020ATestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["5 10 2"], outputs: ["3"]),
            (inputs: ["6 20 7"], outputs: ["2"]),
            (inputs: ["1 100 1"], outputs: ["100"])
        ]
    }()
}

class AISING2020ATestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

    }
}