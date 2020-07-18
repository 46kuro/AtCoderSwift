import Foundation

class ABC173C: Task {
    typealias Executer = ABC173CTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [(inputs: ["2 3 2", "..#", "###"], outputs: ["5"]), (inputs: ["2 3 4", "..#", "###"], outputs: ["1"]), (inputs: ["2 2 3", "##", "##"], outputs: ["0"]), (inputs: ["6 6 8", "..##..", ".#..#.", "#....#", "######", "#....#", "#....#"], outputs: ["208"])]
    }()
}

class ABC173CTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

    }
}