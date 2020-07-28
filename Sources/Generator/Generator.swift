import Foundation
import SwiftSoup

public class Generator {

    private let contestName: String
    private let taskName: String
    private let outputURL: URL
    private let html: String?

    public init(contestName: String, taskName: String, outputURL: URL, html: String? = nil) {
        self.contestName = contestName
        self.taskName = taskName
        self.outputURL = outputURL
        self.html = html
    }

    public func generate() throws {
        let upperTaskName = taskName.uppercased().replacingOccurrences(of: "_", with: "")
        let upperContestName = contestName.uppercased()

        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: outputURL.appendingPathComponent(upperContestName).absoluteString) {
            do {
                try fileManager.createDirectory(atPath: outputURL.appendingPathComponent(upperContestName).absoluteString, withIntermediateDirectories: true, attributes: nil)
            } catch {
                throw GeneratorError.directoryCreate
            }
        }

        let outputFilePath = outputURL.appendingPathComponent(upperContestName + "/" + upperTaskName + ".swift").absoluteString
        guard !fileManager.fileExists(atPath: outputFilePath) else {
            throw GeneratorError.fileAlreadyExist
        }

        let parser: HTMLParser
        if let html = html {
            parser = HTMLParser(parseType: .url(URL(fileURLWithPath: html)))
        } else {
            guard let atCoderURL = URL(string: "https://atcoder.jp/contests/\(contestName)/tasks/\(taskName)") else {
                throw GeneratorError.urlIsWrong
            }
            parser = HTMLParser(parseType: .url(atCoderURL))
        }


        let inOuts: [InOut]
        do {
            inOuts = try parser.convertToInOut()
        } catch {
            throw error
        }
        let sortedInOuts = inOuts.sorted { $0.index ?? 0 < $1.index ?? 0 }

        let fileContentCreator = FileContentCreator()
        let content = fileContentCreator.createContent(taskName: upperTaskName, from: sortedInOuts)
        guard let data = content.data(using: .utf8) else {
            throw GeneratorError.convertContentData
        }
        let createFileResult = fileManager.createFile(atPath: outputFilePath, contents: data, attributes: nil)
        if !createFileResult {
            throw GeneratorError.fileCreate
        }
    }
}
