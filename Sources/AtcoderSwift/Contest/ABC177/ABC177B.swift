import Foundation

class ABC177B: Task {
    typealias Executer = ABC177BTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["cabacc", "abc"], outputs: ["1"]),
            (inputs: ["codeforces", "atcoder"], outputs: ["6"])
        ]
    }()
}

class ABC177BTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        var result = Int.max
        let S = Array(readLine()!)
        let T = Array(readLine()!)

        for sIndex in 0..<S.count {
            if S.count - sIndex >= T.count {
                var tmpMin = 0
                for tIndex in 0..<T.count {
                    if S[sIndex+tIndex] != T[tIndex] {
                        tmpMin += 1
                    }
                }
                result = min(result, tmpMin)
            }
        }

        print(result)
    }
}
