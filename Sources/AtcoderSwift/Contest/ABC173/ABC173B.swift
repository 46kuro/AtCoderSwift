import Foundation

class ABC173B: Task {
    typealias Executer = ABC173BTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [(inputs: ["6", "AC", "TLE", "AC", "AC", "WA", "TLE"], outputs: ["AC x 3", "WA x 1", "TLE x 2", "RE x 0"]), (inputs: ["10", "AC", "AC", "AC", "AC", "AC", "AC", "AC", "AC", "AC", "AC"], outputs: ["AC x 10", "WA x 0", "TLE x 0", "RE x 0"])]
    }()
}

class ABC173BTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        
    }
}
