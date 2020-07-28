import Foundation
import SwiftSoup

class HTMLParser {

    enum ParseType {
        case url(URL)
        case html(String)
    }
    
    private let parseType: ParseType

    init(parseType: ParseType) {
        self.parseType = parseType
    }

    func convertToInOut() throws -> [InOut] {
        let html: String
        switch parseType {
        case .url(let url):
            do {
                html = try String(contentsOf: url)
            } catch {
                throw GeneratorError.htmlFetch
            }
        case .html(let htmlString):
            html = htmlString
        }

        let document: Document
        do {
            document = try SwiftSoup.parse(html)
        } catch {
            throw GeneratorError.parse
        }

        let inputElements: Elements
        do {
            inputElements = try document.select("#task-statement > span > span.lang-ja > div")
        } catch {
            throw GeneratorError.styleNotFound
        }

        return inputElements.array().reduce([]) {
            guard let header = try? $1.select("section > h3"),
                let text = try? header.text() else { return $0 }

            let index = $0.count + 1
            if text.contains("入力例") {
                guard let preText = try? $1.select("section > pre").text() else { return $0 }
                var newResult = $0
                newResult.append(InOut(index: index, input: preText, output: nil))
                return newResult
            } else if text.contains("出力例") {
                guard let preText = try? $1.select("section > pre").text() else { return $0 }
                var newResult = $0
                newResult[$0.count-1].output = preText
                return newResult
            } else {
                return $0
            }
        }
    }

}
