//
//  MagicalIconButtonButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import SwiftUI

import SwiftUI

struct MagicalIconButtonButtonStyle: ButtonStyle {
    
    @Environment(MagicalIconButtonViewModel.self) var magicalIconButtonViewModel: MagicalIconButtonViewModel
    
    let orientation: Orientation
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            bodyContent(isPressed: configuration.isPressed)
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalIconButtonViewModel.layoutHeight))
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        return HStack(spacing: 0.0) {
            MagicalIconButtonContent(orientation: orientation,
                                         isPressed: isPressed,
                                         universalPaddingTop: universalPaddingTop,
                                         universalPaddingBottom: universalPaddingBottom,
                                         layoutWidth: layoutWidth)
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalIconButtonViewModel.layoutHeight))
    }
    
}
