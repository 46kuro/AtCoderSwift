import Foundation

class ABC179A: Task {
    typealias Executer = ABC179ATestExecuter

    var inOutList: [(input: String, output: String)] = {
        [
            (input:
                """
                apple
                """,
            output:
                """
                apples
                """
            ),
            (input:
                """
                bus
                """,
            output:
                """
                buses
                """
            ),
        ]
    }()
}

class ABC179ATestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let s = readLine()!
        if s.last! == "s" {
            print(s + "es")
        } else {
            print(s + "s")
        }
    }
}
