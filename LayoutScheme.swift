//
//  LayoutScheme.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/27/24.
//

import Foundation
import UIKit

enum LayoutSchemeFlavor: UInt8 {
    case long = 4
    case stackedLarge = 3
    case stackedMedium = 2
    case stackedSmall = 1
}

extension LayoutSchemeFlavor {
    static func getMax() -> LayoutSchemeFlavor {
        return .long
    }
}

extension LayoutSchemeFlavor: Comparable {
    static func < (lhs: LayoutSchemeFlavor, rhs: LayoutSchemeFlavor) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}


extension LayoutSchemeFlavor {
    var isStacked: Bool {
        switch self {
        case .long:
            false
        case .stackedLarge:
            true
        case .stackedMedium:
            true
        case .stackedSmall:
            true
        }
    }
    
    var isLong: Bool {
        switch self {
        case .long:
            true
        case .stackedLarge:
            false
        case .stackedMedium:
            false
        case .stackedSmall:
            false
        }
    }
}

enum LayoutSchemeSqueeze {
    case squeezed
    case standard
}

// There is an assumption here, that everything
// we express here has an icon + text scheme... In addition to, perhaps, another thing...
// This is to save repeating work, and make life easy for ourselfves.

protocol LayoutScheme {
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont
    
    static func getUniversalPaddingLeft(orientation: Orientation,
                                        flavor: LayoutSchemeFlavor,
                                        squeeze: LayoutSchemeSqueeze,
                                        neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> Int
    static func getUniversalPaddingRight(orientation: Orientation,
                                         flavor: LayoutSchemeFlavor,
                                         squeeze: LayoutSchemeSqueeze,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> Int
    static func getUniversalPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int
    static func getUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int
    
    static func getNameLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int
    static func getNameLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int
    static func getNameLabelPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int
    static func getNameLabelVerticalSpacing(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int
    
    static func getIconPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int
    static func getIconPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int
    static func getIconPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int
    
}

extension LayoutScheme {
    static func getNameLabelLineHeight(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int {
        let font = getNameLabelFont(orientation: orientation, flavor: flavor)
        return ToolInterfaceTheme.getLineHeight(font: font)
    }

    static func getNameLabelTextWidth(line1: String?,
                                      line2: String?,
                                      orientation: Orientation,
                                      flavor: LayoutSchemeFlavor) -> Int {
        let font = Self.getNameLabelFont(orientation: orientation, flavor: flavor)
        return ToolInterfaceTheme.getTextWidth(line1: line1, line2: line2, font: font)
    }
    
    static func getNameLabelTextWidth(line1: String?,
                                      orientation: Orientation,
                                      flavor: LayoutSchemeFlavor) -> Int {
        let font = Self.getNameLabelFont(orientation: orientation, flavor: flavor)
        return ToolInterfaceTheme.getTextWidth(line1: line1, font: font)
    }
}

extension LayoutScheme {

    static func getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: Int,
                                                                 nameLabelNumberOfLines: Int,
                                                                 iconPack: TextIconPackable,
                                                                 orientation: Orientation,
                                                                 flavor: LayoutSchemeFlavor,
                                                                 squeeze: LayoutSchemeSqueeze,
                                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                                 neighborTypeRight: ToolInterfaceElementType?) -> Int {
        let universalPaddingLeft = getUniversalPaddingLeft(orientation: orientation,
                                                           flavor: flavor,
                                                           squeeze: squeeze,
                                                           neighborTypeLeft: neighborTypeLeft,
                                                           neighborTypeRight: neighborTypeRight)
        let universalPaddingRight = getUniversalPaddingRight(orientation: orientation,
                                                             flavor: flavor,
                                                             squeeze: squeeze,
                                                             neighborTypeLeft: neighborTypeLeft,
                                                             neighborTypeRight: neighborTypeRight)
        var result = getTextIconAndNameLabelWidth(nameLabelWidth: nameLabelWidth,
                                                  nameLabelNumberOfLines: nameLabelNumberOfLines,
                                                  iconPack: iconPack,
                                                  orientation: orientation,
                                                  flavor: flavor,
                                                  squeeze: squeeze)
        result += universalPaddingLeft
        result += universalPaddingRight
        return result
    }
    
    static func getTextIconAndNameLabelWidth(nameLabelWidth: Int,
                                             nameLabelNumberOfLines: Int,
                                             iconPack: TextIconPackable,
                                             orientation: Orientation,
                                             flavor: LayoutSchemeFlavor,
                                             squeeze: LayoutSchemeSqueeze) -> Int {
        
        let icon = iconPack.getTextIcon(orientation: orientation,
                                        layoutSchemeFlavor: flavor,
                                        numberOfLines: nameLabelNumberOfLines)
        
        let nameLabelPaddingLeft = Self.getNameLabelPaddingLeft(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let nameLabelPaddingRight = Self.getNameLabelPaddingRight(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let iconPaddingLeft = Self.getIconPaddingLeft(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let iconPaddingRight = Self.getIconPaddingRight(orientation: orientation, flavor: flavor, squeeze: squeeze)
        
        let iconWidth = icon.iconWidth
        
        let width1 = nameLabelWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        let width2 = iconWidth + iconPaddingLeft + iconPaddingRight
        
        switch flavor {
        case .long:
            return width1 + width2
        case .stackedLarge, .stackedMedium, .stackedSmall:
            return max(width1, width2)
        }
    }
}

extension LayoutScheme {
    
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        if Device.isPad {
            switch flavor {
            case .long:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold)
            case .stackedLarge:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold)
            case .stackedMedium:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold, width: .condensed)
            case .stackedSmall:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold, width: .compressed)
            }
        } else {
            switch orientation {
            case .landscape:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold, width: .compressed)
                }
            case .portrait:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold, width: .compressed)
                }
            }
        }
    }
    
    static func getNameLabelVerticalSpacing(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int {
        if Device.isPhone {
            return -3
        }
        if Device.isPad {
            return -4
        }
        return 0
    }
    
}
