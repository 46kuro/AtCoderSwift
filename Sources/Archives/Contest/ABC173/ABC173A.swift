import Foundation

class ABC173A: Task {
    typealias Executer = ABC173ATestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [(inputs: ["1900"], outputs: ["100"]), (inputs: ["3000"], outputs: ["0"])]
    }()
}

class ABC173ATestExecuter: TestExecuter {

    /// This part is implemented by the user
    /// After implementing this method, you will submit this method's logic
    override func execute() {
        let n = Int(readLine()!)!
        if n % 1000 == 0 {
            print(0)
        } else {
            print(1000 - (n % 1000))
        }
    }
}
