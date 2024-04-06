//
//  IconAndTextHorizontal.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/30/24.
//

import SwiftUI

struct IconAndTextHorizontal: View {
    
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
    
    let font: UIFont
    let height: Int
    
    var body: some View {
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: font)
        let nameLabelWidth = nameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        let iconAreaWidth = iconWidth + iconPaddingLeft + iconPaddingRight
        let width = nameLabelWidth + iconAreaWidth
        
        return HStack(spacing: 0.0) {
            IconBox(icon: icon,
                    iconWidth: iconWidth,
                    iconHeight: iconHeight,
                    iconPaddingLeft: iconPaddingLeft,
                    iconPaddingRight: iconPaddingRight,
                    iconPaddingTop: 0)
            LabelBox(line1: line1,
                     line2: line2,
                     width: nameLabelWidth,
                     height: height,
                     paddingLeft: nameLabelPaddingLeft,
                     paddingRight: nameLabelPaddingRight,
                     paddingBottom: 0,
                     lineHeight: lineHeight,
                     spacingVertical: nameLabelVerticalSpacing,
                     font: font)
            Spacer(minLength: 0.0)
        }
        .frame(width: CGFloat(width), 
               height: CGFloat(height))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(Color(red: 0.89, green: 0.65, blue: 0.75)))
#endif
        
    }
}
