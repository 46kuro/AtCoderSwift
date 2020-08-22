import Foundation

class ABC176C: Task {
    typealias Executer = ABC176CTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["5", "2 1 5 4 3"], outputs: ["4"]),
            (inputs: ["5", "3 3 3 3 3"], outputs: ["0"])
        ]
    }()
}

class ABC176CTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let _ = Int(readLine()!)!
        let A = readLine()!.split(separator: " ").compactMap { Int($0) }
        var result = 0
        var minimum = A[0]
        for i in 1..<A.count {
            let diff = A[i] - minimum
            if diff < 0 {
                result += -diff
            } else {
                minimum = A[i]
            }
        }
        print(result)
    }
}
