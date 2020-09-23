import Foundation

class ABC179B: Task {
    typealias Executer = ABC179BTestExecuter

    var inOutList: [(input: String, output: String)] = {
        [
            (input:
                """
                5
                1 2
                6 6
                4 4
                3 3
                3 2
                """,
            output:
                """
                Yes
                """
            ),
            (input:
                """
                5
                1 1
                2 2
                3 4
                5 5
                6 6
                """,
            output:
                """
                No
                """
            ),
            (input:
                """
                6
                1 1
                2 2
                3 3
                4 4
                5 5
                6 6
                """,
            output:
                """
                Yes
                """
            ),
        ]
    }()
}

class ABC179BTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let n = Int(readLine()!)!
        let DList = (0..<n).map { _ in readLine()!.split(separator: " ").compactMap { Int($0) } }

        var maxCount = 0
        var three = false
        for i in 0..<n {
            if DList[i][0] == DList[i][1] {
                maxCount += 1
                if maxCount == 3 {
                    three = true
                    break
                }
            } else {
                maxCount = 0
            }
        }
        print(three ? "Yes" : "No")
    }
}
