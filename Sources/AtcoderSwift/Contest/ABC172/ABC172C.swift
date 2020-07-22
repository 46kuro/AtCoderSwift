import Foundation

class ABC172C: Task {
    typealias Executer = ABC172CTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["3 4 240", "60 90 120", "80 150 80 150"], outputs: ["3"]),
            (inputs: ["3 4 730", "60 90 120", "80 150 80 150"], outputs: ["7"]),
            (inputs: ["5 4 1", "1000000000 1000000000 1000000000 1000000000 1000000000", "1000000000 1000000000 1000000000 1000000000"], outputs: ["0"])
        ]
    }()
}

class ABC172CTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

    }
}
