import Foundation

class ABC172A: Task {
    typealias Executer = ABC172ATestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["2"], outputs: ["14"]),
            (inputs: ["10"], outputs: ["1110"])
        ]
    }()
}

class ABC172ATestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
//        import Foundation
        let a = Int(readLine()!)!
        print(a + Int(truncating: pow(Decimal(a), 2) as NSDecimalNumber) + Int(truncating: pow(Decimal(a), 3) as NSDecimalNumber))
    }
}
