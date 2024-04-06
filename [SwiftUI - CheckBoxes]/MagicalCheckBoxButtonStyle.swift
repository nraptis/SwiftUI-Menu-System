//
//  MagicalCheckBoxButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import SwiftUI

struct MagicalCheckBoxButtonStyle: ButtonStyle {
    
    @Environment(MagicalCheckBoxViewModel.self) var magicalCheckBoxViewModel: MagicalCheckBoxViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            bodyContent(isPressed: configuration.isPressed)
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalCheckBoxViewModel.layoutHeight))
        
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        return HStack(spacing: 0.0) {
            MagicalCheckBoxContent(orientation: orientation,
                                   layoutSchemeFlavor: layoutSchemeFlavor,
                                   isPressed: isPressed,
                                   universalPaddingTop: universalPaddingTop,
                                   universalPaddingBottom: universalPaddingBottom,
                                   layoutWidth: layoutWidth)
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalCheckBoxViewModel.layoutHeight))
        .background(getFillRect(isPressed: isPressed))
        .background(getStrokeRect(isPressed: isPressed))
    }
    
    func getStrokeRect(isPressed: Bool) -> some View {
        let cornerRadius = CheckBoxLayout.getCornerRadiusOuter(orientation: orientation)
        let width = layoutWidth
        let height = magicalCheckBoxViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        return RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .frame(width: CGFloat(width), height: CGFloat(height))
            .foregroundStyle(Color.white)
    }
    
    func getFillRect(isPressed: Bool) -> some View {
        
        let lineThickness = CheckBoxLayout.getLineThickness(orientation: orientation)
        let cornerRadius = CheckBoxLayout.getCornerRadiusInner(orientation: orientation)

        let color: Color
        if isPressed {
            color = .orange
        } else {
            color = .gray
        }
        
        let width = layoutWidth - (lineThickness + lineThickness)
        let height = magicalCheckBoxViewModel.layoutHeight - (lineThickness + lineThickness + universalPaddingTop + universalPaddingBottom)
        
        return RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .frame(width: CGFloat(width),
                   height: CGFloat(height))
            .foregroundStyle(color)
    }
    
    
}
