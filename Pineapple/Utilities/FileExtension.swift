// Created by Dhamova on 2023-04-20.

import Foundation
import XcodeKit

/// https://developer.apple.com/documentation/uniformtypeidentifiers/system-declared_uniform_type_identifiers#3590516
enum FileType: String {
    case assembly = "Assembly"
    case c_header = "C Header"
    case c_source = "C Source"
    case c_plus_plus_header = "C++ Header"
    case c_plus_plus_source = "C++ Source"
    case objective_c = "Objective-C"
    case objective_c_plus_plus = "Objective-C++"
    case swift = "Swift"
}

func getFileType(with invocation: XCSourceEditorCommandInvocation) -> FileType {
    let fileExtension = invocation.buffer.contentUTI
    switch fileExtension {
    case "public.assembly-language-source":
        return .assembly
    case "public.c-header":
        return .c_header
    case "public.c-source":
        return .c_source
    case "public.c-plus-plus-header":
        return .c_plus_plus_header
    case "public.c-plus-plus-source":
        return .c_plus_plus_source
    case "public.objective-c-source":
        return .objective_c
    case "public.objective-c-plus-plus-source":
        return .objective_c_plus_plus
    case "public.swift-source":
        return .swift
    default:
        return .swift
    }
}
