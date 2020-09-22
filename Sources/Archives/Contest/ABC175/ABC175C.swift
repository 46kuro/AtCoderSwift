//import Foundation

class ABC175C: Task {
    typealias Executer = ABC175CTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["6 2 4"], outputs: ["2"]),
            (inputs: ["7 4 3"], outputs: ["1"]),
            (inputs: ["10 1 2"], outputs: ["8"]),
            (inputs: ["1000000000000000 1000000000000000 1000000000000000"], outputs: ["1000000000000000"]),
            (inputs: ["11 3 3"], outputs: ["2"]),
            (inputs: ["11 4 3"], outputs: ["1"]),
            (inputs: ["11 5 3"], outputs: ["2"]),
            (inputs: ["11 6 3"], outputs: ["1"]),
            (inputs: ["10 3 3"], outputs: ["1"]),
            (inputs: ["10 4 3"], outputs: ["2"]),
            (inputs: ["10 5 3"], outputs: ["1"]),
            (inputs: ["10 6 3"], outputs: ["2"]),
        ]
    }()
}

class ABC175CTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
//        import Foundation

        let XKD = readLine()!.split(separator: " ").compactMap { Int($0) }
        let X = XKD[0]
        let K = XKD[1]
        let D = XKD[2]

        var minValue: Int
        var requiredValue: Int
        if X <= 0 {
            minValue = (-1 * X) % D
            requiredValue = (-1 * X) / D
        } else {
            minValue = X % D
            requiredValue = X / D
        }
        if abs(minValue - D) < minValue {
            minValue = abs(minValue - D)
            requiredValue += 1
        }

        if requiredValue < K {
            let isOdd = (K - requiredValue) % 2 != 0
            if requiredValue % 2 == 0 {
                if isOdd {
                    print(abs(minValue - D))
                } else {
                    print(abs(minValue))
                }
            } else {
                if isOdd {
                    print(abs(minValue - D))
                } else {
                    print(abs(minValue))
                }
            }
        } else {
            if X <= 0 {
                print(abs(X + K * D))
            } else {
                print(abs(X - K * D))
            }
        }
    }
}
