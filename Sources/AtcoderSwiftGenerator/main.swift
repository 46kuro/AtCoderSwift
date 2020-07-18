import Commander
import Foundation
import Generator

command(
    Option<String?>("contest", default: nil, description: "Contest name(ex.abc173)"),
    Option<String?>("task", default: nil, description: "Task name(ex. a,b,c)"),
    Option<String?>("output", default: nil, description: "Output root path")
) { contest, task, output in
    guard let contest = contest else {
        print("Please type contest name.")
        return
    }
    guard let tasks = task?
        .trimmingCharacters(in: .whitespaces)
        .split(separator: ",")
        .map({ String($0) }) else {
            print("Please type task name.")
            return
    }
    guard let output = output, let outputURL = URL(string: output) else {
        print("Please type output path correctly.")
        return
    }

    tasks.forEach {
        let taskName = "\(contest)_\($0)"
        let generator = Generator(contestName: contest, taskName: taskName, outputURL: outputURL)
        do {
            try generator.generate()
            print("Generate \(taskName) file!")
        } catch {
            print((error as! GeneratorError).localizedDescription)
        }
    }
}.run()
