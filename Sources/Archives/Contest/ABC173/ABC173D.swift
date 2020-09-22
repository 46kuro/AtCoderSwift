import Foundation

class ABC173D: Task {
    typealias Executer = ABC173DTestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["4", "2 2 1 3"], outputs: ["7"]),
            (inputs: ["7", "1 1 1 1 1 1 1"], outputs: ["6"]),
            (inputs: ["9", "1 2 3 4 5 6 7 8 9"], outputs: ["56"])
        ]
    }()
}

class ABC173DTestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {
        /// References:
        /// - https://www.geeksforgeeks.org/construct-complete-binary-tree-given-array/
        /// - https://github.com/raywenderlich/swift-algorithm-club/tree/master/Binary%20Tree
        indirect enum BinaryTree {
            case node(BinaryTree, Int, BinaryTree)
            case empty

            init(array: [Int]) {
                guard !array.isEmpty else {
                    self = .empty
                    return
                }
                self = .node(
                    .init(array: array, index: 1, depth: 1),
                    array[0],
                    .init(array: array, index: 2, depth: 1)
                )
            }

            private init(array: [Int], index: Int, depth: Int) {
                if index >= array.count {
                    self = .empty
                    return
                }
                self = .node(
                    .init(array: array, index: index * 2 + 1, depth: depth+1),
                    array[index],
                    .init(array: array, index: index * 2 + 2, depth: depth+1)
                )
            }

            func count() -> Int {
                switch self {
                case .node(let left, let value, let right):
                    var count = 0
                    if case .node = left {
                        count += value + left.count()
                    }
                    if case .node = right {
                        count += value + right.count()
                    }
                    return count
                case .empty:
                    return 0
                }
            }
         }

        _ = readLine()!
        var AN = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted(by: { $0 > $1 })
        let first = AN[0]
        AN.removeFirst()
        let binaryTree = BinaryTree(array: AN)
        print(first + binaryTree.count())
    }
}
