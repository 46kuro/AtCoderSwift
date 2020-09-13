import Foundation

class ABC177D: Task {
    typealias Executer = ABC177DTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["5 3", "1 2", "3 4", "5 1"], outputs: ["3"]),
            (inputs: ["4 10", "1 2", "2 1", "1 2", "2 1", "1 2", "1 3", "1 4", "2 3", "2 4", "3 4"], outputs: ["4"]),
            (inputs: ["10 4", "3 1", "4 1", "5 9", "2 6"], outputs: ["3"]),
            (inputs: ["5 4", "1 2", "2 3", "4 5", "1 4",], outputs: ["5"]),
            (inputs: ["10 0"], outputs: ["1"]),
            (inputs: ["10 1", "3 1"], outputs: ["2"]),
        ]
    }()
}

class ABC177DTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let NM = readLine()!.split(separator: " ").compactMap { Int($0) }
        let m = NM[1]

        let ABM = (0..<m).map { _ in readLine()!.split(separator: " ").compactMap { Int($0) } }

        var arrayDic = [Int: Int]()
        var circle = [[Int]]()
        for i in 0..<m {
            let ai = ABM[i][0]
            let bi = ABM[i][1]
            if arrayDic[ai] == nil && arrayDic[bi] == nil {
                circle.append([ai, bi])
                arrayDic[ai] = circle.count-1
                arrayDic[bi] = circle.count-1
            } else if let index = arrayDic[ai], arrayDic[bi] == nil {
                circle[index].append(bi)
                arrayDic[bi] = index
            } else if let index = arrayDic[bi], arrayDic[ai] == nil {
                circle[index].append(ai)
                arrayDic[ai] = index
            } else if let aIndex = arrayDic[ai], let bIndex = arrayDic[bi] {
                if aIndex == bIndex { continue }

                let maxIndex = circle[aIndex].count > circle[bIndex].count ? aIndex : bIndex
                let minIndex = circle[aIndex].count > circle[bIndex].count ? bIndex : aIndex

                for element in circle[minIndex] {
                    arrayDic[element] = maxIndex
                }
                circle[maxIndex].append(contentsOf: circle[minIndex])
            }
        }

        let result = circle.reduce(0, { max($0, $1.count) })
        print(result > 0 ? result : 1)
    }
}
