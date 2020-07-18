import Foundation

class ABC173D: Task {
    typealias Executer = ABC173DTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [(inputs: ["4", "2 2 1 3"], outputs: ["7"]), (inputs: ["7", "1 1 1 1 1 1 1"], outputs: ["6"])]
    }()
}

class ABC173DTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

    }
}