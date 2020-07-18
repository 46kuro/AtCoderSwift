import Foundation

class ABC173E: Task {
    typealias Executer = ABC173ETestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [(inputs: ["4 2", "1 2 -3 -4"], outputs: ["12"]), (inputs: ["4 3", "-1 -2 -3 -4"], outputs: ["1000000001"]), (inputs: ["2 1", "-1 1000000000"], outputs: ["1000000000"]), (inputs: ["10 10", "1000000000 100000000 10000000 1000000 100000 10000 1000 100 10 1"], outputs: ["999983200"])]
    }()
}

class ABC173ETestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

    }
}