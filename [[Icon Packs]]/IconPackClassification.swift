//
//  IconPackClassification.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/8/24.
//

import Foundation

enum IconPackClassification {
    
    case pad1Line
    case pad2Lines
    case padWhole
    
    case phoneLandscape1Line
    case phoneLandscape2Lines
    case phoneLandscape0Lines
    
    case phonePortrait1Line
    case phonePortrait2Lines
    case phonePortrait0Lines
    
    var nameComponent: String {
        switch self {
        case .pad1Line:
            "ipad_1_line"
        case .pad2Lines:
            "ipad_2_lines"
        case .padWhole:
            "ipad_whole"
        case .phoneLandscape1Line:
            "iphone_landscape_1_line"
        case .phoneLandscape2Lines:
            "iphone_landscape_2_lines"
        case .phoneLandscape0Lines:
            "iphone_landscape_whole"
        case .phonePortrait1Line:
            "iphone_portrait_1_line"
        case .phonePortrait2Lines:
            "iphone_portrait_2_lines"
        case .phonePortrait0Lines:
            "iphone_portrait_whole"
        }
    }
    
    var device: TextIconDevice {
        switch self {
        case .pad1Line:
            return .pad
        case .pad2Lines:
            return .pad
        case .padWhole:
            return .pad
        case .phoneLandscape1Line:
            return .phone
        case .phoneLandscape2Lines:
            return .phone
        case .phoneLandscape0Lines:
            return .phone
        case .phonePortrait1Line:
            return .phone
        case .phonePortrait2Lines:
            return .phone
        case .phonePortrait0Lines:
            return .phone
        }
    }
    
    var orientation: Orientation {
        switch self {
        case .pad1Line:
            return .portrait
        case .pad2Lines:
            return .portrait
        case .padWhole:
            return .portrait
        case .phoneLandscape1Line:
            return .landscape
        case .phoneLandscape2Lines:
            return .landscape
        case .phoneLandscape0Lines:
            return .landscape
        case .phonePortrait1Line:
            return .portrait
        case .phonePortrait2Lines:
            return .portrait
        case .phonePortrait0Lines:
            return .portrait
        }
    }
}
