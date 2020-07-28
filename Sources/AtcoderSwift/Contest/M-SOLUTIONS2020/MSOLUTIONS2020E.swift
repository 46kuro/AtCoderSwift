import Foundation

class MSOLUTIONS2020E: Task {
    typealias Executer = MSOLUTIONS2020ETestExecuter

    var inOutList: [(inputs: [String], outputs: [String])] = {
        [
            (inputs: ["3", "1 2 300", "3 3 600", "1 4 800"], outputs: ["2900", "900", "0", "0"]),
            (inputs: ["5", "3 5 400", "5 3 700", "5 5 1000", "5 7 700", "7 5 400"], outputs: ["13800", "1600", "0", "0", "0", "0"]),
            (inputs: ["6", "2 5 1000", "5 2 1100", "5 5 1700", "-2 -5 900", "-5 -2 600", "-5 -5 2200"], outputs: ["26700", "13900", "3200", "1200", "0", "0", "0"]),
            (inputs: ["8", "2 2 286017", "3 1 262355", "2 -2 213815", "1 -3 224435", "-2 -2 136860", "-3 -1 239338", "-2 2 217647", "-1 3 141903"], outputs: ["2576709", "1569381", "868031", "605676", "366338", "141903", "0", "0", "0"])
        ]
    }()
}

class MSOLUTIONS2020ETestExecuter: TestExecuter {

    /// This part will be implemented.
    /// After implementing this method, you will submit this method's logic.
    override func execute() {

    }
}