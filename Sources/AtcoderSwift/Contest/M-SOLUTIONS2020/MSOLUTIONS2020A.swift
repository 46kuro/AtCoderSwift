import Foundation

class MSOLUTIONS2020A: Task {
    typealias Executer = MSOLUTIONS2020ATestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["725"], outputs: ["7"]),
            (inputs: ["1600"], outputs: ["2"]),
        ]
    }()
}

class MSOLUTIONS2020ATestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let X = Int(readLine()!)!
        if X <= 599 {
            print(8)
        } else if X <= 799 {
            print(7)
        } else if X <= 999 {
            print(6)
        }else if X <= 1199 {
            print(5)
        }else if X <= 1399 {
            print(4)
        }else if X <= 1599 {
            print(3)
        }else if X <= 1799 {
            print(2)
        }else if X <= 1999 {
            print(1)
        }
    }
}
