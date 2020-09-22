import Foundation

class MSOLUTIONS2020C: Task {
    typealias Executer = MSOLUTIONS2020CTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["5 3", "96 98 95 100 20"], outputs: ["Yes", "No"]),
            (inputs: ["3 2", "1001 869120 1001"], outputs: ["No"]),
            (inputs: ["15 7", "3 1 4 1 5 9 2 6 5 3 5 8 9 7 9"], outputs: ["Yes", "Yes", "No", "Yes", "Yes", "No", "Yes", "Yes"]),
        ]
    }()
}

class MSOLUTIONS2020CTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let NK = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = NK[0]
        let k = NK[1]

        let AN = readLine()!.split(separator: " ").compactMap { Int($0) }

        for i in 0..<n {
            if i < k {
                continue
            }

            if AN[i] - AN[i-k] > 0 {
                print("Yes")
            } else {
                print("No")
            }
        }
    }
}
