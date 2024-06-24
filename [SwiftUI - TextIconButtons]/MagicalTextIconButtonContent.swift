//
//  MagicalTextIconButtonContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import SwiftUI

struct MagicalTextIconButtonContent: View {
    
    @Environment(MagicalTextIconButtonViewModel.self) var magicalTextIconButtonViewModel: MagicalTextIconButtonViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isPressed: Bool
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    var body: some View {
        
        let configuration = magicalTextIconButtonViewModel.textIconButtonConfiguration
        let textIcon = configuration.getTextIcon(orientation: orientation,
                                                 layoutSchemeFlavor: layoutSchemeFlavor)
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let nameLabelFont = TextIconButtonLayout.getNameLabelFont(orientation: orientation,
                                                                  flavor: layoutSchemeFlavor)
        let nameLabelPaddingBottom = TextIconButtonLayout.getNameLabelPaddingBottom(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    numberOfLines: numberOfLines)
        let nameLabelPaddingLeft = magicalTextIconButtonViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalTextIconButtonViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = TextIconButtonLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor)
        
        let nameLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            nameLabelTextWidth = configuration.nameLabelWidthLong
        case .stackedLarge:
            nameLabelTextWidth = configuration.nameLabelWidthStackedLarge
        case .stackedMedium:
            nameLabelTextWidth = configuration.nameLabelWidthStackedMedium
        case .stackedSmall:
            nameLabelTextWidth = configuration.nameLabelWidthStackedSmall
        }
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelWidth = nameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        /*
        let iconWidth = textIcon.iconWidth
        let iconHeight: Int
        if layoutSchemeFlavor.isStacked {
            if Device.isPad {
                if numberOfLines == 2 {
                    iconHeight = 27
                } else {
                    iconHeight = 41
                }
            } else {
                if orientation.isLandscape {
                    if numberOfLines == 2 {
                        iconHeight = 17
                    } else {
                        iconHeight = 27
                    }
                } else {
                    if numberOfLines == 2 {
                        iconHeight = 21
                    } else {
                        iconHeight = 32
                    }
                }
            }
        } else {
            if Device.isPad {
                iconHeight = 42
            } else {
                if orientation.isLandscape {
                    iconHeight = 27
                } else {
                    iconHeight = 32
                }
            }
        }
        */
        
        let imageWidth = textIcon.imageWidth
        let imageHeight = textIcon.imageHeight
        let iconX = textIcon.iconX
        let iconY = textIcon.iconY
        let iconWidth = textIcon.iconWidth
        let iconHeight = textIcon.iconHeight
        
        let iconPaddingLeft = magicalTextIconButtonViewModel.iconPaddingLeft
        let iconPaddingRight = magicalTextIconButtonViewModel.iconPaddingRight
        let iconPaddingTop = TextIconButtonLayout.getIconPaddingTop(orientation: orientation,
                                                                    flavor: layoutSchemeFlavor,
                                                                    numberOfLines: numberOfLines)
        
        let contentHeight = magicalTextIconButtonViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        let color = magicalTextIconButtonViewModel.getTextAndIconColor(isPressed: isPressed)
        
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
                switch layoutSchemeFlavor {
                case .long:
                    HStack(spacing: 0.0) {
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
                        LabelBox(line1: line1,
                                 line2: line2,
                                 numberOfLines: numberOfLines,
                                 width: nameLabelWidth,
                                 paddingLeft: nameLabelPaddingLeft,
                                 paddingRight: nameLabelPaddingRight,
                                 paddingBottom: 0,
                                 lineHeight: lineHeight,
                                 spacingVertical: nameLabelVerticalSpacing,
                                 font: nameLabelFont, 
                                 color: color)
                    }
                case .stackedLarge, .stackedMedium, .stackedSmall:
                    
                    ZStack {
                        VStack(spacing: 0.0) {
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
                            Spacer(minLength: 0.0)
                        }
                        VStack(spacing: 0.0) {
                            Spacer(minLength: 0.0)
                            LabelBox(line1: line1,
                                     line2: line2,
                                     numberOfLines: numberOfLines,
                                     width: nameLabelWidth,
                                     paddingLeft: nameLabelPaddingLeft,
                                     paddingRight: nameLabelPaddingRight,
                                     paddingBottom: nameLabelPaddingBottom,
                                     lineHeight: lineHeight,
                                     spacingVertical: nameLabelVerticalSpacing,
                                     font: nameLabelFont,
                                     color: color)
                        }
                    }
                }
            }
            .frame(height: CGFloat(contentHeight))
            
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
               height: CGFloat(magicalTextIconButtonViewModel.layoutHeight))
    }
}

