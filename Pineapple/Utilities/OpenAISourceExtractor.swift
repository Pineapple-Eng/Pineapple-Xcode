// Created by Dhamova on 2023-04-21.

import Foundation

public func getSubstringBetweenBackticks(in string: String?) -> String? {
    guard let string = string else { return nil }
    guard let startRange = string.range(of: "```"),
          let endRange = string.range(of: "```", range: startRange.upperBound..<string.endIndex)
    else {
        return nil
    }
    
    var result = String(string[startRange.upperBound..<endRange.lowerBound])
    if result.hasPrefix("swift\n") || result.hasPrefix("Swift\n") {
        result = String(result.dropFirst(6))
    }

    return result
}
