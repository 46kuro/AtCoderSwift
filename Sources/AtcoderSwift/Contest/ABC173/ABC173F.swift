import Foundation

class ABC173F: Task {
    typealias Executer = ABC173FTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [(inputs: ["3", "1 3", "2 3"], outputs: ["7"]), (inputs: ["2", "1 2"], outputs: ["3"]), (inputs: ["10", "5 3", "5 7", "8 9", "1 9", "9 10", "8 4", "7 4", "6 10", "7 2"], outputs: ["113"])]
    }()
}

class ABC173FTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

    }
}