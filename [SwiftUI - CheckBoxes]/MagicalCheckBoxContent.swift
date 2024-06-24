//
//  MagicalCheckBoxContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import SwiftUI

struct MagicalCheckBoxContent: View {
    
    @Environment(MagicalCheckBoxViewModel.self) var magicalCheckBoxViewModel: MagicalCheckBoxViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isPressed: Bool
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    var body: some View {
        
        let configuration = magicalCheckBoxViewModel.checkBoxConfiguration
        let textIcon = configuration.getTextIcon(orientation: orientation,
                                                 layoutSchemeFlavor: layoutSchemeFlavor)
        
        let buttonUniversalPaddingLeft = magicalCheckBoxViewModel.buttonUniversalPaddingLeft
        let buttonUniversalPaddingRight = magicalCheckBoxViewModel.buttonUniversalPaddingRight
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        
        let imageWidth = textIcon.imageWidth
        let imageHeight = textIcon.imageHeight
        let iconX = textIcon.iconX
        let iconY = textIcon.iconY
        let iconWidth = textIcon.iconWidth
        let iconHeight = textIcon.iconHeight
        
        /*
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
        
        let nameLabelFont = CheckBoxLayout.getNameLabelFont(orientation: orientation,
                                                                  flavor: layoutSchemeFlavor)
        let nameLabelPaddingBottom = CheckBoxLayout.getNameLabelPaddingBottom(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                numberOfLines: numberOfLines)
        let nameLabelPaddingLeft = magicalCheckBoxViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalCheckBoxViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = CheckBoxLayout.getNameLabelVerticalSpacing(orientation: orientation,
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
        
        let iconPaddingLeft = magicalCheckBoxViewModel.iconPaddingLeft
        let iconPaddingRight = magicalCheckBoxViewModel.iconPaddingRight
        let iconPaddingTop = CheckBoxLayout.getIconPaddingTop(orientation: orientation,
                                                              flavor: layoutSchemeFlavor,
                                                              numberOfLines: numberOfLines)
        
        let checkBoxWidth = magicalCheckBoxViewModel.checkBoxWidth
        let checkBoxHeight = magicalCheckBoxViewModel.checkBoxHeight
        
        let checkBoxPaddingLeft = magicalCheckBoxViewModel.checkBoxPaddingLeft
        let checkBoxPaddingRight = magicalCheckBoxViewModel.checkBoxPaddingRight
        
        let contentHeight = magicalCheckBoxViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        let color = magicalCheckBoxViewModel.getTextAndIconColor(isPressed: isPressed)
        
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
                    .frame(width: CGFloat(buttonUniversalPaddingLeft), height: 28.0)
                    .background(Color(red: 0.95, green: 0.65, blue: 0.45, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(buttonUniversalPaddingLeft))
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
                    .frame(width: CGFloat(buttonUniversalPaddingRight), height: 28.0)
                    .background(Color(red: 0.95, green: 0.65, blue: 0.45, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(buttonUniversalPaddingRight))
#endif
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(checkBoxPaddingLeft), height: 28.0)
                    .background(Color(red: 0.45, green: 0.65, blue: 0.95, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(checkBoxPaddingLeft))
#endif
                
                getCheckBox(width: checkBoxWidth, height: checkBoxHeight)
                
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(checkBoxPaddingRight), height: 28.0)
                .background(Color(red: 0.45, green: 0.65, blue: 0.95, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(checkBoxPaddingRight))
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
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalCheckBoxViewModel.layoutHeight))
    }
    
    func getCheckBox(width: Int, height: Int) -> some View {
        ZStack {
            GeometryReader() { geometry in
                
                Style.checkMark(width: geometry.size.width - 4.0,
                                height: geometry.size.height - 4.0)
                .foregroundStyle(magicalCheckBoxViewModel.isChecked ? ToolInterfaceTheme.checkMarkGreen : ToolInterfaceTheme.gray200)
                .offset(x: 2.0, y: 2.0)
            }
        }
        .frame(width: CGFloat(width),
               height: CGFloat(height))
        .background(getCheckBoxFillRect(isPressed: isPressed, width: width, height: height))
        .background(getCheckBoxStrokeRect(isPressed: isPressed, width: width, height: height))
        
    }
    
    func getCheckBoxStrokeRect(isPressed: Bool, width: Int, height: Int) -> some View {
        let cornerRadius = CheckBoxLayout.getCheckBoxCornerRadiusOuter(orientation: orientation)
        return RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .frame(width: CGFloat(width),
                   height: CGFloat(height))
            .foregroundStyle(ToolInterfaceTheme.gray500)
    }
    
    func getCheckBoxFillRect(isPressed: Bool, width: Int, height: Int) -> some View {
        
        let lineThickness = CheckBoxLayout.getCheckBoxLineThickness(orientation: orientation)
        let cornerRadius = CheckBoxLayout.getCheckBoxCornerRadiusInner(orientation: orientation)

        let color: Color
        if isPressed {
            color = ToolInterfaceTheme.gray100.opacity(0.5)
        } else {
            color = ToolInterfaceTheme.gray100
        }
        
        let width = CGFloat(width - (lineThickness + lineThickness))
        let height = CGFloat(height - (lineThickness + lineThickness))
        
        return RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .frame(width: width, height: height)
            .foregroundStyle(color)
    }
    
}

