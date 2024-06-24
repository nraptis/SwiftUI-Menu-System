//
//  IconButtonLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation

struct IconButtonLayout: LayoutScheme {
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
        0
    }
    
    static func getUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        // FINAL
        0
    }
    
    static func getNameLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        // FINAL
        0
    }
    static func getNameLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        // FINAL
        0
    }
    static func getNameLabelPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        // FINAL
        0
    }
    
    static func getIconPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        // FINAL
        0
    }
    
    static func getIconPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 
        // FINAL
        0
    }
    
    static func getIconPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int { 
        // FINAL
        0
    }
    
    static func getIconWidthWithUniversalPadding(iconPack: TextIconPackable,
                                                 orientation: Orientation,
                                                 squeeze: LayoutSchemeSqueeze,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> Int {
        let universalPaddingLeft = getUniversalPaddingLeft(orientation: orientation,
                                                           flavor: .long,
                                                           squeeze: squeeze,
                                                           neighborTypeLeft: neighborTypeLeft,
                                                           neighborTypeRight: neighborTypeRight)
        let universalPaddingRight = getUniversalPaddingRight(orientation: orientation,
                                                             flavor: .long,
                                                             squeeze: squeeze,
                                                             neighborTypeLeft: neighborTypeLeft,
                                                             neighborTypeRight: neighborTypeRight)
        var result = getIconWidth(iconPack: iconPack,
                                  orientation: orientation,
                                  squeeze: squeeze)
        result += universalPaddingLeft
        result += universalPaddingRight
        return result
    }
    
    static func getIconWidth(iconPack: TextIconPackable,
                             orientation: Orientation,
                             squeeze: LayoutSchemeSqueeze) -> Int {
        
        return 80
        
        /*
        let icon = iconPack.getTextIcon(orientation: orientation,
                                        layoutSchemeFlavor: .long, numberOfLines: <#T##Int#>)
        
        ToolInterfaceImageLibrary.getTextIcon(numberOfLines: 1,
                                                         iconPack: iconPack,
                                                         orientation: orientation,
                                                         layoutSchemeFlavor: .long)
        let iconPaddingLeft = Self.getIconPaddingLeft(orientation: orientation, flavor: .long, squeeze: squeeze)
        let iconPaddingRight = Self.getIconPaddingRight(orientation: orientation, flavor: .long, squeeze: squeeze)
        let iconWidth = icon.iconWidth
        let result = iconWidth + iconPaddingLeft + iconPaddingRight
        return result
        */
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
