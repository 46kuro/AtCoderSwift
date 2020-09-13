import Foundation

class ABC177A: Task {
    typealias Executer = ABC177ATestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["1000 15 80"], outputs: ["Yes"]),
            (inputs: ["2000 20 100"], outputs: ["Yes"]),
            (inputs: ["10000 1 1"], outputs: ["No"])
        ]
    }()
}

class ABC177ATestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let dts = readLine()!.split(separator: " ").compactMap { Int($0) }
        print(dts[0] <= dts[1] * dts[2] ? "Yes" : "No")
    }
}
