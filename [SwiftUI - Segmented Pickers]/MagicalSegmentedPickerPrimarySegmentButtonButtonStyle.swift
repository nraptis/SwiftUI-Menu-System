//
//  MagicalSegmentedPickerPrimarySegmentButtonButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/2/24.
//

import Foundation
import SwiftUI

struct MagicalSegmentedPickerPrimarySegmentButtonButtonStyle: ButtonStyle {
    
    @Environment(MagicalSegmentedPickerViewModel.self) var magicalSegmentedPickerViewModel: MagicalSegmentedPickerViewModel
    @Environment(MagicalSegmentedPickerButtonViewModel.self) var magicalSegmentedPickerButtonViewModel: MagicalSegmentedPickerButtonViewModel
    let index: Int
    let isSelected: Bool
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let segmentedPickerPosition: SegmentedPickerPosition
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            bodyContent(isPressed: configuration.isPressed)
        }
        .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.width),
               height: CGFloat(magicalSegmentedPickerViewModel.layoutHeight))
        
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        return HStack(spacing: 0.0) {
            MagicalSegmentedPickerPrimarySegmentContent(index: index,
                                                        isSelected: isSelected,
                                                        isPressed: isPressed,
                                                        orientation: orientation,
                                                        layoutSchemeFlavor: layoutSchemeFlavor,
                                                        universalPaddingTop: universalPaddingTop,
                                                        universalPaddingBottom: universalPaddingBottom)
            
        }
        .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.width),
               height: CGFloat(magicalSegmentedPickerViewModel.layoutHeight))
        .background(getFillRect(isPressed: isPressed))
        .background(getStrokeRect(isPressed: isPressed))
    }
    
    func getStrokeRect(isPressed: Bool) -> some View {
        
        let cornerRadius = SegmentedPickerLayout.getCornerRadiusOuter(orientation: orientation)
        
        let unevenRoundedRectangle: UnevenRoundedRectangle
        switch segmentedPickerPosition {
        case .bookendLeft:
            let radii = RectangleCornerRadii(topLeading: CGFloat(cornerRadius),
                                             bottomLeading: CGFloat(cornerRadius),
                                             bottomTrailing: 0.0,
                                             topTrailing: 0.0)
            unevenRoundedRectangle = UnevenRoundedRectangle(cornerRadii: radii)
        case .middle:
            let radii = RectangleCornerRadii(topLeading: 0.0,
                                             bottomLeading: 0.0,
                                             bottomTrailing: 0.0,
                                             topTrailing: 0.0)
            unevenRoundedRectangle = UnevenRoundedRectangle(cornerRadii: radii)
        case .bookendRight:
            let radii = RectangleCornerRadii(topLeading: 0.0,
                                             bottomLeading: 0.0,
                                             bottomTrailing: CGFloat(cornerRadius),
                                             topTrailing: CGFloat(cornerRadius))
            unevenRoundedRectangle = UnevenRoundedRectangle(cornerRadii: radii)
        }
        
        let height = magicalSegmentedPickerViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        return HStack(spacing: 0.0) {
            unevenRoundedRectangle
        }
        .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.width),
               height: CGFloat(height))
        .foregroundStyle(Color.pink)
    }
    
    func getFillRect(isPressed: Bool) -> some View {
        
        let lineThickness = SegmentedPickerLayout.getLineThickness(orientation: orientation)
        var lineThickness2 = lineThickness >> 1
        if lineThickness2 < 1 {
            lineThickness2 = 1
        }
        
        let cornerRadius = SegmentedPickerLayout.getCornerRadiusInner(orientation: orientation)
        
        let unevenRoundedRectangle: UnevenRoundedRectangle
        switch segmentedPickerPosition {
        case .bookendLeft:
            let radii = RectangleCornerRadii(topLeading: CGFloat(cornerRadius),
                                             bottomLeading: CGFloat(cornerRadius),
                                             bottomTrailing: 0.0,
                                             topTrailing: 0.0)
            unevenRoundedRectangle = UnevenRoundedRectangle(cornerRadii: radii)
        case .middle:
            let radii = RectangleCornerRadii(topLeading: 0.0,
                                             bottomLeading: 0.0,
                                             bottomTrailing: 0.0,
                                             topTrailing: 0.0)
            unevenRoundedRectangle = UnevenRoundedRectangle(cornerRadii: radii)
        case .bookendRight:
            let radii = RectangleCornerRadii(topLeading: 0.0,
                                             bottomLeading: 0.0,
                                             bottomTrailing: CGFloat(cornerRadius),
                                             topTrailing: CGFloat(cornerRadius))
            unevenRoundedRectangle = UnevenRoundedRectangle(cornerRadii: radii)
        }
        
        
        var spacingLeft = 0
        var spacingRight = 0
        
        switch segmentedPickerPosition {
        case .bookendLeft:
            spacingLeft = lineThickness
            spacingRight = lineThickness2
        case .middle:
            spacingLeft = lineThickness2
            spacingRight = lineThickness2
        case .bookendRight:
            spacingLeft = lineThickness2
            spacingRight = lineThickness
        }
        
        var height = magicalSegmentedPickerViewModel.layoutHeight
        height -= universalPaddingTop
        height -= universalPaddingBottom
        height -= lineThickness
        height -= lineThickness
        
        let color: Color
        if isSelected {
            if isPressed {
                color = Color.orange.opacity(0.5)
            } else {
                color = Color.orange
            }
        } else {
            if isPressed {
                color = Color.purple.opacity(0.5)
            } else {
                color = Color.purple
            }
        }
        
        return HStack(spacing: 0.0) {

#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(spacingLeft), height: 18.0)
                .background(Color(red: 0.65, green: 1.0, blue: 0.35, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(spacingLeft))
#endif
            
            unevenRoundedRectangle
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(spacingRight), height: 18.0)
                .background(Color(red: 0.65, green: 1.0, blue: 0.35, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(spacingRight))
#endif
            
        }
        .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.width),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
}
