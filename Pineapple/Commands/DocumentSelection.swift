//
//  DocumentSelection.swift
//  AI Copilot for Xcode
//
//  Created by Dhamova on 2023-04-20.
//

import Foundation
import XcodeKit

class DocumentSelection: NSObject, XCSourceEditorCommand {
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
                    if let code = code {
                        print(code)
                        let codeWithIndentation = code.replacingOccurrences(of: "\n",
                                                                            with: "\n\(indentation(line: startLine))")
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
        return "Generate code documentation for the following \(getFileType(with: invocation)) source code: \(content). Only generate the documentation, don't include the source code again"
    }
}
