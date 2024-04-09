//
//  SegmentedPickerLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/1/24.
//

import Foundation
import UIKit

// On Landscape, iPhone, the Max Icon Size = "??" (For 2 Lines)
// On Landscape, iPhone, the Max Icon Size = "??" (For 1 Lines)

// On iPad, the Max Icon Size = "??" (For 2 Lines)
// On iPad, the Max Icon Size = "??" (For 1 Lines)

enum SegmentedPickerPosition {
    case bookendLeft
    case middle
    case bookendRight
}

struct SegmentedPickerLayout: LayoutScheme {
    
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        if Device.isPad {
            switch flavor {
            case .long:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold)
            case .stackedLarge:
                return UIFont.systemFont(ofSize: 13.0, weight: .semibold)
            case .stackedMedium:
                return UIFont.systemFont(ofSize: 13.0, weight: .semibold, width: .condensed)
            case .stackedSmall:
                return UIFont.systemFont(ofSize: 13.0, weight: .semibold, width: .compressed)
            }
        } else {
            switch orientation {
            case .landscape:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 9.0, weight: .semibold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 9.0, weight: .semibold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 9.0, weight: .semibold, width: .compressed)
                }
            case .portrait:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold, width: .compressed)
                }
            }
        }
    }
    
    static func getUniversalPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze, neighborType: ToolInterfaceElementType?) -> Int {
        // TODO: Replace
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 12
        }
    }
    
    static func getUniversalPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze, neighborType: ToolInterfaceElementType?) -> Int {
        // TODO: Replace
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        }
    }
    
    static func getUniversalPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        Device.isPad ? 3 : 2
    }
    
    static func getUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        Device.isPad ? 3 : 2
    }
    
    static func getButtonUniversalPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        // TODO: Replace
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        }
    }
    
    static func getButtonUniversalPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        // TODO: Replace
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 12
        }
    }
    
    static func getButtonUniversalPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        if numberOfLines == 2 {
            return 2
        } else {
            return 4
        }
    }
    
    static func getButtonUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        if numberOfLines == 2 {
            return 2
        } else {
            return 4
        }
    }
    
    static func getNameLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        // TODO: Replace
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        }
    }
    
    static func getNameLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        // TODO: Replace
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        }
    }
    
    static func getNameLabelPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        if Device.isPad {
            return 2
        }
        
        return 0
    }
    
    static func getIconPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        // TODO: Replace
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        }
    }
    
    static func getIconPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        // TODO: Replace
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        }
    }
    
    static func getIconPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        if numberOfLines == 2 {
            return 2
        } else {
            return 4
        }
    }
    
    static func getCornerRadiusOuter(orientation: Orientation) -> Int {
        return 14
    }
    
    static func getCornerRadiusInner(orientation: Orientation) -> Int {
        return 13
    }
    
    static func getLineThickness(orientation: Orientation) -> Int {
        return 2
    }
}
