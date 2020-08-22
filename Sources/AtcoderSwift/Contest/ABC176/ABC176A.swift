import Foundation

class ABC176A: Task {
    typealias Executer = ABC176ATestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["20 12 6"], outputs: ["12"]),
            (inputs: ["1000 1 1000"], outputs: ["1000000"])
        ]
    }()
}

class ABC176ATestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let NXT = readLine()!.split(separator: " ").compactMap { Int($0) }

        if NXT[0] % NXT[1] == 0 {
            print(NXT[0] / NXT[1] * NXT[2])
        } else {
            print((NXT[0] / NXT[1] + 1) * NXT[2])
        }
    }
}
