import Foundation

class ABC176E: Task {
    typealias Executer = ABC176ETestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["2 3 3", "2 2", "1 1", "1 3"], outputs: ["3"]),
            (inputs: ["3 3 4", "3 3", "3 1", "1 1", "1 2"], outputs: ["3"]),
            (inputs: ["5 5 10", "2 5", "4 3", "2 3", "5 5", "2 2", "5 4", "5 3", "5 1", "3 5", "1 4"], outputs: ["6"])
        ]
    }()
}

class ABC176ETestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let HWM = readLine()!.split(separator: " ").compactMap { Int($0) }
        let H = HWM[0]
        let W = HWM[1]
        let M = HWM[2]
        let list: [(Int, Int)] = (1...M)
            .map { _ in
                let tmp = readLine()!.split(separator: " ").compactMap { Int($0) }
                return (tmp[0]-1, tmp[1]-1)
            }

        var hCounts = Array(repeating: 0, count: H)
        var wCounts = Array(repeating: 0, count: W)
        var indexes = [String: Bool]()
        list.forEach {
            hCounts[$0.0] += 1
            wCounts[$0.1] += 1
            indexes["\($0.0),\($0.1)"] = true
        }
        let hMax = hCounts.max()!
        let wMax = wCounts.max()!

        var hMaxIndexes = [Int]()
        for i in 0..<hCounts.count {
            if hCounts[i] == hMax {
                hMaxIndexes.append(i)
            }
        }
        var wMaxIndexes = [Int]()
        for i in 0..<wCounts.count {
            if wCounts[i] == wMax {
                wMaxIndexes.append(i)
            }
        }

        var isExist = false
        for i in hMaxIndexes {
            for j in wMaxIndexes {
                if indexes["\(i),\(j)"] != true {
                    isExist = true
                    break
                }
            }
        }

        print(isExist ? hMax+wMax : hMax+wMax-1)
    }
}
