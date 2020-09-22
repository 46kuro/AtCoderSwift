import Foundation

class ABC177C: Task {
    typealias Executer = ABC177CTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["3", "1 2 3"], outputs: ["11"]),
            (inputs: ["4", "141421356 17320508 22360679 244949"], outputs: ["437235829"])
        ]
    }()
}

class ABC177CTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let N = Int(readLine()!)!
        let AN = readLine()!.split(separator: " ").compactMap { Int($0) }
        let mod = 1000000007

        var sumList: [Int] = []
        for i in 0..<N-1 {
            let element = ((sumList.last ?? 0) + AN[N-i-1]) % mod
            sumList.append(element)
        }

        var result = 0
        for i in 0..<N-1 {
            result += AN[i] * sumList[N-i-2]
            result %= mod
        }
        print(result)
    }
}
