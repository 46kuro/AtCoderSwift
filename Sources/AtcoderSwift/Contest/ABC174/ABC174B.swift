import Foundation

class ABC174B: Task {
    typealias Executer = ABC174BTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["4 5", "0 5", "-2 4", "3 4", "4 -4"], outputs: ["3"]),
            (inputs: ["12 3", "1 1", "1 1", "1 1", "1 1", "1 2", "1 3", "2 1", "2 2", "2 3", "3 1", "3 2", "3 3"], outputs: ["7"]),
            (inputs: ["20 100000", "14309 -32939", "-56855 100340", "151364 25430", "103789 -113141", "147404 -136977", "-37006 -30929", "188810 -49557", "13419 70401", "-88280 165170", "-196399 137941", "-176527 -61904", "46659 115261", "-153551 114185", "98784 -6820", "94111 -86268", "-30401 61477", "-55056 7872", "5901 -163796", "138819 -185986", "-69848 -96669"], outputs: ["6"])
        ]
    }()
}

class ABC174BTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let ND = readLine()!.split(separator: " ").compactMap { Int($0) }
        let n = ND[0]
        let d = ND[1]
        let XYN = (1...n).map { _ in readLine()!.split(separator: " ").compactMap { Int($0) } }

        var count = 0
        for i in 0..<XYN.count {
            let x = Double(XYN[i][0])
            let y = Double(XYN[i][1])
            if pow(pow(x, 2) + pow(y, 2), 0.5) <= Double(d) {
                count += 1
            }
        }
        print(count)
    }
}
