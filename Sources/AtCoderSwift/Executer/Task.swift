import Foundation

struct TaskError: Error {
    var number: Int
    var expectedOutput: String
    var actualOutput: String

    var localizedDescription: String {
        """
        ❌Example\(number) test failed.
        Expected output value is
        \(expectedOutput)
        Actual value is
        \(actualOutput)
        """
    }
}

protocol Task {
    associatedtype Executer: TestExecuter
    var inOutList: [(input: String, output: String)] { get }
    func tests()
}

extension Task {
    func tests() {
        inOutList.enumerated().forEach {
            let result = execute(inOut: $0.element, offset: $0.offset)
            switch result {
            case .success(let time):
                print("✅Example\($0.offset + 1) succeeded. Execution time is \(time)s.")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func execute(inOut: (input: String, output: String), offset: Int) -> Result<Double, TaskError> {
        let startingDate = Date()
        let executer = Executer(input: inOut.input)
        executer.execute()
        if executer.outputs.joined(separator: "\n") != inOut.output {
            return .failure(TaskError(number: offset + 1, expectedOutput: inOut.output, actualOutput: executer.outputs.joined(separator: "\n")))
        } else {
            return .success(Date().timeIntervalSince(startingDate))
        }
    }
}
