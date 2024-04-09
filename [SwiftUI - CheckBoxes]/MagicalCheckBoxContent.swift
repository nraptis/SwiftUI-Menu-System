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
        let textIcon = magicalCheckBoxViewModel.getTextIcon(layoutSchemeFlavor: layoutSchemeFlavor)
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
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
                .frame(height: CGFloat(contentHeight))
                
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
                
                Style.checkMark(width: geometry.size.width,
                                height: geometry.size.height)
            }
        }
        .frame(width: CGFloat(width),
               height: CGFloat(height))
        .background(RoundedRectangle(cornerRadius: 6.0).foregroundStyle(LinearGradient(colors: [Color.yellow.opacity(0.5), Color.teal.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)))
        
    }
    
    func getCheckBoxStrokeRect(isPressed: Bool, width: Int, height: Int) -> some View {
        let cornerRadius = CheckBoxLayout.getCornerRadiusOuter(orientation: orientation)
        let width = layoutWidth
        let height = magicalCheckBoxViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        return RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .frame(width: CGFloat(width),
                   height: CGFloat(height))
            .foregroundStyle(Color.white)
    }
    
    func getCheckBoxFillRect(isPressed: Bool, width: Int, height: Int) -> some View {
        
        let lineThickness = CheckBoxLayout.getCheckBoxLineThickness(orientation: orientation)
        let cornerRadius = CheckBoxLayout.getCornerRadiusInner(orientation: orientation)

        let color: Color
        if isPressed {
            color = .orange
        } else {
            color = .gray
        }
        
        let width = CGFloat(width - (lineThickness + lineThickness))
        let height = CGFloat(height - (lineThickness + lineThickness))
        
        return RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .frame(width: width, height: height)
            .foregroundStyle(color)
    }
    
}

