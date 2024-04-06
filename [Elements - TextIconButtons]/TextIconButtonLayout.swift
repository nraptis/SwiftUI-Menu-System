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
                                        neighborType: ToolInterfaceElementType?) -> Int {
        
        // TODO: Replace
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        }
    }
    
    static func getUniversalPaddingRight(orientation: Orientation,
                                         flavor: LayoutSchemeFlavor,
                                         squeeze: LayoutSchemeSqueeze,
                                         neighborType: ToolInterfaceElementType?) -> Int {
        
        // TODO: Replace
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        }
    }
    
    static func getUniversalPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        if Device.isPad {
            return 4
        }
        return 2
    }
    
    static func getUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        if Device.isPad {
            return 4
        }
        return 2
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
        if numberOfLines == 2 {
            return 2
        } else {
            return 4
        }
    }
    
    static func getNameLabelVerticalSpacing(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int {
        if Device.isPhone {
            if flavor.isStacked {
                return -3
            }
        }
        if Device.isPad {
            if flavor.isStacked {
                return -4
            }
        }
        return -2
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
}
