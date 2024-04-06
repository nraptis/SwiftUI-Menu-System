//
//  MagicalSlider.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/30/24.
//

import SwiftUI

struct MagicalSlider: View {
    @Environment(MagicalSliderViewModel.self) var magicalSliderViewModel: MagicalSliderViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalSliderViewModel.layoutWidth),
               height: CGFloat(magicalSliderViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalSliderViewModel.layoutX),
                y: CGFloat(magicalSliderViewModel.layoutY))
        //.disabled(!magicalSliderViewModel.isEnabled)
        
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalSliderViewModel.orientation
        let configuration = magicalSliderViewModel.sliderConfiguration
        let layoutSchemeFlavor = magicalSliderViewModel.getLayoutSchemeFlavor()
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: line1, line2: line2)
        
        let universalPaddingLeft = magicalSliderViewModel.universalPaddingLeft
        let universalPaddingRight = magicalSliderViewModel.universalPaddingRight
        let universalPaddingTop = SliderLayout.getUniversalPaddingTop(orientation: orientation,
                                                                      flavor: layoutSchemeFlavor,
                                                                      numberOfLines: numberOfLines)
        let universalPaddingBottom = SliderLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                            flavor: layoutSchemeFlavor,
                                                                            numberOfLines: numberOfLines)
        
        let layoutWidth = magicalSliderViewModel.layoutWidth - (universalPaddingLeft + universalPaddingRight)
        let layoutHeight = magicalSliderViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        return VStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingTop))
                .background(Color(red: 0.85, green: 0.65, blue: 0.55, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingTop))
#endif
            
            HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                    .background(Color(red: 0.45, green: 0.85, blue: 0.65, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(universalPaddingLeft))
#endif
                
                ZStack {
                    MagicalSliderGuts(orientation: orientation,
                                      layoutSchemeFlavor: layoutSchemeFlavor,
                                      line1: line1,
                                      line2: line2,
                                      numberOfLines: numberOfLines,
                                      layoutWidth: layoutWidth,
                                      layoutHeight: layoutHeight)
                }
                .frame(width: CGFloat(layoutWidth),
                       height: CGFloat(layoutHeight))
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                    .background(Color(red: 1.0, green: 0.75, blue: 0.25, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(universalPaddingRight))
#endif
                
            }
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingBottom))
                .background(Color(red: 0.65, green: 0.85, blue: 0.75, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingBottom))
#endif
            
        }
    }
}
