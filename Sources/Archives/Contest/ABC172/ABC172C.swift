import Foundation

class ABC172C: Task {
    typealias Executer = ABC172CTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["3 4 240", "60 90 120", "80 150 80 150"], outputs: ["3"]),
            (inputs: ["3 4 730", "60 90 120", "80 150 80 150"], outputs: ["7"]),
            (inputs: ["5 4 1", "1000000000 1000000000 1000000000 1000000000 1000000000", "1000000000 1000000000 1000000000 1000000000"], outputs: ["0"])
        ]
    }()
}

class ABC172CTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let NMK = readLine()!.split(separator: " ").compactMap { Int($0) }
        let k = NMK[2]
        let AN = readLine()!.split(separator: " ").compactMap { Int($0) }
        let BM = readLine()!.split(separator: " ").compactMap { Int($0) }

        // This process came TLE when use reduce
//        let sumAN: [Int] = AN.reduce([0]) { $0 + [($0.last ?? 0) + $1] }
//        let sumBM = BM.reduce([0]) { $0 + [($0.last ?? 0) + $1] }
        // - When use reduce
//        func reduceSum(array: [Int]) -> [Int] {
//            return array.reduce([0]) { $0 + [($0.last ?? 0) + $1] }
//        }
        // count=100: 0.0006959438323974609
        // count=1000: 0.0016939640045166016
        // count=10000: 0.030866026878356934
        // count=100000: 1.5615789890289307
        // - When use for
//        func forSum(array: [Int]) -> [Int] {
//            var sumArray: [Int] = [0]
//            for i in 0..<array.count {
//                sumArray.append(sumArray[i] + array[i])
//            }
//            return sumArray
//        }
        // count=100: 0.0002149343490600586
        // count=1000: 0.0011889934539794922
        // count=10000: 0.008144974708557129
        // count=100000: 0.06406009197235107

        var sumAN: [Int] = [0]
        for i in 0..<AN.count {
            sumAN.append(sumAN[i] + AN[i])
        }
        var sumBM: [Int] = [0]
        for i in 0..<BM.count {
            sumBM.append(sumBM[i] + BM[i])
        }

        var bIndex = sumBM.count - 1

        // Caluculate maximized count on each sumA
        let maxCountList = sumAN.enumerated().map { sumA -> Int in
            while sumA.element + sumBM[bIndex] > k {
                if bIndex == 0 {
                    return 0
                } else {
                    bIndex -= 1
                }
            }
            return sumA.offset + bIndex
        }
        print(maxCountList.max() ?? 0)
    }
}
