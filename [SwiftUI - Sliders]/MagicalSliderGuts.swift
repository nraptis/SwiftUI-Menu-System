//
//  MagicalSliderGuts.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/31/24.
//

import SwiftUI

struct MagicalSliderGuts: View {
    
    @Environment(MagicalSliderViewModel.self) var magicalSliderViewModel: MagicalSliderViewModel
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let line1: String?
    let line2: String?
    let numberOfLines: Int
    let layoutWidth: Int
    let layoutHeight: Int
    var body: some View {
        
        let orientation = magicalSliderViewModel.orientation
        let configuration = magicalSliderViewModel.sliderConfiguration
        
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
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
        
        let nameLabelFont = SliderLayout.getNameLabelFont(orientation: orientation,
                                                          flavor: layoutSchemeFlavor)
        let nameLabelPaddingLeft = magicalSliderViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalSliderViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = SliderLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor)
        
        let valueLabelFont = SliderLayout.getValueLabelFont(orientation: orientation, flavor: layoutSchemeFlavor)
        
        let valueLabelPaddingLeft = magicalSliderViewModel.valueLabelPaddingLeft
        let valueLabelPaddingRight = magicalSliderViewModel.valueLabelPaddingRight
        
        let realNameLabelTextWidth: Int
        let layoutNameLabelTextWidth: Int
        let valueLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long, .stackedLarge:
            realNameLabelTextWidth = configuration.realNameLabelWidthLarge
            layoutNameLabelTextWidth = configuration.layoutNameLabelWidthLarge
            valueLabelTextWidth = configuration.valueLabelWidthLarge
        case .stackedMedium:
            realNameLabelTextWidth = configuration.realNameLabelWidthMedium
            layoutNameLabelTextWidth = configuration.layoutNameLabelWidthMedium
            valueLabelTextWidth = configuration.valueLabelWidthMedium
        case .stackedSmall:
            realNameLabelTextWidth = configuration.realNameLabelWidthSmall
            layoutNameLabelTextWidth = configuration.layoutNameLabelWidthSmall
            valueLabelTextWidth = configuration.valueLabelWidthSmall
        }
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelWidth = realNameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        let valueLabelWidth = valueLabelPaddingLeft + valueLabelTextWidth + valueLabelPaddingRight
        
        let nameLabelSpace = layoutNameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        var extraPaddingLeft = (layoutNameLabelTextWidth - realNameLabelTextWidth)
        if extraPaddingLeft < 0 {
            extraPaddingLeft = 0
        }
        
        let color = magicalSliderViewModel.getTextAndIconColor()
        
        return HStack(spacing: 0.0) {
            
            HStack {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(extraPaddingLeft), height: 33)
                    .background(Color.yellow.opacity(0.5))
#else
                Spacer()
                    .frame(width: CGFloat(extraPaddingLeft))
#endif
                
                LabelBoxRightAligned(line1: line1,
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
            .frame(width: CGFloat(nameLabelSpace), height: CGFloat(layoutHeight))
#if INTERFACE_HINTS
            .background(Color.pink.opacity(0.5))
#endif
            
            MagicalSliderBar()
#if INTERFACE_HINTS
                .overlay(RoundedRectangle(cornerRadius: 2.0).stroke().foregroundStyle(Color.red.opacity(0.85)))
#endif
            
            HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(valueLabelPaddingLeft), height: 12.0)
                    .background(Color(red: 0.98, green: 0.65, blue: 0.125, opacity: 0.5))
#else
                Spacer()
                    .frame(width: CGFloat(valueLabelPaddingLeft))
#endif
                
                
                Text(magicalSliderViewModel.getValueString())
                        .font(Font(valueLabelFont))
                        .fixedSize(horizontal: true, vertical: false)
                        .foregroundColor(ToolInterfaceTheme.gray800)
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(height: 12.0)
                    .background(Color(red: 0.98, green: 1.0, blue: 0.98, opacity: 0.5))
#else
                Spacer(minLength: 0.0)
#endif
                
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(valueLabelPaddingRight), height: 12.0)
                    .background(Color(red: 0.98, green: 0.65, blue: 0.125, opacity: 0.5))
#else
                Spacer()
                    .frame(width: CGFloat(valueLabelPaddingRight))
#endif
                
            }
            .frame(width: CGFloat(valueLabelWidth))
        }
    }
}
