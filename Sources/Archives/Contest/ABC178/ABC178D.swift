import Foundation

class ABC178D: Task {
    typealias Executer = ABC178DTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["7"], outputs: ["3"]),
            (inputs: ["2"], outputs: ["0"]),
            (inputs: ["1729"], outputs: ["294867501"])
        ]
    }()
}

class ABC178DTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let s = Int(readLine()!)!
        let mod = 1000000007

        var dp = Array(repeating: 0, count: s+1)
        if s >= 3 {
            dp[0] = 1
            for i in 3..<s+1 {
                dp[i] = dp[i-1] + dp[i-3]
                dp[i] %= mod
            }
        }
        print(dp[s])
    }
}
