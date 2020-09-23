import Foundation

class ABC175D: Task {
    typealias Executer = ABC175DTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["5 2", "2 4 5 1 3", "3 4 -10 -8 8"], outputs: ["8"]),
            (inputs: ["2 3", "2 1", "10 -7"], outputs: ["13"]),
            (inputs: ["3 3", "3 1 2", "-1000 -2000 -3000"], outputs: ["-1000"]),
            (inputs: ["10 58", "9 1 6 7 8 4 3 2 10 5", "695279662 988782657 -119067776 382975538 -151885171 -177220596 -169777795 37619092 389386780 980092719"], outputs: ["29507023469"])
        ]
    }()
}

class ABC175DTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        // Input
        let NK = readLine()!.split(separator: " ").compactMap { Int($0) }
        let PN = readLine()!.split(separator: " ").compactMap { Int($0) }
        let CN = readLine()!.split(separator: " ").compactMap { Int($0) }

        var result = Int.min
        var removedIndexs = [Int: Bool]()
        for i in 0..<NK[0] {
            var graph = [Int]()

            var nextIndex = i
            while removedIndexs[nextIndex] != true {
                graph.append(CN[nextIndex])
                removedIndexs[nextIndex] = true
                nextIndex = PN[nextIndex] - 1
            }

            if graph.isEmpty {
                continue
            }

            let graphSum = graph.reduce(0) { $0 + $1 }

            let mod: Int
            if graphSum > 0 {
                mod = NK[1] % graph.count
            } else {
                mod = NK[1] >= graph.count ? graph.count : NK[1]
            }

            var modMax = graph.max()!
            let doubleArray = graph + graph
            var cumulativeArray = [doubleArray[0]]
            for i in 0..<doubleArray.count-1 {
                cumulativeArray.append(cumulativeArray.last! + doubleArray[i+1])
            }
            for i in 0..<graph.count {
                for j in 1..<mod+1 {
                    modMax = max(modMax, cumulativeArray[i+j] - cumulativeArray[i])
                }
            }

            if graphSum > 0 {
                result = max(result, modMax + graphSum * (NK[1] / graph.count))
            } else {
                result = max(result, modMax)
            }
        }
        print(result)
    }
}
