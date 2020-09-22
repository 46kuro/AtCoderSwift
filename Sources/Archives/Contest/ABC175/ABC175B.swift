import Foundation

class ABC175B: Task {
    typealias Executer = ABC175BTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["5", "4 4 9 7 5"], outputs: ["5"]),
            (inputs: ["6", "4 5 4 3 3 5"], outputs: ["8"]),
            (inputs: ["10", "9 4 6 1 9 6 10 6 6 8"], outputs: ["39"]),
            (inputs: ["2", "1 1"], outputs: ["0"])
        ]
    }()
}

class ABC175BTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let _ = Int(readLine()!)!
        let LN = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

        var result = 0
        for i in 0..<LN.count {
            let c = LN[LN.count - 1 - i]

            for j in (i+1)..<LN.count {
                let b = LN[LN.count - 1 - j]

                for z in (j+1)..<LN.count {
                    let a = LN[LN.count - 1 - z]

                    if a != b, b != c, a + b > c {
                        result += 1
                    }
                }
            }
        }

        print(result)
    }
}
