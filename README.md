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

You just execute such as below command.  
```sh
$swift run AtCoderSwiftGenerator --contest {contest name(ex. abc173)} --task {task name(ex. a)} --output {path to your output root directory}
```

If you would like to generate xcodeproj, you may run in the Xcode after running above script.
```sh
$swift package generate-xcodeproj
```

You can also use following scripts. `generate.sh` is running above generating code, generating xcodeproj and open Xcode. 
```sh
$./generate.sh -c {contest name(ex. abc173)} -t {task name(ex. a)}
```
