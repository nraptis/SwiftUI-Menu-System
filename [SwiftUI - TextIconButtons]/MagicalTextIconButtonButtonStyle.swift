//
//  MagicalTextIconButtonButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import SwiftUI

struct MagicalTextIconButtonButtonStyle: ButtonStyle {
    
    @Environment(MagicalTextIconButtonViewModel.self) var magicalTextIconButtonViewModel: MagicalTextIconButtonViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            bodyContent(isPressed: configuration.isPressed)
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalTextIconButtonViewModel.layoutHeight))
        
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        return HStack(spacing: 0.0) {
            MagicalTextIconButtonContent(orientation: orientation,
                                         layoutSchemeFlavor: layoutSchemeFlavor,
                                         isPressed: isPressed,
                                         universalPaddingTop: universalPaddingTop,
                                         universalPaddingBottom: universalPaddingBottom,
                                         layoutWidth: layoutWidth)
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalTextIconButtonViewModel.layoutHeight))
    }
    
}
