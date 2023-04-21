//
//  Indentation.swift
//  AI Copilot for Xcode
//
//  Created by Dhamova on 2023-04-20.
//

import Foundation

public func indentation(line: String) -> String {
    if let nonWhitespace = line.rangeOfCharacter(from: CharacterSet.whitespaces.inverted) {
        return String(line.prefix(upTo: nonWhitespace.lowerBound))
    } else {
        return ""
    }
}
