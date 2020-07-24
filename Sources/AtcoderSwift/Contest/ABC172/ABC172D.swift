import Foundation

class ABC172D: Task {
    typealias Executer = ABC172DTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["4"], outputs: ["23"]),
            (inputs: ["100"], outputs: ["26879"]),
            (inputs: ["10000000"], outputs: ["838627288460105"])
        ]
    }()
}

class ABC172DTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        // O(N)
        func sum(n: Int) -> Int {
            n * (n+1) / 2
        }
        let N = Int(readLine()!)!
        var ans = 0
        for i in 1...N {
            ans += i * sum(n: N/i)
        }
        print(ans)

        // O(N * LogN)
//        let n = Int(readLine()!)!
//        var ans = 0
//        for i in 1...n {
//            for j in stride(from: i, to: n+1, by: i) {
//                ans += j
//            }
//        }
//        print(ans)
    }
}
