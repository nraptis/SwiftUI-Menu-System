//
//  Theme.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/11/23.
//

import UIKit

struct ToolInterfaceTheme {
    
    static func getLineHeight(font: UIFont) -> Int {
        let lineHeight = Int(font.lineHeight + 1.5)
        return lineHeight
    }
    
    static func getNumberOfLines(line1: String?,
                                 line2: String?) -> Int {
        var numberOfLines = 0
        if line1 != nil { numberOfLines += 1 }
        if line2 != nil { numberOfLines += 1 }
        return numberOfLines
    }
    
    private static var textMinimumWidth = 12
    static func getTextWidth(line1: String?,
                             line2: String?,
                             font: UIFont) -> Int {
        var width1 = CGFloat(0.0)
        if let line1 = line1 {
            width1 = font.stringWidth(line1)
        }
        var width2 = CGFloat(0.0)
        if let line2 = line2 {
            width2 = font.stringWidth(line2)
        }
        var result = Int(max(width1, width2) + 0.5)
        if result < Self.textMinimumWidth {
            result = Self.textMinimumWidth
        }
        return result
    }
    
    static func getTextWidth(line1: String?,
                             font: UIFont) -> Int {
        var width = CGFloat(0.0)
        if let line1 = line1 {
            width = font.stringWidth(line1)
        }
        var result = Int(width + 0.5)
        if result < Self.textMinimumWidth {
            result = Self.textMinimumWidth
        }
        return result
    }
    
    
    static var shadowImageDown: UIImage {
        UIImage(named: "shadow_main_bar_down") ?? UIImage()
    }
    
    static var shadowImageUp: UIImage {
        UIImage(named: "shadow_main_bar_up") ?? UIImage()
    }
    
    static func getDraggableTopToolbarHeight(orientation: Orientation) -> Int {
        return 54
    }
    
    static func getDraggableTopToolbarSeparatorHeight(orientation: Orientation) -> Int {
        return 2
    }
    
    static func getDraggableRowSeparatorHeight(orientation: Orientation) -> Int {
        return 3
    }
    
    static func getDraggableBottomToolbarSeparatorHeight(orientation: Orientation) -> Int {
        return 2
    }
    
    static func getDraggableBottomToolbarHeight(orientation: Orientation) -> Int {
        return 36
    }
    
    
    static func getRowHeight(orientation: Orientation) -> Int {
        if Device.isPad {
            return 64
        } else {
            switch orientation {
            case .landscape:
                return 44
            case .portrait:
                return 50
            }
        }
    }
    
    static func getTopMenuHeight(orientation: Orientation, rowCount: Int) -> Int {
        var result = 0
        result += getTopMenuSpacingTop(orientation: orientation)
        if rowCount > 1 {
            result += getRowHeight(orientation: orientation) * rowCount
            result += getTopMenuRowSpacing(orientation: orientation) * (rowCount - 1)
        } else {
            result += getRowHeight(orientation: orientation)
        }
        result += getTopMenuSpacingBottom(orientation: orientation)
        return result
    }
    
    static func getTopMenuRowSpacing(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 1
        case .portrait:
            return 1
        }
    }

    static func getTopMenuSpacingTop(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 0
        case .portrait:
            return 0
        }
    }

    static func getTopMenuSpacingBottom(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 1
        case .portrait:
            return 1
        }
    }
    
    static func getTopMenuShadowHeight(orientation: Orientation) -> Int {
        return 4
    }
    
    static func getBottomMenuHeight(orientation: Orientation, rowCount: Int) -> Int {
        var result = 0
        result += getBottomMenuSpacingBottom(orientation: orientation)
        if rowCount > 1 {
            result += getRowHeight(orientation: orientation) * rowCount
            result += getBottomMenuRowSpacing(orientation: orientation) * (rowCount - 1)
        } else {
            result += getRowHeight(orientation: orientation)
        }
        result += getBottomMenuSpacingBottom(orientation: orientation)
        return result
    }

    static func getBottomMenuRowSpacing(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 1
        case .portrait:
            return 2
        }
    }

    static func getBottomMenuSpacingTop(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 1
        case .portrait:
            return 2
        }
    }

    static func getBottomMenuSpacingBottom(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 1
        case .portrait:
            return 2
        }
    }

    static func getBottomMenuShadowHeight(orientation: Orientation) -> Int {
        return 4
    }
    
}
