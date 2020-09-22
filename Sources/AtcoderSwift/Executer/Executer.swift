import Foundation

class TestExecuter {
    var inputs: [String]
    var readLineIndex: Int = 0
    var outputs: [String] = []

    required init(inputs: [String]) {
        self.inputs = inputs
    }

    func readLine() -> String? {
        readLineIndex += 1
        return inputs[readLineIndex-1]
    }

    func print(_ any: Any) {
        outputs.append(String(describing: any))
    }

    func execute() { }
}
