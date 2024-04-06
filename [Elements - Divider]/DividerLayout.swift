//
//  DividerLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/29/24.
//

import Foundation
import UIKit

struct DividerLayout {
    
    static func getUniversalPaddingLeft(orientation: Orientation,
                                        flavor: LayoutSchemeFlavor,
                                        squeeze: LayoutSchemeSqueeze,
                                        neighborType: ToolInterfaceElementType?) -> Int {
        // TODO: Replace
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 12
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
            return 24
        }
    }
    
    static func getUniversalPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int { 
        0
    }
    
    static func getUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        0
    }
    
    static func getNameLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getNameLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getNameLabelPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int { 0 }
    static func getNameLabelVerticalSpacing(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int { 0 }
    static func getIconPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getIconPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getIconPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int { 0 }
    
    static func getCapsuleWidth(orientation: Orientation) -> Int {
        if Device.isPad {
            return 4
        } else {
            return 2
        }
    }
    
    static func getCapsuleHeight(orientation: Orientation) -> Int {
        if Device.isPad {
            return 54
        } else {
            switch orientation {
            case .landscape:
                return 34
            case .portrait:
                return 40
            }
        }
    }
    
    static func getMinimumLengthForSpacerDividerSpacerToHaveTwoDividers(orientation: Orientation) -> Int {
        return 12
    }
}
