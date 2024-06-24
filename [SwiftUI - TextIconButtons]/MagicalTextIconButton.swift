//
//  MagicalTextIconButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/26/24.
//

import SwiftUI

struct MagicalTextIconButton: View {
    
    @Environment(MagicalTextIconButtonViewModel.self) var magicalTextIconButtonViewModel: MagicalTextIconButtonViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalTextIconButtonViewModel.layoutWidth),
               height: CGFloat(magicalTextIconButtonViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif        
        .offset(x: CGFloat(magicalTextIconButtonViewModel.layoutX),
                y: CGFloat(magicalTextIconButtonViewModel.layoutY))
        .disabled(!magicalTextIconButtonViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalTextIconButtonViewModel.orientation
        let configuration = magicalTextIconButtonViewModel.textIconButtonConfiguration
        let layoutSchemeFlavor = magicalTextIconButtonViewModel.getLayoutSchemeFlavor()
        
        let universalPaddingLeft = magicalTextIconButtonViewModel.universalPaddingLeft
        let universalPaddingRight = magicalTextIconButtonViewModel.universalPaddingRight
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let universalPaddingTop = TextIconButtonLayout.getUniversalPaddingTop(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              numberOfLines: numberOfLines)
        let universalPaddingBottom = TextIconButtonLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    numberOfLines: numberOfLines)
        
        let layoutWidth = magicalTextIconButtonViewModel.layoutWidth - (universalPaddingLeft + universalPaddingRight)
        
        let separatorWidth = TextIconButtonLayout.getSeparatorWidth(orientation: orientation)
        let separatorHeight = TextIconButtonLayout.getSeparatorHeight(orientation: orientation)
        
        var isShowingSeparator = false
        if (magicalTextIconButtonViewModel.neighborTypeRight == .textIconButton) ||
            (magicalTextIconButtonViewModel.neighborTypeRight == .iconButton) {
            isShowingSeparator = true
        }
        
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
                
                MagicalTextIconButtonButton(orientation: orientation,
                                            layoutSchemeFlavor: layoutSchemeFlavor,
                                            universalPaddingTop: universalPaddingTop,
                                            universalPaddingBottom: universalPaddingBottom,
                                            layoutWidth: layoutWidth)
                
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalTextIconButtonViewModel.layoutHeight))
            
            if isShowingSeparator {
                
                //let separatorWidth = TextIconButtonLayout.getSeparatorWidth(orientation: orientation)
                //let separatorHeight = TextIconButtonLayout.getSeparatorHeight(orientation: orientation)
                
                HStack(spacing: 0.0) {
#if INTERFACE_HINTS
                    Spacer(minLength: 0.0)
                        .frame(height: 28.0)
                        .background(Color(red: 0.65, green: 0.25, blue: 0.97, opacity: 0.40))
#else
                    Spacer(minLength: 0.0)
#endif
      
                    Capsule()
                        .frame(width: CGFloat(separatorWidth),
                               height: CGFloat(separatorHeight))
                        .foregroundStyle(ToolInterfaceTheme.gray950)
                    
#if INTERFACE_HINTS
                    Spacer(minLength: 0.0)
                        .frame(height: 28.0)
                        .background(Color(red: 0.25, green: 0.65, blue: 0.97, opacity: 0.40))
#else
                    Spacer(minLength: 0.0)
#endif
                }
                .frame(width: CGFloat(universalPaddingRight))
                
            } else {
                
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
        .frame(width: CGFloat(magicalTextIconButtonViewModel.layoutWidth),
               height: CGFloat(magicalTextIconButtonViewModel.layoutHeight))
    }
}
