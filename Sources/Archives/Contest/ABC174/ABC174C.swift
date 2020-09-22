import Foundation

class ABC174C: Task {
    typealias Executer = ABC174CTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["101"], outputs: ["4"]),
            (inputs: ["7777"], outputs: ["4"]),
            (inputs: ["2"], outputs: ["-1"]),
            (inputs: ["999983"], outputs: ["999982"]),
            (inputs: ["1"], outputs: ["1"]),
            (inputs: ["3"], outputs: ["3"])
        ]
    }()
}

class ABC174CTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let K = Int(readLine()!)!
        var result = -1
        var value: Int = 7
        if value % K == 0 {
            print(1)
        } else {
            for i in 1...K {
                if value == 0 {
                    result = i
                    break
                }
                value = (value * 10 + 7) % K
            }
            print(result)
        }
    }
}
