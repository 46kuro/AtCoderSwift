import Foundation

class AISING2020B: Task {
    typealias Executer = AISING2020BTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["5", "1 3 4 5 7"], outputs: ["2"]),
            (inputs: ["15", "13 76 46 15 50 98 93 77 31 43 84 90 6 24 14"], outputs: ["3"])
        ]
    }()
}

class AISING2020BTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

    }
}