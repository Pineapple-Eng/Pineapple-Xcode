//
//  SourceEditorExtension.swift
//  AI Copilot
//
//  Created by Dhamova on 2023-04-20.
//

import Foundation
import XcodeKit

class SourceEditorExtension: NSObject, XCSourceEditorExtension {
    func extensionDidFinishLaunching() {
        // If your extension needs to do any work at launch, implement this optional method.
        initPython()
    }
    
    /*
    var commandDefinitions: [[XCSourceEditorCommandDefinitionKey: Any]] {
        // If your extension needs to return a collection of command definitions that differs from those in its Info.plist, implement this optional property getter.
        return []
    }
    */
}
