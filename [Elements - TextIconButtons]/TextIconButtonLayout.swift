//
//  TextIconButtonLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/26/24.
//

import Foundation
import UIKit

// On Landscape, iPhone, the Max Icon Size = "16" (For 2 Lines)
// On Landscape, iPhone, the Max Icon Size = "26" (For 1 Lines)

// On iPad, the Max Icon Size = "22" (For 2 Lines)
// On iPad, the Max Icon Size = "36" (For 1 Lines)

struct TextIconButtonLayout: LayoutScheme {
    
    static func getUniversalPaddingLeft(orientation: Orientation,
                                        flavor: LayoutSchemeFlavor,
                                        squeeze: LayoutSchemeSqueeze,
                                        neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> Int {
        
        if neighborTypeLeft == nil && neighborTypeRight == nil {
            return 0
        }
        
        if neighborTypeLeft == .spacer && neighborTypeRight == .spacer {
            return 0
        }
        
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
        
        if neighborTypeLeft == nil && neighborTypeRight == nil {
            return 0
        }
        
        if neighborTypeLeft == .spacer && neighborTypeRight == .spacer {
            return 0
        }
        
        if Device.isPad {
            if neighborTypeRight == nil {
                switch squeeze {
                case .squeezed:
                    return 3
                case .standard:
                    return 12
                }
            }
            if neighborTypeRight == .textIconButton || neighborTypeRight == .iconButton {
                let separatorWidth = getSeparatorWidth(orientation: orientation)
                switch squeeze {
                case .squeezed:
                    return separatorWidth + (3 + 3)
                case .standard:
                    return separatorWidth + (6 + 6)
                }
            } else {
                switch squeeze {
                case .squeezed:
                    return 3
                case .standard:
                    return 6
                }
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
            if neighborTypeRight == .textIconButton || neighborTypeRight == .iconButton {
                let separatorWidth = getSeparatorWidth(orientation: orientation)
                switch squeeze {
                case .squeezed:
                    return separatorWidth + (2 + 2)
                case .standard:
                    return separatorWidth + (4 + 4)
                }
            } else {
                switch squeeze {
                case .squeezed:
                    return 2
                case .standard:
                    return 4
                }
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
        
        
        return 0
    }
    
    static func getNameLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        return 0
    }
    
    static func getNameLabelPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        // FINAL
        return 0
    }
    
    static func getIconPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        return 0
    }
    static func getIconPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            if flavor.isLong {
                return 5
            }
        } else {
            if flavor.isLong {
                return 3
            }
        }
        return 0
    }
    
    static func getIconPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        if flavor.isStacked {
            return 2 // Final, 2
        }
        return 0
    }
    
    static func getSeparatorWidth(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getSeparatorHeight(orientation: Orientation) -> Int {
        if Device.isPad {
            return 54 - 8
        } else {
            switch orientation {
            case .landscape:
                return 34 - 6
            case .portrait:
                return 40 - 6
            }
        }
    }
    
}
