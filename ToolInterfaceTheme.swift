//
//  Theme.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/11/23.
//

import UIKit
import SwiftUI

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
    
    static func getDraggableGraphAreaRowCount() -> Int {
        return 3
    }
    
    static func getDraggableTopToolbarHeight(orientation: Orientation) -> Int {
        return 54
    }
    
    static func getDraggableRowSeparatorHeight(orientation: Orientation) -> Int {
        return 2
    }
    
    static func getDraggableRowSeparatorHeightTop(orientation: Orientation) -> Int {
        return 4
    }
    
    static func getDraggableRowSeparatorHeightBottom(orientation: Orientation) -> Int {
        return 4
    }
    
    static func getDraggableBottomToolbarHeight(orientation: Orientation) -> Int {
        return 36
    }
    
    static func getDraggableGraphInsetLeft(orientation: Orientation) -> Int {
        return getGraphSideMenuWidth(orientation: orientation) + 16
    }
    
    static func getDraggableGraphInsetRight(orientation: Orientation) -> Int {
        return 16
    }
    
    static func getDraggableGraphInsetTop(orientation: Orientation) -> Int {
        return 12
    }
    
    static func getDraggableGraphInsetBottom(orientation: Orientation) -> Int {
        return 6
    }
    
    static func getDraggableGraphCornerRadius(orientation: Orientation) -> Int {
        return 12
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
    
    static func getStationaryRowSeparatorHeight(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getTopRowSeparatorHeightTop(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getTopRowSeparatorHeightBottom(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getBottomRowSeparatorHeightTop(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getBottomRowSeparatorHeightBottom(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getTopGraphInsetLeft(orientation: Orientation) -> Int {
        return getGraphSideMenuWidth(orientation: orientation) + 8
    }
    
    static func getTopGraphInsetRight(orientation: Orientation) -> Int {
        return 8
    }
    
    static func getTopGraphInsetTop(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 36
        case .portrait:
            if Device.hasSafeAreaTop {
                return 6
            } else {
                return 36
            }
        }
    }
    
    static func getTopGraphInsetBottom(orientation: Orientation) -> Int {
        return 6
    }
    
    static func getTopGraphCornerRadius(orientation: Orientation) -> Int {
        return 8
    }
    
    static func getGraphSideMenuWidth(orientation: Orientation) -> Int {
        
        if Device.isPad {
            return 144
        } else {
            switch orientation {
            case .landscape:
                return 128
            case .portrait:
                return 96
            }
        }
    }
    
    static func getGraphSideMenuInsetLeft(orientation: Orientation) -> Int {
        return 0
    }
    
    static func getGraphSideMenuInsetRight(orientation: Orientation) -> Int {
        return 0
    }
    
    
    //graphSideMenu
    
    private static func getTopMenuHeight(orientation: Orientation, rowCount: Int) -> Int {
        var result = 0
        result += getTopRowSeparatorHeightTop(orientation: orientation)
        if rowCount > 1 {
            result += getRowHeight(orientation: orientation) * rowCount
            result += getStationaryRowSeparatorHeight(orientation: orientation) * (rowCount - 1)
        } else {
            result += getRowHeight(orientation: orientation)
        }
        result += getTopRowSeparatorHeightBottom(orientation: orientation)
        return result
    }
    
    static func getTopMenuHeight(orientation: Orientation, withGraph isWithGraph: Bool) -> Int {
        
        if isWithGraph {
            let rowCount = getTopMenuGraphAreaRowCount(orientation: orientation)
            return getTopMenuHeight(orientation: orientation, rowCount: rowCount)
        } else {
            let rowCount = getTopMenuRowCount(orientation: orientation)
            return getTopMenuHeight(orientation: orientation, rowCount: rowCount)
        }
    }
    
    static func getTopMenuGraphAreaHeight(orientation: Orientation) -> Int {
        let rowCount = getTopMenuGraphAreaRowCount(orientation: orientation)
        let rowHeight = getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getStationaryRowSeparatorHeight(orientation: orientation)
        if rowCount <= 1 {
            return rowHeight
        } else {
            return (rowCount * rowHeight) + (rowSeparatorHeight * (rowCount - 1))
        }
    }
    
    static func getTopMenuRowCount(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 2
        case .portrait:
            return 3
        }
    }
    
    static func getTopMenuGraphAreaRowCount(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 4
        case .portrait:
            if Device.hasSafeAreaTop {
                //return 3
                return 5
                
            } else {
                return 4
            }
        }
    }
    
    static func getTopMenuShadowHeight(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 4
        case .portrait:
            return 5
        }
    }
    
    
    static func getBottomMenuRowCount(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 2
        case .portrait:
            return 3
        }
    }
    
    private static func getBottomMenuHeight(orientation: Orientation, rowCount: Int) -> Int {
        var result = 0
        result += getBottomRowSeparatorHeightTop(orientation: orientation)
        if rowCount > 1 {
            result += getRowHeight(orientation: orientation) * rowCount
            result += getStationaryRowSeparatorHeight(orientation: orientation) * (rowCount - 1)
        } else {
            result += getRowHeight(orientation: orientation)
        }
        result += getBottomRowSeparatorHeightBottom(orientation: orientation)
        print("bottom menu ehight: result: \(result)")
        return result
    }
    
    static func getBottomMenuHeight(orientation: Orientation) -> Int {
        let rowCount = getBottomMenuRowCount(orientation: orientation)
        return getBottomMenuHeight(orientation: orientation, rowCount: rowCount)
    }
    
    static func getBottomMenuShadowHeight(orientation: Orientation) -> Int {
        switch orientation {
        case .landscape:
            return 4
        case .portrait:
            return 5
        }
    }
    
    
    
    static let _blueBasic = UIColor(red: 0.200, green: 0.630, blue: 1.000, alpha: 1.0)
    static let _orangeBasic = UIColor(red: 1.0, green: 0.556, blue: 0.000, alpha: 1.0)
    
    static let _highlightedYellowUp = UIColor(red: 1.0, green: 0.895, blue: 0.0, alpha: 1.0)
    static let _highlightedYellowDown = UIColor(red: 0.935, green: 0.8, blue: 0.055, alpha: 1.0)
    
    static let _disabledGray = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.0)
    
    static let _enabledGrayUp = UIColor(red: 0.9685, green: 0.9685, blue: 0.9685, alpha: 1.0)
    //static let _enabledGrayUp = UIColor(red: 0.9685, green: 0.25, blue: 0.45, alpha: 1.0)
    
    static let _enabledGrayDown = UIColor(red: 0.62745, green: 0.62745, blue: 0.62745, alpha: 1.0)
    
    
    
    static let _checkMarkGreen = UIColor(red: 0.0475, green: 0.9575, blue: 0.09, alpha: 1.0)
    static let _gray010 = UIColor(red: 0.010, green: 0.010, blue: 0.010, alpha: 1.0)
    static let _gray015 = UIColor(red: 0.015, green: 0.015, blue: 0.015, alpha: 1.0)
    static let _gray020 = UIColor(red: 0.020, green: 0.020, blue: 0.020, alpha: 1.0)
    static let _gray025 = UIColor(red: 0.025, green: 0.025, blue: 0.025, alpha: 1.0)
    static let _gray040 = UIColor(red: 0.04, green: 0.04, blue: 0.04, alpha: 1.0)
    static let _gray050 = UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 1.0)
    static let _gray075 = UIColor(red: 0.075, green: 0.075, blue: 0.075, alpha: 1.0)
    static let _gray100 = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
    static let _gray150 = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0)
    static let _gray175 = UIColor(red: 0.175, green: 0.175, blue: 0.175, alpha: 1.0)
    static let _gray200 = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
    static let _gray250 = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.0)
    static let _gray300 = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
    static let _gray400 = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0)
    static let _gray500 = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
    static let _gray600 = UIColor(red: 0.6, green: 0.6, blue: 0.6, alpha: 1.0)
    static let _gray700 = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1.0)
    static let _gray750 = UIColor(red: 0.75, green: 0.75, blue: 0.75, alpha: 1.0)
    static let _gray800 = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
    static let _gray850 = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
    static let _gray900 = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
    static let _gray925 = UIColor(red: 0.925, green: 0.925, blue: 0.925, alpha: 1.0)
    static let _gray950 = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
    static let _gray975 = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1.0)
    
    static let blueBasic = Color(uiColor: _blueBasic)
    static let orangeBasic = Color(uiColor: _orangeBasic)
    static let checkMarkGreen = Color(uiColor: _checkMarkGreen)
    
    
    
    static let highlightedYellowUp = Color(uiColor: _highlightedYellowUp)
    static let highlightedYellowDown = Color(uiColor: _highlightedYellowDown)
    
    static let disabledGray = Color(uiColor: _disabledGray)
    
    static let enabledGrayUp = Color(uiColor: _enabledGrayUp)
    static let enabledGrayDown = Color(uiColor: _enabledGrayDown)
    
    static let gray010 = Color(uiColor: _gray010)
    static let gray015 = Color(uiColor: _gray015)
    static let gray020 = Color(uiColor: _gray020)
    static let gray025 = Color(uiColor: _gray025)
    static let gray040 = Color(uiColor: _gray040)
    static let gray050 = Color(uiColor: _gray050)
    static let gray075 = Color(uiColor: _gray075)
    static let gray100 = Color(uiColor: _gray100)
    static let gray150 = Color(uiColor: _gray150)
    static let gray175 = Color(uiColor: _gray175)
    static let gray200 = Color(uiColor: _gray200)
    static let gray250 = Color(uiColor: _gray250)
    static let gray300 = Color(uiColor: _gray300)
    static let gray400 = Color(uiColor: _gray400)
    static let gray500 = Color(uiColor: _gray500)
    static let gray600 = Color(uiColor: _gray600)
    static let gray700 = Color(uiColor: _gray700)
    static let gray750 = Color(uiColor: _gray750)
    static let gray800 = Color(uiColor: _gray800)
    static let gray850 = Color(uiColor: _gray850)
    static let gray900 = Color(uiColor: _gray900)
    static let gray925 = Color(uiColor: _gray925)
    static let gray950 = Color(uiColor: _gray950)
    static let gray975 = Color(uiColor: _gray975)
    
    //static let _toolbarBackground =
    static let _toolbarBackground = _gray075.withAlphaComponent(0.05)
    static let toolbarBackground = Color(uiColor: _toolbarBackground)
    
    static let _separatorOuterEdge = _gray400//.withAlphaComponent(0.25)
    static let separatorOuterEdge = Color(uiColor: _separatorOuterEdge)
    
    static let _separatorInnerEdge = _gray200//.withAlphaComponent(0.25)
    static let separatorInnerEdge = Color(uiColor: _separatorInnerEdge)
    
    static let _separatorMiddle = _gray200//.withAlphaComponent(0.55)
    static let separatorMiddle = Color(uiColor: _separatorMiddle)
    
    static let _shadowInner = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4)
    static let shadowInner = Color(uiColor: _shadowInner)
    
    static let _shadowMiddle = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.15)
    static let shadowMiddle = Color(uiColor: _shadowMiddle)
    
    static let _shadowOuter = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    static let shadowOuter = Color(uiColor: _shadowOuter)
    
    static let graphBackground = RGBA(red: 0.2125, green: 0.2125, blue: 0.215, alpha: 0.9)
    
    
    //static let ___gray300 = RGBA(uiColor: _gray300)
    //static let ___gray400 = RGBA(uiColor: _gray400)
    //static let ___gray500 = RGBA(uiColor: _gray500)
    
    
    
}
