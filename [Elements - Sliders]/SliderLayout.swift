//
//  SliderLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/30/24.
//

import Foundation
import UIKit

// On Landscape, iPhone, the Max Icon Size = "18" (For 2 Lines)
// On Landscape, iPhone, the Max Icon Size = "28" (For 1 Lines)

// On iPad, the Max Icon Size = "22" (For 2 Lines)
// On iPad, the Max Icon Size = "36" (For 1 Lines)

struct SliderLayout: LayoutScheme {
    
    static func getValueLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        if Device.isPad {
            switch flavor {
            case .long:
                return UIFont.systemFont(ofSize: 14.0, weight: .bold)
            case .stackedLarge:
                return UIFont.systemFont(ofSize: 14.0, weight: .bold)
            case .stackedMedium:
                return UIFont.systemFont(ofSize: 14.0, weight: .bold, width: .condensed)
            case .stackedSmall:
                return UIFont.systemFont(ofSize: 14.0, weight: .bold, width: .compressed)
            }
        } else {
            switch orientation {
            case .landscape:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 10.0, weight: .bold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 10.0, weight: .bold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 10.0, weight: .bold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 10.0, weight: .bold, width: .compressed)
                }
            case .portrait:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 11.0, weight: .bold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 11.0, weight: .bold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 11.0, weight: .bold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 11.0, weight: .bold, width: .compressed)
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
            return 6
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
        Device.isPad ? 2 : 1
    }
    
    static func getUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        Device.isPad ? 2 : 1
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
        return 0
    }
    
    static func getValueLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        // TODO: Replace
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        }
    }
    
    static func getValueLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        // TODO: Replace
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        }
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
    
    
    static func getPreferredMinimumBarWidth(orientation: Orientation, widthCategory: ToolInterfaceElementSliderWidthCategory) -> Int {
        if Device.isPad {
            switch widthCategory {
            case .fullWidth:
                return 300
            case .halfWidthLeft:
                return 150
            case .halfWidthRight:
                return 150
            }
        } else {
            switch widthCategory {
            case .fullWidth:
                return 200
            case .halfWidthLeft:
                return 100
            case .halfWidthRight:
                return 100
            }
        }
    }
    
    static func getThumbCircleSize(orientation: Orientation) -> Int {
        if Device.isPad {
            return 28
        } else {
            return 22
        }
    }
    
    static func getThumbHitBoxWidth(orientation: Orientation) -> Int {
        if Device.isPad {
            return 60
        } else {
            return 56
        }
    }
}

extension SliderLayout {
    
    static func getValueLabelLineHeight(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int {
        let font = getValueLabelFont(orientation: orientation, flavor: flavor)
        let lineHeight = Int(font.lineHeight + 1.5)
        return lineHeight
    }
    
    static func getValueLabelTextWidth(line1: String?,
                                       line2: String?,
                                       orientation: Orientation,
                                       flavor: LayoutSchemeFlavor) -> Int {
        let font = Self.getValueLabelFont(orientation: orientation, flavor: flavor)
        return ToolInterfaceTheme.getTextWidth(line1: line1, line2: line2, font: font)
    }
    
    static func getValueLabelTextWidth(line1: String?,
                                       orientation: Orientation,
                                       flavor: LayoutSchemeFlavor) -> Int {
        let font = Self.getValueLabelFont(orientation: orientation, flavor: flavor)
        return ToolInterfaceTheme.getTextWidth(line1: line1, font: font)
    }
}
