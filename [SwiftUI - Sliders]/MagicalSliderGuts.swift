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
        
        //layoutNameLabelTextWidth
        
        print("extraPaddingLeft = \(extraPaddingLeft)")
        print("LOW: \(magicalSliderViewModel.layoutWidth)")
        
        print("valueLabelWidth = \(valueLabelWidth)")
        
        return HStack(spacing: 0.0) {
            switch layoutSchemeFlavor {
            case .long:
                HStack(spacing: 0.0) {
                    
                    Spacer(minLength: 0.0)
                    
                    IconAndTextHorizontal(orientation: orientation,
                                          line1: line1,
                                          line2: line2,
                                          nameLabelTextWidth: realNameLabelTextWidth,
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
                                          height: layoutHeight)
                    
                }
                .frame(width: CGFloat(iconAndTextLayoutWidth))
            case .stackedLarge, .stackedMedium, .stackedSmall:
                HStack(spacing: 0.0) {
                    Spacer(minLength: 0.0)
                    IconAndTextVertical(orientation: orientation,
                                        line1: line1,
                                        line2: line2,
                                        nameLabelTextWidth: realNameLabelTextWidth,
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
                .frame(width: CGFloat(iconAndTextLayoutWidth))
            }
            
            MagicalSliderBar()
                
                //.background(RoundedRectangle(cornerRadius: 3.0).foregroundStyle(Color.brown.opacity(0.85)))
            
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
            //.overlay(RoundedRectangle(cornerRadius: 8.0).foregroundStyle(Color.green.opacity(0.65)))
            
        }
    }
}
