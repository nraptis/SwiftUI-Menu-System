//
//  IconButtonLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation

struct IconButtonLayout: LayoutScheme {
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
    
    static func getNameLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    
    static func getNameLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    
    static func getNameLabelPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int { 0 }
    
    static func getNameLabelVerticalSpacing(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int { 0 }
    
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
    
    static func getIconWidthWithUniversalPadding(textIconImagePack: TextIconImagePack,
                                                 orientation: Orientation,
                                                 squeeze: LayoutSchemeSqueeze,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> Int {
        let univarsalPaddingLeft = getUniversalPaddingLeft(orientation: orientation,
                                                           flavor: .long,
                                                           squeeze: squeeze,
                                                           neighborType: neighborTypeLeft)
        let univarsalPaddingRight = getUniversalPaddingRight(orientation: orientation,
                                                             flavor: .long,
                                                             squeeze: squeeze,
                                                             neighborType: neighborTypeRight)
        var result = getIconWidth(textIconImagePack: textIconImagePack,
                                  orientation: orientation,
                                  squeeze: squeeze)
        result += univarsalPaddingLeft
        result += univarsalPaddingRight
        return result
    }
    
    static func getIconWidth(textIconImagePack: TextIconImagePack,
                             orientation: Orientation,
                             squeeze: LayoutSchemeSqueeze) -> Int {
        let icon = ToolInterfaceImageLibrary.getTextIcon(numberOfLines: 1,
                                                         textIconImagePack: textIconImagePack,
                                                         orientation: orientation,
                                                         layoutSchemeFlavor: .long)
        let iconPaddingLeft = Self.getIconPaddingLeft(orientation: orientation, flavor: .long, squeeze: squeeze)
        let iconPaddingRight = Self.getIconPaddingRight(orientation: orientation, flavor: .long, squeeze: squeeze)
        let iconWidth = icon.iconWidth
        let result = iconWidth + iconPaddingLeft + iconPaddingRight
        return result
    }
}
