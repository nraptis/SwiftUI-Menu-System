//
//  TextIconConfiguration.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/8/24.
//

import Foundation

enum TextIconConfiguration: UInt8, CustomStringConvertible {
    case whole
    case oneLine
    case twoLine
    var description: String {
        switch self {
        case .whole:
            return "0l"
        case .oneLine:
            return "1l"
        case .twoLine:
            return "2l"
        }
    }
}
