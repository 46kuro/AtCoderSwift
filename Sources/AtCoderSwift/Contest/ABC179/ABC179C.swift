import Foundation

class ABC179C: Task {
    typealias Executer = ABC179CTestExecuter

    var inOutList: [(input: String, output: String)] = {
        [
            (input:
                """
                3
                """,
            output:
                """
                3
                """
            ),
            (input:
                """
                100
                """,
            output:
                """
                473
                """
            ),
        ]
    }()
}

class ABC179CTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let n = Int(readLine()!)!
        var count = 0
        for i in 1..<n {
            count += (n-1) / i
        }
        print(count)
    }
}
