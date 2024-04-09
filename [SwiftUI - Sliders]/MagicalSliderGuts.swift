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
        let textIcon = magicalSliderViewModel.getTextIcon(layoutSchemeFlavor: layoutSchemeFlavor)
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
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
        
        let nameLabelFont = SliderLayout.getNameLabelFont(orientation: orientation,
                                                          flavor: layoutSchemeFlavor)
        let nameLabelPaddingBottom = SliderLayout.getNameLabelPaddingBottom(orientation: orientation,
                                                                            flavor: layoutSchemeFlavor,
                                                                            numberOfLines: numberOfLines)
        
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
        case .long:
            realNameLabelTextWidth = configuration.realNameLabelWidthLong
            layoutNameLabelTextWidth = configuration.layoutNameLabelWidthLong
            valueLabelTextWidth = configuration.valueLabelWidthLong
        case .stackedLarge:
            realNameLabelTextWidth = configuration.realNameLabelWidthStackedLarge
            layoutNameLabelTextWidth = configuration.layoutNameLabelWidthStackedLarge
            valueLabelTextWidth = configuration.valueLabelWidthStackedLarge
        case .stackedMedium:
            realNameLabelTextWidth = configuration.realNameLabelWidthStackedMedium
            layoutNameLabelTextWidth = configuration.layoutNameLabelWidthStackedMedium
            valueLabelTextWidth = configuration.valueLabelWidthStackedMedium
        case .stackedSmall:
            realNameLabelTextWidth = configuration.realNameLabelWidthStackedSmall
            layoutNameLabelTextWidth = configuration.layoutNameLabelWidthStackedSmall
            valueLabelTextWidth = configuration.valueLabelWidthStackedSmall
        }
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelWidth = layoutNameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        let valueLabelWidth = valueLabelPaddingLeft + valueLabelTextWidth + valueLabelPaddingRight
        
        let iconPaddingLeft = magicalSliderViewModel.iconPaddingLeft
        let iconPaddingRight = magicalSliderViewModel.iconPaddingRight
        let iconPaddingTop = SliderLayout.getIconPaddingTop(orientation: orientation,
                                                            flavor: layoutSchemeFlavor,
                                                            numberOfLines: numberOfLines)
        
        var iconAndTextLayoutWidth = 0
        
        let iconSpace = iconWidth + iconPaddingLeft + iconPaddingRight
        let nameLabelSpace = layoutNameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        switch layoutSchemeFlavor {
        case .long:
            iconAndTextLayoutWidth += iconSpace
            iconAndTextLayoutWidth += nameLabelSpace
        case .stackedLarge, .stackedMedium, .stackedSmall:
            iconAndTextLayoutWidth = max(iconSpace, nameLabelSpace)
        }
        
        var extraPaddingLeft = 0
        switch layoutSchemeFlavor {
        case .long:
            extraPaddingLeft = (layoutNameLabelTextWidth - realNameLabelTextWidth)
            if extraPaddingLeft < 0 {
                extraPaddingLeft = 0
            }
        case .stackedLarge, .stackedMedium, .stackedSmall:
            let realNameLabelSpace = realNameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
            
            let widthReal = max(realNameLabelSpace, iconSpace)
            let widthLayout = max(nameLabelSpace, iconSpace)
            extraPaddingLeft = (widthLayout - widthReal)
            if extraPaddingLeft < 0 {
                extraPaddingLeft = 0
            }
        }

        return HStack(spacing: 0.0) {
            
            ZStack {
                switch layoutSchemeFlavor {
                case .long:
                    HStack(spacing: 0.0) {
                        IconBox(icon: textIcon,
                                iconWidth: iconWidth,
                                iconHeight: iconHeight,
                                iconPaddingLeft: iconPaddingLeft,
                                iconPaddingRight: iconPaddingRight,
                                iconPaddingTop: iconPaddingTop)
                        LabelBox(line1: line1,
                                 line2: line2,
                                 numberOfLines: numberOfLines,
                                 width: nameLabelWidth,
                                 paddingLeft: nameLabelPaddingLeft,
                                 paddingRight: nameLabelPaddingRight,
                                 paddingBottom: 0,
                                 lineHeight: lineHeight,
                                 spacingVertical: nameLabelVerticalSpacing,
                                 font: nameLabelFont)
                    }
                case .stackedLarge, .stackedMedium, .stackedSmall:
                    ZStack {
                        VStack(spacing: 0.0) {
                            IconBox(icon: textIcon,
                                    iconWidth: iconWidth,
                                    iconHeight: iconHeight,
                                    iconPaddingLeft: iconPaddingLeft,
                                    iconPaddingRight: iconPaddingRight,
                                    iconPaddingTop: iconPaddingTop)
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
                                     font: nameLabelFont)
                        }
                    }
                }
            }
            .frame(height: CGFloat(layoutHeight))
            
            MagicalSliderBar()
            
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
                        .foregroundColor(.white)
                
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
