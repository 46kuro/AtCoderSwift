import Foundation

class ABC176B: Task {
    typealias Executer = ABC176BTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["123456789"], outputs: ["Yes"]),
            (inputs: ["0"], outputs: ["Yes"]),
            (inputs: ["31415926535897932384626433832795028841971693993751058209749445923078164062862089986280"], outputs: ["No"])
        ]
    }()
}

class ABC176BTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        print(Array(readLine()!).reduce(0) { $0 + Int(String($1))! } % 9 == 0 ? "Yes" : "No")
    }
}
