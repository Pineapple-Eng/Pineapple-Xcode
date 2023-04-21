// Created by Dhamova on 2023-04-20.

import Foundation
import XcodeKit

class ShortenSelection: NSObject, XCSourceEditorCommand {
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
        guard let selection = invocation.buffer.selections.firstObject as? XCSourceTextRange,
              let startLine = invocation.buffer.lines[selection.start.line] as? String else {
            // Error: No Selection
            return
        }
        let nsRange = NSRange(location: selection.start.line, length: selection.end.line - selection.start.line)
        let selectedLines = invocation.buffer.lines.subarray(with: nsRange)

        var content = ""
        for line in selectedLines {
            if let lineString = line as? String {
                content += lineString
            }
        }

        isOpenAIAvailableForCommand { available in
            if available {
                openAIRequest(prompt: self.generatePrompt(invocation, content: content)) { code in
                    if let code = getSubstringBetweenBackticks(in: code) {
                        print(code)
                        let codeWithIndentation = code.replacingOccurrences(of: "\n",
                                                                            with: "\n\(indentation(line: startLine))")
                        invocation.buffer.lines.removeObjects(at: IndexSet(integersIn: selection.start.line...selection.end.line))
                        invocation.buffer.lines.insert("\(indentation(line: startLine))\(codeWithIndentation)",
                                                       at: selection.start.line)
                    } else {
                        invocation.buffer.lines.insert("\(indentation(line: startLine))🚨 Error",
                                                       at: selection.start.line)
                    }
                    completionHandler(nil)
                }
            } else {
                // Error: OpenAI Not Configured
                openMainApp()
                completionHandler(NSError(domain: "openai-unavailable", code: 500))
            }
        }
    }

    private func generatePrompt(_ invocation: XCSourceEditorCommandInvocation, content: String) -> String {
        return "Refactor the following \(getFileType(with: invocation)) source code to optimize it, make it shorter, and more consice: \(content). Only generate the code, don't include any other text."
    }
}
