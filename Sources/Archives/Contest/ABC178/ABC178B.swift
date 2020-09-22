import Foundation

class ABC178B: Task {
    typealias Executer = ABC178BTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["1 2 1 1"], outputs: ["2"]),
            (inputs: ["3 5 -4 -2"], outputs: ["-6"]),
            (inputs: ["-1000000000 0 -1000000000 0"], outputs: ["1000000000000000000"]),
        ]
    }()
}

class ABC178BTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let abcd = readLine()!.split(separator: " ").compactMap { Int($0) }
        let a = abcd[0]
        let b = abcd[1]
        let c = abcd[2]
        let d = abcd[3]

        print(max(a * c, a * d, b * c, b * d))
    }
}
