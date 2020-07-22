import Foundation

class FileContentCreator {

    func createContent(taskName: String, from inOuts: [InOut]) -> String {
        let inOutStrings: [String] = inOuts.compactMap {
            guard let input = $0.input, let output = $0.output else {
                return nil
            }
            let inputListString = input.split(separator: "\r\n").map { "\"\($0)\"" }.joined(separator: ", ")
            let outputListString = output.split(separator: "\r\n").map { "\"\($0)\"" }.joined(separator: ", ")
            return "(inputs: [\(inputListString)], outputs: [\(outputListString)])"
        }
        let content =
        """
        import Foundation

        class \(taskName): Task {
            typealias Executer = \(taskName)TestExecuter

            var inOutList: [(inputs: [String], outputs: [String])] = {
                [
                    \(inOutStrings.joined(separator: ",\n            "))
                ]
            }()
        }

        class \(taskName)TestExecuter: TestExecuter {

            /// This part will be implemented.
            /// After implementing this method, you will submit this method's logic.
            override func execute() {

            }
        }
        """
        return content
    }
}
