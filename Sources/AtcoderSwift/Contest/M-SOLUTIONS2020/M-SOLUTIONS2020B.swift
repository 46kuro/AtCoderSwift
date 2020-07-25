import Foundation

class MSOLUTIONS2020B: Task {
    typealias Executer = MSOLUTIONS2020BTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["7 2 5", "3"], outputs: ["Yes"]),
            (inputs: ["7 4 2", "3"], outputs: ["No"]),
        ]
    }()
}

class MSOLUTIONS2020BTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let abc = readLine()!.split(separator: " ").compactMap { Int($0) }
        let a = abc[0]
        var b = abc[1]
        var c = abc[2]

        let k = Int(readLine()!)!
        var count = 0
        while count < k {
            if a >= b {
                b *= 2
            } else if b >= c {
                c *= 2
            } else {
                break
            }
            count += 1
        }
        print((a < b && b < c) ? "Yes" : "No")
    }
}
