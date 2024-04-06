//
//  IconAndTextVertical.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/30/24.
//

import SwiftUI


struct IconAndTextVertical: View {
    
    static func getWidth(nameLabelTextWidth: Int, nameLabelPaddingLeft: Int, nameLabelPaddingRight: Int,
                         iconWidth: Int, iconPaddingLeft: Int, iconPaddingRight: Int) -> Int {
        let nameLabelWidth = nameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        let iconAreaWidth = iconWidth + iconPaddingLeft + iconPaddingRight
        return max(nameLabelWidth, iconAreaWidth)
    }
    
    let orientation: Orientation
    
    let line1: String?
    let line2: String?
    
    let nameLabelTextWidth: Int
    let nameLabelPaddingLeft: Int
    let nameLabelPaddingRight: Int
    let nameLabelPaddingBottom: Int
    let nameLabelVerticalSpacing: Int
    
    let icon: TextIcon
    let iconWidth: Int
    let iconHeight: Int
    
    let iconPaddingLeft: Int
    let iconPaddingRight: Int
    let iconPaddingTop: Int
    
    let font: UIFont
    
    var body: some View {
        
        let numberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: line1, line2: line2)
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: font)
        
        let nameLabelWidth = nameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        var nameLabelHeight = nameLabelPaddingBottom + lineHeight
        if numberOfLines == 2 {
            nameLabelHeight += nameLabelVerticalSpacing
            nameLabelHeight += lineHeight
        }

        let width1 = nameLabelWidth
        let width2 = iconWidth + iconPaddingLeft + iconPaddingRight
        
        let width = max(width1, width2)
        let height = nameLabelHeight + iconHeight + iconPaddingTop + nameLabelVerticalSpacing
        
        return ZStack {
            
            VStack(spacing: 0.0) {
                Spacer(minLength: 0.0)
                LabelBox(line1: line1,
                         line2: line2,
                         width: nameLabelWidth,
                         height: nameLabelHeight,
                         paddingLeft: nameLabelPaddingLeft,
                         paddingRight: nameLabelPaddingRight,
                         paddingBottom: nameLabelPaddingBottom,
                         lineHeight: lineHeight,
                         spacingVertical: nameLabelVerticalSpacing,
                         font: font)
            }
            
            VStack(spacing: 0.0) {
                
                IconBox(icon: icon,
                        iconWidth: iconWidth,
                        iconHeight: iconHeight,
                        iconPaddingLeft: iconPaddingLeft,
                        iconPaddingRight: iconPaddingRight,
                        iconPaddingTop: iconPaddingTop)
                
                Spacer(minLength: 0.0)
            }
        }
        .frame(width: CGFloat(width), height: CGFloat(height))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(Color(red: 0.76, green: 0.89, blue: 0.92)))
#endif
        
    }
}

