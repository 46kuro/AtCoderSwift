import Foundation

class ABC173A: Task {
    typealias Executer = ABC173ATestExecuter

    var inOutList: [(inputs: [String], output: String)] = {
        [(inputs: ["1900"], output: "100"), (inputs: ["3000"], output: "0")]
    }()
}

class ABC173ATestExecuter: TestExecuter {

    /// This part is implemented by the user
    /// After implementing this method, you will submit this method's logic
    override func execute() {
        print(100)
    }
}
