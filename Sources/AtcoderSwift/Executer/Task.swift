import Foundation

struct TaskError: Error {
    var index: Int
    var expectedOutput: String
    var actualOutput: String

    var localizedDescription: String {
        """
        ❌Example\(index+1) test failed
        Expected output value is
        \(expectedOutput)
        Actual value is
        \(actualOutput)
        """
    }
}

protocol Task {
    associatedtype Executer: TestExecuter
    var inOutList: [(inputs: [String], output: String)] { get }
    func tests()
}

extension Task {
    func tests() {
        let executeResults: [TaskError] = inOutList.enumerated().compactMap {
            let executer = Executer(inputs: $0.element.inputs)
            executer.execute()
            if executer.output != $0.element.output {
                return TaskError(index: $0.offset, expectedOutput: $0.element.output, actualOutput: executer.output)
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
