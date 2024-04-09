//
//  MagicalSegmentedPickerPrimary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/22/24.
//

import SwiftUI

struct MagicalSegmentedPickerPrimary: View {
    
    @Environment(MagicalSegmentedPickerViewModel.self) var magicalSegmentedPickerViewModel: MagicalSegmentedPickerViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalSegmentedPickerViewModel.layoutWidth),
               height: CGFloat(magicalSegmentedPickerViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        
        .overlay(Rectangle().stroke(lineWidth: 2.0).foregroundStyle(Color.white))
        
        .offset(x: CGFloat(magicalSegmentedPickerViewModel.layoutX),
                y: CGFloat(magicalSegmentedPickerViewModel.layoutY))
        //.disabled(!magicalSliderViewModel.isEnabled)
        
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalSegmentedPickerViewModel.orientation
        let layoutSchemeFlavor = magicalSegmentedPickerViewModel.getLayoutSchemeFlavor()
        
        let universalPaddingLeft = magicalSegmentedPickerViewModel.universalPaddingLeft
        let universalPaddingRight = magicalSegmentedPickerViewModel.universalPaddingRight
        
        let layoutWidth = magicalSegmentedPickerViewModel.layoutWidth - (universalPaddingLeft + universalPaddingRight)
        
        return HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                .background(Color(red: 0.45, green: 0.85, blue: 0.65, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft))
#endif
            
            ZStack {
                
                MagicalSegmentedPickerPrimaryGuts(orientation: orientation,
                                                  layoutSchemeFlavor: layoutSchemeFlavor,
                                                  layoutWidth: layoutWidth)
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalSegmentedPickerViewModel.layoutHeight))
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                .background(Color(red: 1.0, green: 0.75, blue: 0.25, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingRight))
#endif
            
        }
    }
}
