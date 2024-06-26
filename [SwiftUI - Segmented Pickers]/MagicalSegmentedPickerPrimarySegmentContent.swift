//
//  MagicalSegmentedPickerPrimarySegmentContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/24/24.
//

import SwiftUI

struct MagicalSegmentedPickerPrimarySegmentContent: View {
    
    @Environment(MagicalSegmentedPickerViewModel.self) var magicalSegmentedPickerViewModel: MagicalSegmentedPickerViewModel
    @Environment(MagicalSegmentedPickerButtonViewModel.self) var magicalSegmentedPickerButtonViewModel: MagicalSegmentedPickerButtonViewModel
    let index: Int
    let isSelected: Bool
    let isPressed: Bool
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    
    var body: some View {
        
        let configuration = magicalSegmentedPickerButtonViewModel.segmentedPickerButtonConfiguration
        let textIcon = configuration.getTextIcon(orientation: orientation, layoutSchemeFlavor: layoutSchemeFlavor)
        
        let universalPaddingLeft = magicalSegmentedPickerButtonViewModel.universalPaddingLeft
        let universalPaddingRight = magicalSegmentedPickerButtonViewModel.universalPaddingRight
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = magicalSegmentedPickerButtonViewModel.segmentedPickerButtonConfiguration.nameLabelNumberOfLines
        
        /*
        let iconWidth = textIcon.iconWidth
        let iconHeight: Int
        if layoutSchemeFlavor.isStacked {
            if Device.isPad {
                if numberOfLines == 2 {
                    iconHeight = 20
                } else {
                    iconHeight = 33
                }
            } else {
                if orientation.isLandscape {
                    if numberOfLines == 2 {
                        iconHeight = 14
                    } else {
                        iconHeight = 22
                    }
                } else {
                    if numberOfLines == 2 {
                        iconHeight = 18
                    } else {
                        iconHeight = 28
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
        
        
        
        let nameLabelFont = SegmentedPickerLayout.getNameLabelFont(orientation: orientation,
                                                                  flavor: layoutSchemeFlavor)
        let nameLabelPaddingBottom = SegmentedPickerLayout.getNameLabelPaddingBottom(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                numberOfLines: numberOfLines)
        let nameLabelPaddingLeft = magicalSegmentedPickerButtonViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalSegmentedPickerButtonViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = SegmentedPickerLayout.getNameLabelVerticalSpacing(orientation: orientation,
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
        
        let iconPaddingLeft = magicalSegmentedPickerButtonViewModel.iconPaddingLeft
        let iconPaddingRight = magicalSegmentedPickerButtonViewModel.iconPaddingRight
        let iconPaddingTop = SegmentedPickerLayout.getIconPaddingTop(orientation: orientation,
                                                            flavor: layoutSchemeFlavor,
                                                            numberOfLines: numberOfLines)
        
        let contentHeight = magicalSegmentedPickerViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        let color = magicalSegmentedPickerViewModel.getTextAndIconColor(isPressed: isPressed)
        
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
                HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                    Spacer()
                        .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                        .background(Color(red: 0.85, green: 0.45, blue: 0.65, opacity: 0.40))
#else
                    Spacer()
                        .frame(width: CGFloat(universalPaddingLeft))
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
                        .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                        .background(Color(red: 1.0, green: 0.25, blue: 0.75, opacity: 0.40))
#else
                    Spacer()
                        .frame(width: CGFloat(universalPaddingRight))
#endif
                
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
        .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.width),
               height: CGFloat(magicalSegmentedPickerViewModel.layoutHeight))
    }
}
