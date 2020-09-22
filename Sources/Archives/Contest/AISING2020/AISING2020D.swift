import Foundation

class AISING2020D: Task {
    typealias Executer = AISING2020DTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["3", "011"], outputs: ["2", "1", "1"]),
            (inputs: ["23", "00110111001011011001110"], outputs: ["2", "1", "2", "2", "1", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "2", "1", "3"])
        ]
    }()
}

class AISING2020DTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

    }
}