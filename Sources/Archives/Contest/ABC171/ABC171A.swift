import Foundation

class ABC171A: Task {
    typealias Executer = ABC171ATestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["B"], outputs: ["A"]),
            (inputs: ["a"], outputs: ["a"])
        ]
    }()
}

class ABC171ATestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
//        import Foundation
        let a = readLine()!
        print(a.range(of: "[A-Z]", options: .regularExpression) == nil ? "a" : "A")
    }
}
