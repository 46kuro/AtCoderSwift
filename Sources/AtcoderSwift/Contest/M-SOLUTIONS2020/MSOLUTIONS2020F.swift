import Foundation

class MSOLUTIONS2020F: Task {
    typealias Executer = MSOLUTIONS2020FTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["2", "11 1 U", "11 47 D"], outputs: ["230"]),
            (inputs: ["4", "20 30 U", "30 20 R", "20 10 D", "10 20 L"], outputs: ["SAFE"]),
            (inputs: ["8", "168 224 U", "130 175 R", "111 198 D", "121 188 L", "201 116 U", "112 121 R", "145 239 D", "185 107 L"], outputs: ["100"])
        ]
    }()
}

class MSOLUTIONS2020FTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        let N = Int(readLine()!)!
        let XYUN: [(x: Int, y: Int, dir: String)] = (1...N).map { _ in
            let xyu = readLine()!.split(separator: " ")
            return (x: Int(xyu[0])!, y: Int(xyu[1])!, dir: String(xyu[2]))
        }

        var dxList = [String: [Int]]()
        var dyList = [String: [Int]]()
        var conflictTimes = [Int]()

        // 同じ座標軸
        for i in 0..<N {
            let tmp = XYUN[i]
            if tmp.dir == "U" || tmp.dir == "D" {
                // Conflict or not
                if tmp.dir == "U" {
                    if let dList = dxList[String(tmp.x) + "D"],
                        let min = dList.filter({ tmp.y < $0 }).min() {
                        conflictTimes.append((min-tmp.y)/2*10)
                    }
                } else {
                    if let uList = dxList[String(tmp.x) + "U"],
                        let min = uList.filter({ tmp.y > $0 }).min() {
                        conflictTimes.append((tmp.y-min)/2*10)
                    }
                }

                // Store
                let key = String(tmp.x) + tmp.dir
                if dxList[key] == nil {
                    dxList[key] = [tmp.y]
                } else {
                    dxList[key]?.append(tmp.y)
                }
            } else {
                // Conflict or not
                if tmp.dir == "R" {
                    if let lList = dyList[String(tmp.y) + "L"],
                        let min = lList.filter({ tmp.x < $0 }).min() {
                        conflictTimes.append((min-tmp.y)/2*10)
                    }
                } else {
                    if let rList = dyList[String(tmp.y) + "R"],
                        let min = rList.filter({ tmp.x > $0 }).min() {
                        conflictTimes.append((tmp.y-min)/2*10)
                    }
                }

                // Store
                let key = String(tmp.y) + tmp.dir
                if dyList[key] == nil {
                    dyList[key] = [tmp.y]
                } else {
                    dyList[key]?.append(tmp.y)
                }
            }
        }

        // 別の座標軸

    }
}
