import Foundation

class ABC176D: Task {
    typealias Executer = ABC176DTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["4 4", "1 1", "4 4", "..#.", "..#.", ".#..", ".#.."], outputs: ["1"]),
            (inputs: ["4 4", "1 4", "4 1", ".##.", "####", "####", ".##."], outputs: ["-1"]),
            (inputs: ["4 4", "2 2", "3 3", "....", "....", "....", "...."], outputs: ["0"]),
            (inputs: ["4 5", "1 2", "2 5", "#.###", "####.", "#..##", "#..##"], outputs: ["2"])
        ]
    }()
}

class ABC176DTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let HW = readLine()!.split(separator: " ").compactMap { Int($0) }
        let h = HW[0]
        let w = HW[1]

        let C = readLine()!.split(separator: " ").compactMap { Int($0) }
        let ch = C[0]-1
        let cw = C[1]-1

        let D = readLine()!.split(separator: " ").compactMap { Int($0) }
        let dh = D[0]-1
        let dw = D[1]-1

        var shw = (1...h).map { _ in Array(readLine()!) }

        var queue: [[(Int, Int)]] = Array(repeating: [], count: 1000000)
        var currentResult: Int = 0
        var isExist = false

        func isDot(i: Int, j: Int) -> Bool {
            if i < 0 || shw.count <= i { return false }
            if j < 0 || shw[i].count <= j { return false }
            return shw[i][j] == "."
        }

        func search(i: Int, j: Int) {
            for idot in i-2...i+2 {
                for jdot in j-2...j+2 {
                    if idot == i && jdot == j { continue }

                    if isDot(i: idot, j: jdot) {
                        if ((idot == i - 1 || idot == i + 1) && jdot == j) || ((jdot == j - 1 || jdot == j + 1) && idot == i) {
                            queue[currentResult].append((idot, jdot))
                        } else {
                            queue[currentResult+1].append((idot, jdot))
                        }
                    }
                }
            }
            shw[i][j] = "#"
        }

        search(i: ch, j: cw)
        if queue[currentResult].isEmpty {
            currentResult += 1
        }
        while !queue[currentResult].isEmpty {
            let element = queue[currentResult].popLast()!

            if element.0 == dh && element.1 == dw {
                isExist = true
                break
            }

            if isDot(i: element.0, j: element.1) {
                search(i: element.0, j: element.1)
            }

            if queue[currentResult].isEmpty {
                currentResult += 1
            }
        }
        print(isExist ? currentResult : -1)
    }
}
