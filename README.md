## AtCoderSwift

This project is resolving [AtCoder](https://atcoder.jp/) tasks with Swift.

### Goal

* Attend to [AtCoder](https://atcoder.jp/) and enjoy it
* Concentrate with logics
  * Less boilerplate code 
  * Minimize manipulating

### Tools

#### AtCoderSwiftGenerator

In this project, `AtCoderSwiftGenerator` is used to automate inputs/outputs.

This tool scrapes AtCoder tasks website, parses HTML and coverts to Swift code.

To parse HTML, I use the [SwiftSoup](https://github.com/scinfu/SwiftSoup.git).

##### Usage

You just execute such as below command. If you generate xcodeproj, you can run in the Xcode.  
```sh
$swift run AtCoderSwiftGenerator --contest {contest name(ex. abc173)} --task {task name(ex. a)} --output {path to your output root directory}
```
