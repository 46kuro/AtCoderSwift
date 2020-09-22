import Foundation

class ABC175A: Task {
    typealias Executer = ABC175ATestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["RRS"], outputs: ["2"]),
            (inputs: ["SSS"], outputs: ["0"]),
            (inputs: ["RSR"], outputs: ["1"])
        ]
    }()
}

class ABC175ATestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let S = Array(readLine()!)
        if S[0] == "R" {
            if S[1] == "R" {
                print(S[2] == "R" ? 3 : 2)
            } else {
                print(1)
            }
        } else {
            if S[1] == "R" {
                print(S[2] == "R" ? 2 : 1)
            } else {
                print(S[2] == "R" ? 1 : 0)
            }
        }
    }
}
