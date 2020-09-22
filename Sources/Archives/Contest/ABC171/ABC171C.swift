import Foundation

class ABC171C: Task {
    typealias Executer = ABC171CTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["2"], outputs: ["b"]),
            (inputs: ["27"], outputs: ["aa"]),
            (inputs: ["123456789"], outputs: ["jjddja"])
        ]
    }()
}

class ABC171CTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let N = Int(readLine()!)!
        let atoz = Array("abcdefghijklmnopqrstuvwxyz")
        var n = N
        var result = ""
        while n > 0 {
            result += String(atoz[(n-1)%26])
            n = Int((n-1) / 26)
        }
        print(String(result.reversed()))
    }
}
