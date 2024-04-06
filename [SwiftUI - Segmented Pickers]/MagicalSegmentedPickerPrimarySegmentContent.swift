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
        let textIcon = magicalSegmentedPickerButtonViewModel.getTextIcon(layoutSchemeFlavor: layoutSchemeFlavor)
        
        let universalPaddingLeft = magicalSegmentedPickerButtonViewModel.universalPaddingLeft
        let universalPaddingRight = magicalSegmentedPickerButtonViewModel.universalPaddingRight
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = magicalSegmentedPickerButtonViewModel.segmentedPickerButtonConfiguration.nameLabelNumberOfLines
        
        let iconWidth = textIcon.iconWidth
        
        let iconHeight: Int
        if layoutSchemeFlavor.isStacked {
            if Device.isPad {
                if numberOfLines == 2 {
                    iconHeight = 22
                } else {
                    iconHeight = 36
                }
            } else {
                if numberOfLines == 2 {
                    iconHeight = 16
                } else {
                    iconHeight = 26
                }
            }
        } else {
            iconHeight = textIcon.iconHeight
        }
        
        
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
        let iconPaddingLeft = magicalSegmentedPickerButtonViewModel.iconPaddingLeft
        let iconPaddingRight = magicalSegmentedPickerButtonViewModel.iconPaddingRight
        let iconPaddingTop = SegmentedPickerLayout.getIconPaddingTop(orientation: orientation,
                                                            flavor: layoutSchemeFlavor,
                                                            numberOfLines: numberOfLines)
        
        return VStack(spacing: 0.0) {

#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingTop))
                .background(Color(red: 0.85, green: 0.65, blue: 0.55, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingTop))
#endif
            
            HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                    .background(Color(red: 0.85, green: 0.45, blue: 0.65, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(universalPaddingLeft))
#endif
                
                switch layoutSchemeFlavor {
                case .long:
                    HStack(spacing: 0.0) {
                        
                        let horizontalHeight = magicalSegmentedPickerViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
                        
                        IconAndTextHorizontal(orientation: orientation,
                                              line1: line1,
                                              line2: line2,
                                              nameLabelTextWidth: nameLabelTextWidth,
                                              nameLabelPaddingLeft: nameLabelPaddingLeft,
                                              nameLabelPaddingRight: nameLabelPaddingRight,
                                              nameLabelPaddingBottom: nameLabelPaddingBottom,
                                              nameLabelVerticalSpacing: nameLabelVerticalSpacing,
                                              icon: textIcon,
                                              iconWidth: textIcon.iconWidth,
                                              iconHeight: iconHeight,
                                              iconPaddingLeft: iconPaddingLeft,
                                              iconPaddingRight: iconPaddingRight,
                                              font: nameLabelFont,
                                              height: horizontalHeight)
                    }
                case .stackedLarge, .stackedMedium, .stackedSmall:
                    HStack(spacing: 0.0) {
                        IconAndTextVertical(orientation: orientation,
                                            line1: line1,
                                            line2: line2,
                                            nameLabelTextWidth: nameLabelTextWidth,
                                            nameLabelPaddingLeft: nameLabelPaddingLeft,
                                            nameLabelPaddingRight: nameLabelPaddingRight,
                                            nameLabelPaddingBottom: nameLabelPaddingBottom,
                                            nameLabelVerticalSpacing: nameLabelVerticalSpacing,
                                            icon: textIcon,
                                            iconWidth: iconWidth,
                                            iconHeight: iconHeight,
                                            iconPaddingLeft: iconPaddingLeft,
                                            iconPaddingRight: iconPaddingRight,
                                            iconPaddingTop: iconPaddingTop,
                                            font: nameLabelFont)
                    }
                }
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                    .background(Color(red: 1.0, green: 0.25, blue: 0.75, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(universalPaddingRight))
#endif
                
            }

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
