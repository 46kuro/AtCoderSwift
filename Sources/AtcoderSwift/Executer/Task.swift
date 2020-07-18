import Foundation

struct TaskError: Error {
    var index: Int
    var expectedOutputs: [String]
    var actualOutputs: [String]

    var localizedDescription: String {
        """
        ❌Example\(index+1) test failed
        Expected output value is
        \(expectedOutputs)
        Actual value is
        \(actualOutputs)
        """
    }
}

protocol Task {
    associatedtype Executer: TestExecuter
    var inOutList: [(inputs: [String], outputs: [String])] { get }
    func tests()
}

extension Task {
    func tests() {
        let executeResults: [TaskError] = inOutList.enumerated().compactMap {
            let executer = Executer(inputs: $0.element.inputs)
            executer.execute()
            if executer.outputs != $0.element.outputs {
                return TaskError(index: $0.offset, expectedOutputs: $0.element.outputs, actualOutputs: executer.outputs)
            } else {
                return nil
            }
        }

        if executeResults.isEmpty {
            print("✅all test succeeded!")
        } else {
            executeResults.forEach {
                print($0.localizedDescription)
            }
        }
    }
}
