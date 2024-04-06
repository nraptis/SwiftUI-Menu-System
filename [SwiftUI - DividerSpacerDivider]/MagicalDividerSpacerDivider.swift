//
//  MagicalDividerSpacerDivider.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/29/24.
//

import SwiftUI

struct MagicalDividerSpacerDivider: View {
    
    @Environment(MagicalDividerSpacerDividerViewModel.self) var magicalDividerSpacerDividerViewModel: MagicalDividerSpacerDividerViewModel
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalDividerSpacerDividerViewModel.layoutWidth),
               height: CGFloat(magicalDividerSpacerDividerViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalDividerSpacerDividerViewModel.layoutX),
                y: CGFloat(magicalDividerSpacerDividerViewModel.layoutY))
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalDividerSpacerDividerViewModel.orientation
        let capsuleWidth = DividerLayout.getCapsuleWidth(orientation: orientation)
        let capsuleHeight = DividerLayout.getCapsuleHeight(orientation: orientation)
        
        let universalPaddingLeft = magicalDividerSpacerDividerViewModel.universalPaddingLeft
        let universalPaddingRight = magicalDividerSpacerDividerViewModel.universalPaddingRight
        
        let isShowingTwoDividers = magicalDividerSpacerDividerViewModel.isShowingTwoDividers
        let spaceBetween = magicalDividerSpacerDividerViewModel.spaceBetween
        
        return HStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                .background(Color(red: 0.45, green: 0.85, blue: 0.65, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft))
#endif
            
            if isShowingTwoDividers {
                
                Capsule()
                    .frame(width: CGFloat(capsuleWidth),
                           height: CGFloat(capsuleHeight))
                    .foregroundStyle(Color.white)
                
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(spaceBetween), height: 28.0)
                .background(Color(red: 1.0, green: 0.85, blue: 0.35, opacity: 0.25))
#else
            Spacer()
                .frame(width: CGFloat(spaceBetween))
#endif
                
                
                Capsule()
                    .frame(width: CGFloat(capsuleWidth),
                           height: CGFloat(capsuleHeight))
                    .foregroundStyle(Color.white)
                
            } else {
                Capsule()
                    .frame(width: CGFloat(capsuleWidth),
                           height: CGFloat(capsuleHeight))
                    .foregroundStyle(Color.white)
            }
            
            
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                .background(Color(red: 1.0, green: 0.75, blue: 0.25, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingRight))
#endif
            
        }
        .frame(width: CGFloat(magicalDividerSpacerDividerViewModel.layoutWidth),
               height: CGFloat(magicalDividerSpacerDividerViewModel.layoutHeight))
    }
}
