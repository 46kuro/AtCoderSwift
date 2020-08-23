import Foundation

class ABC174D: Task {
    typealias Executer = ABC174DTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["4", "WWRR"], outputs: ["2"]),
            (inputs: ["2", "RR"], outputs: ["0"]),
            (inputs: ["8", "WRWWRWRR"], outputs: ["3"])
        ]
    }()
}

class ABC174DTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        _ = Int(readLine()!)!
        let CN = Array(readLine()!)

        var an: [Int] = [0]
        var count = 0
        for i in 0..<CN.count {
            if CN[i] == "R" {
                count += 1
            }
            an.append(count)
        }

        var result = CN.count
        for i in 0..<an.count {
            let tmp = max(i - an[i], an[an.count-1] - an[i])
            result = min(result, tmp)
        }
        print(result)
    }
}
