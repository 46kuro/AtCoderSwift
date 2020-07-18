import Commander
import Foundation
import Generator

command(
    Option<String?>("contest", default: nil, description: "Contest name(ex.abc173)"),
    Option<String?>("task", default: nil, description: "Task name(ex. a)"),
    Option<String?>("output", default: nil, description: "Output root path")
) { contest, task, output in
    guard let contest = contest else {
        print("Please type contest name.")
        return
    }
    guard let task = task else {
        print("Please type task name.")
        return
    }
    let taskName = "\(contest)_\(task)"
    guard let output = output, let outputURL = URL(string: output) else {
        print("Please type output path correctly.")
        return
    }

    let generator = Generator(contestName: contest, taskName: taskName, outputURL: outputURL)
    do {
        try generator.generate()
    } catch {
        print(error.localizedDescription)
    }
}.run()
