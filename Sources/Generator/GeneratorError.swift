import Foundation

public enum GeneratorError: Error {
    case urlIsWrong
    case htmlFetch
    case parse
    case styleNotFound
    case fileNotCreated
    case fileAlreadyExist
    case contentDataTransformation
    case fileCreate
}
