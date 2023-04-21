//
//  SourceEditorCommand.swift
//  AI Copilot
//
//  Created by Dhamova on 2023-04-20.
//

import Foundation
import XcodeKit

class GenerateFromComment: NSObject, XCSourceEditorCommand {
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void) {
        guard let selection = invocation.buffer.selections.firstObject as? XCSourceTextRange,
              let line = invocation.buffer.lines[selection.start.line] as? String else {
            // Error: No Selection
            return
        }

        isOpenAIAvailableForCommand { available in
            if available {
                openAIRequest(prompt: self.generatePrompt(invocation, line: line)) { code in
                    if let code = getSubstringBetweenBackticks(in: code) {
                        print(code)
                        let codeWithIndentation = code.replacingOccurrences(of: "\n",
                                                                            with: "\n\(indentation(line: line))")
                        invocation.buffer.lines.insert(codeWithIndentation,
                                                       at: selection.start.line + 1)
                    } else {
                        invocation.buffer.lines.insert("\(indentation(line: line))🚨 Error",
                                                       at: selection.start.line + 1)
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

    private func generatePrompt(_ invocation: XCSourceEditorCommandInvocation, line: String) -> String {
        return "In \(getFileType(with: invocation)), generate code from the following comment: \(line)"
    }
}
