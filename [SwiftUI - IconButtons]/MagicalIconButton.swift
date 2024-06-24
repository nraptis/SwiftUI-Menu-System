//
//  MagicalIconButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import SwiftUI

struct MagicalIconButton: View {
    
    @Environment(MagicalIconButtonViewModel.self) var magicalIconButtonViewModel: MagicalIconButtonViewModel
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalIconButtonViewModel.layoutWidth),
               height: CGFloat(magicalIconButtonViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalIconButtonViewModel.layoutX),
                y: CGFloat(magicalIconButtonViewModel.layoutY))
        .disabled(!magicalIconButtonViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        let orientation = magicalIconButtonViewModel.orientation
        let universalPaddingLeft = magicalIconButtonViewModel.universalPaddingLeft
        let universalPaddingRight = magicalIconButtonViewModel.universalPaddingRight
        
        let universalPaddingTop = IconButtonLayout.getUniversalPaddingTop(orientation: orientation,
                                                                          flavor: .long,
                                                                          numberOfLines: 1)
        let universalPaddingBottom = IconButtonLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                                flavor: .long,
                                                                                numberOfLines: 1)
        
        let separatorWidth = IconButtonLayout.getSeparatorWidth(orientation: orientation)
        let separatorHeight = IconButtonLayout.getSeparatorHeight(orientation: orientation)
        
        var isShowingSeparator = false
        if (magicalIconButtonViewModel.neighborTypeRight == .textIconButton) ||
            (magicalIconButtonViewModel.neighborTypeRight == .iconButton) {
            isShowingSeparator = true
        }
        
        let layoutWidth = magicalIconButtonViewModel.layoutWidth - (universalPaddingLeft + universalPaddingRight)
        
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
                MagicalIconButtonButton(orientation: orientation,
                                            universalPaddingTop: universalPaddingTop,
                                            universalPaddingBottom: universalPaddingBottom,
                                            layoutWidth: layoutWidth)
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalIconButtonViewModel.layoutHeight))

            
            
            if isShowingSeparator {
                
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
        .frame(width: CGFloat(magicalIconButtonViewModel.layoutWidth),
               height: CGFloat(magicalIconButtonViewModel.layoutHeight))
    }
}
