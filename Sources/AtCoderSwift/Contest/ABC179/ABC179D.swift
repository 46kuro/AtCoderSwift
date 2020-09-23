import Foundation

class ABC179D: Task {
    typealias Executer = ABC179DTestExecuter

    var inOutList: [(input: String, output: String)] = {
        [
            (input:
                """
                5 2
                1 1
                3 4
                """,
            output:
                """
                4
                """
            ),
            (input:
                """
                5 2
                3 3
                5 5
                """,
            output:
                """
                0
                """
            ),
            (input:
                """
                5 1
                1 2
                """,
            output:
                """
                5
                """
            ),
            (input:
                """
                60 3
                5 8
                1 3
                10 15
                """,
            output:
                """
                221823067
                """
            ),
        ]
    }()
}

class ABC179DTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        
    }
}
