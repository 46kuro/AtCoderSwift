import Foundation

class AISING2020C: Task {
    typealias Executer = AISING2020CTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["20"], outputs: ["0", "0", "0", "0", "0", "1", "0", "0", "0", "0", "3", "0", "0", "0", "0", "0", "3", "3", "0", "0"])
        ]
    }()
}

class AISING2020CTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

    }
}