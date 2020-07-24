import Foundation

struct TaskError: Error {
    var number: Int
    var expectedOutputs: [String]
    var actualOutputs: [String]

    var localizedDescription: String {
        """
        ❌Example\(number) test failed.
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

    private func execute(inOut: (inputs: [String], outputs: [String]), offset: Int) -> Result<Double, TaskError> {
        let startingDate = Date()
        let executer = Executer(inputs: inOut.inputs)
        executer.execute()
        if executer.outputs != inOut.outputs {
            return .failure(TaskError(number: offset + 1, expectedOutputs: inOut.outputs, actualOutputs: executer.outputs))
        } else {
            return .success(Date().timeIntervalSince(startingDate))
        }
    }
}
