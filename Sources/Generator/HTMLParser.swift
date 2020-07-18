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

        let inOuts: [Int: InOut] = inputElements.array().reduce([:]) {
            guard let header = try? $1.select("section > h3"),
                let text = try? header.text() else { return $0 }

            if text.contains("入力例"), let last = text.last, let index = Int(String(last)) {
                guard let preText = try? $1.select("section > pre").text() else { return $0 }
                var newResult = $0
                if $0[index] == nil {
                    newResult[index] = InOut(input: preText, output: nil)
                } else {
                    newResult[index]?.input = preText
                }
                return newResult
            } else if text.contains("出力例"), let last = text.last, let index = Int(String(last)) {
                guard let preText = try? $1.select("section > pre").text() else { return $0 }
                var newResult = $0
                if $0[index] == nil {
                    newResult[index] = InOut(input: nil, output: preText)
                } else {
                    newResult[index]?.output = preText
                }
                return newResult
            } else {
                return $0
            }
        }

        return inOuts.map {
            var value = $0.value
            value.index = $0.key
            return value
        }
    }

}
