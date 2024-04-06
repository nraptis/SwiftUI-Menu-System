//
//  MagicalDivider.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/29/24.
//

import SwiftUI

struct MagicalDivider: View {
    
    @Environment(MagicalDividerViewModel.self) var magicalDividerViewModel: MagicalDividerViewModel
    
    var body: some View {
        let orientation = magicalDividerViewModel.orientation
        let capsuleWidth = DividerLayout.getCapsuleWidth(orientation: orientation)
        let capsuleHeight = DividerLayout.getCapsuleHeight(orientation: orientation)
        
        let universalPaddingLeft = magicalDividerViewModel.universalPaddingLeft
        let universalPaddingRight = magicalDividerViewModel.universalPaddingRight
        
        return HStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                .background(Color(red: 0.45, green: 0.85, blue: 0.65, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft))
#endif
            
            Capsule()
                .frame(width: CGFloat(capsuleWidth),
                       height: CGFloat(capsuleHeight))
                .foregroundStyle(Color.white)
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                .background(Color(red: 1.0, green: 0.75, blue: 0.25, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingRight))
#endif
            
        }
        .frame(width: CGFloat(magicalDividerViewModel.layoutWidth),
               height: CGFloat(magicalDividerViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalDividerViewModel.layoutX),
                y: CGFloat(magicalDividerViewModel.layoutY))

        
        
    }
}
