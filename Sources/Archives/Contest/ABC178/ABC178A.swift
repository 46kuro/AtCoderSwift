import Foundation

class ABC178A: Task {
    typealias Executer = ABC178ATestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["1"], outputs: ["0"]),
            (inputs: ["0"], outputs: ["1"]),
        ]
    }()
}

class ABC178ATestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let x = readLine()!
        print(x == "0" ? "1" : "0")
    }
}
