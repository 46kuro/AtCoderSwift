import Foundation

class TestExecuter {
    var isMocked: Bool = true
    var inputs: [String]
    var readLineIndex: Int = 0
    var outputs: [String] = []

    required init(inputs: [String]) {
        self.inputs = inputs
    }

    func readLine() -> String? {
        if isMocked {
            readLineIndex += 1
            return inputs[readLineIndex-1]
        } else {
            return Swift.readLine()
        }
    }

    func print(_ any: Any) {
        if isMocked {
            outputs.append(String(describing: any))
        } else {
            Swift.print(any)
        }
    }

    func execute() {

    }
}
