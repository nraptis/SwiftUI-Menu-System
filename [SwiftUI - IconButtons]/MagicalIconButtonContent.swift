//
//  MagicalIconButtonContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import SwiftUI

struct MagicalIconButtonContent: View {
    
    @Environment(MagicalIconButtonViewModel.self) var magicalIconButtonViewModel: MagicalIconButtonViewModel
    
    let orientation: Orientation
    let isPressed: Bool
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    var body: some View {
        let textIcon = magicalIconButtonViewModel.iconButtonConfiguration.getTextIcon(orientation: orientation)
        
        /*
        let iconWidth = textIcon.iconWidth
        let iconHeight: Int
        if Device.isPad {
            iconHeight = 42
        } else {
            if orientation.isLandscape {
                iconHeight = 27
            } else {
                iconHeight = 32
            }
        }
        */
        let imageWidth = textIcon.imageWidth
        let imageHeight = textIcon.imageHeight
        let iconX = textIcon.iconX
        let iconY = textIcon.iconY
        let iconWidth = textIcon.iconWidth
        let iconHeight = textIcon.iconHeight
        
        let iconPaddingLeft = magicalIconButtonViewModel.iconPaddingLeft
        let iconPaddingRight = magicalIconButtonViewModel.iconPaddingRight
        let iconPaddingTop = IconButtonLayout.getIconPaddingTop(orientation: orientation,
                                                                flavor: .long,
                                                                numberOfLines: 1)
        
        let contentHeight = magicalIconButtonViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        let color = magicalIconButtonViewModel.getTextAndIconColor(isPressed: isPressed)
        
        return VStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingTop))
                .background(Color(red: 0.85, green: 0.65, blue: 0.55, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingTop))
#endif
            
            ZStack {
                IconBox(icon: textIcon,
                        imageWidth: imageWidth,
                        imageHeight: imageHeight,
                        iconX: iconX,
                        iconY: iconY,
                        iconWidth: iconWidth,
                        iconHeight: iconHeight,
                        iconPaddingLeft: iconPaddingLeft,
                        iconPaddingRight: iconPaddingRight,
                        iconPaddingTop: iconPaddingTop,
                        color: color)
            }
            .frame(height: CGFloat(contentHeight))
            
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: 24.0)
                .background(Color(red: 0.87, green: 0.67, blue: 1.0, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
#endif
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingBottom))
                .background(Color(red: 0.65, green: 0.85, blue: 0.75, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingBottom))
#endif
            
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalIconButtonViewModel.layoutHeight))
    }
    
}

