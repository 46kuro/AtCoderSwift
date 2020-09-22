import Foundation

class ABC178C: Task {
    typealias Executer = ABC178CTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["2"], outputs: ["2"]),
            (inputs: ["1"], outputs: ["0"]),
            (inputs: ["869121"], outputs: ["2511445"])
        ]
    }()
}

class ABC178CTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let n = Int(readLine()!)!
        let mod = 1000000007

        var ten = 1
        var nine = 1
        var eight = 1
        for _ in 1...n {
            ten *= 10
            ten %= mod

            nine *= 9
            nine %= mod

            eight *= 8
            eight %= mod
        }

        let result = (ten - eight - ((nine - eight) * 2)) % mod
        if result >= 0 {
            print(result)
        } else {
            print(mod + result)
        }
    }
}
