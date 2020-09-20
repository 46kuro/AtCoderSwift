import Foundation

class ABC179E: Task {
    typealias Executer = ABC179ETestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["6 2 1001"], outputs: ["1369"]),
            (inputs: ["1000 2 16"], outputs: ["6"]),
            (inputs: ["10000000000 10 99959"], outputs: ["492443256176507"]),
        ]
    }()
}

class ABC179ETestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let hoge = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = hoge[0]
        let x = hoge[1]
        let m = hoge[2]

        var pointers = [Int: Int]()
        var array: [Int] = [x]
        var cycle: (Int, Int)? = nil
        for i in 0..<n-1 {
            let ai = (array.last! * array.last!) % m
            array.append(ai)

            // To be 0
            if ai == 0 {
                break
            }

            // To be cycle
            if let element = pointers[ai] {
                cycle = (element, array.count)
                break
            } else {
                pointers[ai] = array.count
            }
        }

        if let cycle = cycle {
            let firstValue = array[0..<cycle.0].reduce(0) { $0 + $1 }

            let repeatCount = (n - cycle.0) / (cycle.1 - cycle.0)
            let repeatValue = array[cycle.0..<cycle.1].reduce(0) { $0 + $1 } * repeatCount

            let lastCount = (n - cycle.0) % (cycle.1 - cycle.0)
            let lastValue = array[cycle.0..<(cycle.0 + lastCount)].reduce(0) { $0 + $1 }

            print(firstValue + repeatValue + lastValue)
        } else {
            print(array.reduce(0, { $0 + $1 }))
        }
    }
}
