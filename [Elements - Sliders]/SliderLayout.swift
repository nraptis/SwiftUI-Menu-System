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
    
    static func getUniversalPaddingLeft(orientation: Orientation,
                                        flavor: LayoutSchemeFlavor,
                                        squeeze: LayoutSchemeSqueeze,
                                        neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if Device.isPad {
            if neighborTypeLeft == nil {
                switch squeeze {
                case .squeezed:
                    return 2
                case .standard:
                    return 12
                }
            }
        } else {
            if neighborTypeLeft == nil {
                switch squeeze {
                case .squeezed:
                    return 2
                case .standard:
                    return 8
                }
            }
        }
        return 0
    }
    
    static func getUniversalPaddingRight(orientation: Orientation,
                                         flavor: LayoutSchemeFlavor,
                                         squeeze: LayoutSchemeSqueeze,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if Device.isPad {
            if neighborTypeRight == nil {
                switch squeeze {
                case .squeezed:
                    return 3
                case .standard:
                    return 12
                }
            }
            switch squeeze {
            case .squeezed:
                return 3
            case .standard:
                return 6
            }
        } else {
            if neighborTypeRight == nil {
                switch squeeze {
                case .squeezed:
                    return 2
                case .standard:
                    return 8
                }
            }
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 4
            }
        }
    }
    
    static func getUniversalPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        // FINAL
        Device.isPad ? 2 : 1 // FINAL Device.isPad ? 2 : 1
    }
    
    static func getUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        // FINAL
        Device.isPad ? 2 : 1 // FINAL Device.isPad ? 2 : 1
    }
    
    static func getNameLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        12
    }
    
    static func getNameLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 5
        } else {
            return 3
        }
    }
    
    static func getNameLabelPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int { 0 }
    
    static func getValueLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 5
        } else {
            return 3
        }
    }
    
    static func getValueLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    
    static func getIconPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getIconPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getIconPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int { 0 }
    
    static func getPreferredMinimumBarWidth(orientation: Orientation, widthCategory: ToolInterfaceElementSliderWidthCategory) -> Int {
        if Device.isPad {
            switch widthCategory {
            case .fullWidth:
                return 180
            case .halfWidthLeft:
                return 90
            case .halfWidthRight:
                return 90
            }
        } else {
            switch widthCategory {
            case .fullWidth:
                return 140
            case .halfWidthLeft:
                return 70
            case .halfWidthRight:
                return 70
            }
        }
    }
    
    static func getThumbWidth(orientation: Orientation) -> Int {
        if Device.isPad {
            return 44
        } else {
            return 36
        }
    }
    
    static func getThumbHeight(orientation: Orientation) -> Int {
        if Device.isPad {
            return 48 // Final, 48
        } else {
            switch orientation {
            case .landscape:
                return 32
            case .portrait:
                return 36
            }
        }
    }
    
    static func getThumbHitBoxWidth(orientation: Orientation) -> Int {
        if Device.isPad {
            return 72
        } else {
            return 60
        }
    }
    
    static func getThumbInset(orientation: Orientation) -> Int {
        0
    }
    
    static func getBarHeight(orientation: Orientation) -> Int {
        16
    }
    
    static func getThumbCornerRadiusOuter(orientation: Orientation) -> Int {
        if Device.isPad {
            return 12
        } else {
            if orientation.isLandscape {
                return 8
            } else {
                return 10
            }
        }
    }
    
    static func getThumbCornerRadiusInner(orientation: Orientation) -> Int {
        if Device.isPad {
            return 10
        } else {
            if orientation.isLandscape {
                return 7
            } else {
                return 9
            }
        }
    }
    
    static func getThumbLineThickness(orientation: Orientation) -> Int {
        if Device.isPad {
            return 2
        } else {
            return 1
        }
    }
    
    static func getBumperWidth(orientation: Orientation) -> Int {
        if Device.isPad {
            return 6
        } else {
            switch orientation {
            case .landscape:
                return 3
            case .portrait:
                return 4
            }
        }
    }
    
    static func getBumperHeight(orientation: Orientation) -> Int {
        if Device.isPad {
            return 48
        } else {
            switch orientation {
            case .landscape:
                return 3
            case .portrait:
                return 4
            }
        }
    }
    
    static func getBumperCornerRadius(orientation: Orientation) -> Int {
        2
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
