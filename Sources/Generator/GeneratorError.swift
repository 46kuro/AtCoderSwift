import Foundation

public enum GeneratorError: Error {
    case urlIsWrong
    case htmlFetch
    case parse
    case styleNotFound
    case directoryCreate
    case fileAlreadyExist
    case convertContentData
    case fileCreate

    public var localizedDescription: String {
        switch self {
        case .urlIsWrong: return "URL was wrong."
        case .htmlFetch: return "HTML fetch failed."
        case .parse: return "HTML Parse failed."
        case .styleNotFound: return "CSS style could not be found."
        case .directoryCreate: return "Directory could not create."
        case .fileAlreadyExist: return "There was already the same name file."
        case .convertContentData: return "String to data converting error happened."
        case .fileCreate: return "File could not create."
        }
    }
}
