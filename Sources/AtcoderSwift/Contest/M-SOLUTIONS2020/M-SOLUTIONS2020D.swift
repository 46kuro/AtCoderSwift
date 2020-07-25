import Foundation

class MSOLUTIONS2020D: Task {
    typealias Executer = MSOLUTIONS2020DTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["7", "100 130 130 130 115 115 150"], outputs: ["1685"]),
            (inputs: ["6", "200 180 160 140 120 100"], outputs: ["1000"]),
            (inputs: ["2", "157 193"], outputs: ["1216"]),
        ]
    }()
}

class MSOLUTIONS2020DTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let N = Int(readLine()!)!
        let AN = readLine()!.split(separator: " ").compactMap { Int($0) }

        var money = 1000
        for i in 0..<N-1 {
            if AN[i] < AN[i+1] {
                money += Int(money/AN[i])*(AN[i+1]-AN[i])
            }
        }
        print(money)
    }
}
