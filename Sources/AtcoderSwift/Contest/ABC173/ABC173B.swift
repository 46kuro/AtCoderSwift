import Foundation

class ABC173B: Task {
    typealias Executer = ABC173BTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [(inputs: ["6", "AC", "TLE", "AC", "AC", "WA", "TLE"], outputs: ["AC x 3", "WA x 1", "TLE x 2", "RE x 0"]), (inputs: ["10", "AC", "AC", "AC", "AC", "AC", "AC", "AC", "AC", "AC", "AC"], outputs: ["AC x 10", "WA x 0", "TLE x 0", "RE x 0"])]
    }()
}

class ABC173BTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let n = Int(readLine()!)!
        let sn = (1...n).map { _ in readLine()! }
        let result: [String: Int] = sn.reduce(["AC": 0, "WA": 0, "TLE": 0, "RE": 0]) {
            var result = $0
            result[$1]! += 1
            return result
        }
        print("AC x \(result["AC"]!)")
        print("WA x \(result["WA"]!)")
        print("TLE x \(result["TLE"]!)")
        print("RE x \(result["RE"]!)")
    }
}
