//
//  IconBox.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import SwiftUI

struct IconBox: View {
    
    let icon: (any TextIconable)
    
    
    let imageWidth: Int
    let imageHeight: Int
    
    let iconX: Int
    let iconY: Int
    
    let iconWidth: Int
    let iconHeight: Int
    
    let iconPaddingLeft: Int
    let iconPaddingRight: Int
    let iconPaddingTop: Int
    
    let color: Color
    
    var body: some View {
        
        let width = iconWidth + iconPaddingLeft + iconPaddingRight
        let height = iconHeight + iconPaddingTop
        
        var insetLeft = iconX
        var insetTop = iconY
        
        var insetRight = imageWidth - (iconWidth + iconX)
        var insetBottom = imageHeight - (iconHeight + iconY)
        
        //var shiftX = (insetLeft - insetRight)
        
        
        
        return VStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 12.0, height: CGFloat(iconPaddingTop))
                .background(RoundedRectangle(cornerRadius: 2.0).foregroundStyle(Color(red: 0.65, green: 0.45, blue: 0.925, opacity: 0.5)))
#else
                Spacer()
                    .frame(height: CGFloat(iconPaddingTop))
#endif
            
            HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(iconPaddingLeft), height: 12.0)
                    .background(Color(red: 0.75, green: 0.65, blue: 0.925, opacity: 0.5))
#else
                Spacer()
                    .frame(width: CGFloat(iconPaddingLeft))
#endif
                
                ZStack {
                    
#if INTERFACE_HINTS
                    
#elseif ICON_HINTS
                    
#else
                    
                    
                    Image(uiImage: icon.getImage())
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: CGFloat(imageWidth),
                               height: CGFloat(imageHeight))
                        .foregroundStyle(color)
                        
                    
                    ZStack {
                        
                    }
                    .frame(width: CGFloat(iconWidth),
                           height: CGFloat(iconHeight))
                    .overlay(Rectangle().foregroundStyle(Color.red.opacity(0.5)))
                    
#endif
                }
                .frame(width: CGFloat(iconWidth),
                       height: CGFloat(iconHeight))
                //.clipped()
#if INTERFACE_HINTS
                .background(Color(red: 0.65, green: 0.75, blue: 0.95, opacity: 0.25))
                .overlay(Rectangle().stroke().foregroundColor(Color.black).zIndex(3096.0))
#endif
#if ICON_HINTS
                .overlay(Rectangle().foregroundColor(Color.red.opacity(0.25)).zIndex(3096.0))
#endif
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(iconPaddingRight), height: 12.0)
                    .background(Color(red: 0.925, green: 0.75, blue: 0.65, opacity: 0.5))
#else
                Spacer()
                    .frame(width: CGFloat(iconPaddingRight))
#endif
                
            }
            .frame(width: CGFloat(width), height: CGFloat(iconHeight))
        }
        .frame(width: CGFloat(width), height: CGFloat(height))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundColor(Color(red: 0.975, green: 0.65, blue: 0.725)))
#endif
    }
}
