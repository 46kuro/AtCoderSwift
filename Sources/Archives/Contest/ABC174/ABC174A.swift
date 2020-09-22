import Foundation

class ABC174A: Task {
    typealias Executer = ABC174ATestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["25"], outputs: ["No"]),
            (inputs: ["30"], outputs: ["Yes"])
        ]
    }()
}

class ABC174ATestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let X = Int(readLine()!)!
        print(X >= 30 ? "Yes" : "No")
    }
}
