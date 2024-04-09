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
        let textIcon = magicalIconButtonViewModel.getTextIcon()
        let iconWidth = 52
        let iconHeight: Int
        if Device.isPad {
            iconHeight = 44
        } else {
            switch orientation {
            case .landscape:
                iconHeight = 28
            case .portrait:
                iconHeight = 32
            }
        }
        
        let iconPaddingLeft = magicalIconButtonViewModel.iconPaddingLeft
        let iconPaddingRight = magicalIconButtonViewModel.iconPaddingRight
        let iconPaddingTop = IconButtonLayout.getIconPaddingTop(orientation: orientation,
                                                                flavor: .long,
                                                                numberOfLines: 1)
        
        let contentHeight = magicalIconButtonViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
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
                        iconWidth: iconWidth,
                        iconHeight: iconHeight,
                        iconPaddingLeft: iconPaddingLeft,
                        iconPaddingRight: iconPaddingRight,
                        iconPaddingTop: iconPaddingTop)
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

