//
//  ToolInterfaceElementType.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/19/24.
//

import Foundation
import UIKit

struct ToolInterfaceElementCheckBoxConfiguration {
    let iconPack: CheckBoxIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLong: Int
    let nameLabelWidthStackedLarge: Int
    let nameLabelWidthStackedMedium: Int
    let nameLabelWidthStackedSmall: Int
    let iconWidthLong: Int
    let iconHeightLong: Int
    let iconWidthStacked: Int
    let iconHeightStacked: Int
    
    init(iconPack: CheckBoxIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        nameLabelWidthLong = CheckBoxLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                  line2: nameLabelLine2,
                                                                  orientation: orientation,
                                                                  flavor: .long) + 2
        nameLabelWidthStackedLarge = CheckBoxLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2,
                                                                          orientation: orientation,
                                                                          flavor: .stackedLarge) + 2
        nameLabelWidthStackedMedium = CheckBoxLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                           line2: nameLabelLine2,
                                                                           orientation: orientation,
                                                                           flavor: .stackedMedium) + 2
        nameLabelWidthStackedSmall = CheckBoxLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2,
                                                                          orientation: orientation,
                                                                          flavor: .stackedSmall) + 2
        let iconLong = iconPack.getTextIcon(orientation: orientation,
                                            layoutSchemeFlavor: .long,
                                            numberOfLines: _nameLabelNumberOfLines)
        let iconStacked = iconPack.getTextIcon(orientation: orientation,
                                               layoutSchemeFlavor: .stackedLarge,
                                               numberOfLines: _nameLabelNumberOfLines)
        self.iconWidthLong = iconLong.iconWidth
        self.iconHeightLong = iconLong.iconHeight
        self.iconWidthStacked = iconStacked.iconWidth
        self.iconHeightStacked = iconStacked.iconHeight
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines)
    }
}

enum ToolInterfaceElementSliderWidthCategory {
    case fullWidth
    case halfWidthLeft // There may be a 1 pixel difference
    case halfWidthRight // There may be a 1 pixel difference
}

struct ToolInterfaceElementSliderConfiguration {
    let iconPack: SliderIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    
    // The real text that we use...
    let realNameLabelWidthLarge: Int
    let realNameLabelWidthMedium: Int
    let realNameLabelWidthSmall: Int
    
    // For laying out groups of 2, 3, etc...
    // We are going to have them all "space out"
    // the same as the largest of the bunch...!!!
    let layoutNameLabelWidthLarge: Int
    let layoutNameLabelWidthMedium: Int
    let layoutNameLabelWidthSmall: Int
    
    let valueLabelWidthLarge: Int
    let valueLabelWidthMedium: Int
    let valueLabelWidthSmall: Int
    
    // For the slider itself, this is where we control max / min, etc
    let minimumValue: Float
    let maximumValue: Float
    let valueWholeNumberCount: Int
    let valueDecimalCount: Int
    
    let widthCategory: ToolInterfaceElementSliderWidthCategory
    
    init(iconPack: SliderIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?,
         friend_1_nameLabelLine1: String?,
         friend_1_nameLabelLine2: String?,
         friend_2_nameLabelLine1: String?,
         friend_2_nameLabelLine2: String?,
         friend_3_nameLabelLine1: String?,
         friend_3_nameLabelLine2: String?,
         friend_4_nameLabelLine1: String?,
         friend_4_nameLabelLine2: String?,
         minimumValue: Float,
         maximumValue: Float,
         valueWholeNumberCount: Int,
         valueDecimalCount: Int,
         widthCategory: ToolInterfaceElementSliderWidthCategory
    ) {
        
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        
        var _nameLabelWidthLarge = SliderLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                      line2: nameLabelLine2,
                                                                      orientation: orientation,
                                                                      flavor: .stackedLarge) + 2
        
        var _nameLabelWidthMedium = SliderLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                       line2: nameLabelLine2,
                                                                       orientation: orientation,
                                                                       flavor: .stackedMedium) + 2
        
        var _nameLabelWidthSmall = SliderLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                      line2: nameLabelLine2,
                                                                      orientation: orientation,
                                                                      flavor: .stackedSmall) + 2
        
        self.realNameLabelWidthLarge = _nameLabelWidthLarge
        self.realNameLabelWidthMedium = _nameLabelWidthMedium
        self.realNameLabelWidthSmall = _nameLabelWidthSmall
        
        for friendIndex in 0...3 {
            
            var line1: String?
            var line2: String?
            if friendIndex == 0 {
                line1 = friend_1_nameLabelLine1
                line2 = friend_1_nameLabelLine2
            }
            if friendIndex == 1 {
                line1 = friend_2_nameLabelLine1
                line2 = friend_2_nameLabelLine2
            }
            if friendIndex == 2 {
                line1 = friend_3_nameLabelLine1
                line2 = friend_3_nameLabelLine2
            }
            if friendIndex == 3 {
                line1 = friend_4_nameLabelLine1
                line2 = friend_4_nameLabelLine2
            }
            if line1 != nil || line2 != nil {
                
                let _friendLabelWidthLarge = SliderLayout.getNameLabelTextWidth(line1: line1,
                                                                                line2: line2,
                                                                                orientation: orientation,
                                                                                flavor: .stackedLarge) + 2
                let _friendLabelWidthMedium = SliderLayout.getNameLabelTextWidth(line1: line1,
                                                                                 line2: line2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedMedium) + 2
                let _friendLabelWidthSmall = SliderLayout.getNameLabelTextWidth(line1: line1,
                                                                                line2: line2,
                                                                                orientation: orientation,
                                                                                flavor: .stackedSmall) + 2
                
                if _friendLabelWidthLarge > _nameLabelWidthLarge {
                    _nameLabelWidthLarge = _friendLabelWidthLarge
                }
                if _friendLabelWidthMedium > _nameLabelWidthMedium {
                    _nameLabelWidthMedium = _friendLabelWidthMedium
                }
                if _friendLabelWidthSmall > _nameLabelWidthSmall {
                    _nameLabelWidthSmall = _friendLabelWidthSmall
                }
            }
        }
        
        self.layoutNameLabelWidthLarge = _nameLabelWidthLarge
        self.layoutNameLabelWidthMedium = _nameLabelWidthMedium
        self.layoutNameLabelWidthSmall = _nameLabelWidthSmall
        
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
        
        var exampleStringArray = [Character]()
        var exampleStringIndex = 0
        while exampleStringIndex < valueWholeNumberCount {
            exampleStringArray.append("8")
            exampleStringIndex += 1
        }
        exampleStringArray.append(".")
        exampleStringIndex = 0
        while exampleStringIndex < valueDecimalCount {
            exampleStringArray.append("8")
            exampleStringIndex += 1
        }
        
        let exampleString = String(exampleStringArray)
        
        valueLabelWidthLarge = SliderLayout.getValueLabelTextWidth(line1: exampleString,
                                                                   orientation: orientation,
                                                                   flavor: .stackedLarge) + 2
        valueLabelWidthMedium = SliderLayout.getValueLabelTextWidth(line1: exampleString,
                                                                    orientation: orientation,
                                                                    flavor: .stackedMedium) + 2
        valueLabelWidthSmall = SliderLayout.getValueLabelTextWidth(line1: exampleString,
                                                                   orientation: orientation,
                                                                   flavor: .stackedSmall) + 2
        
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.valueWholeNumberCount = valueWholeNumberCount
        self.valueDecimalCount = valueDecimalCount
        self.widthCategory = widthCategory
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines)
    }
}

struct ToolInterfaceElementTextIconButtonConfiguration {
    
    let iconPack: TextIconButtonIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLong: Int
    let nameLabelWidthStackedLarge: Int
    let nameLabelWidthStackedMedium: Int
    let nameLabelWidthStackedSmall: Int
    let iconWidthLong: Int
    let iconHeightLong: Int
    let iconWidthStacked: Int
    let iconHeightStacked: Int
    
    init(iconPack: TextIconButtonIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        nameLabelWidthLong = TextIconButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                        line2: nameLabelLine2,
                                                                        orientation: orientation,
                                                                        flavor: .long) + 2
        nameLabelWidthStackedLarge = TextIconButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                line2: nameLabelLine2,
                                                                                orientation: orientation,
                                                                                flavor: .stackedLarge) + 2
        nameLabelWidthStackedMedium = TextIconButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                 line2: nameLabelLine2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedMedium) + 2
        nameLabelWidthStackedSmall = TextIconButtonLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                line2: nameLabelLine2,
                                                                                orientation: orientation,
                                                                                flavor: .stackedSmall) + 2
        let iconLong = iconPack.getTextIcon(orientation: orientation,
                                            layoutSchemeFlavor: .long,
                                            numberOfLines: _nameLabelNumberOfLines)
        let iconStacked = iconPack.getTextIcon(orientation: orientation,
                                               layoutSchemeFlavor: .stackedLarge,
                                               numberOfLines: _nameLabelNumberOfLines)
        
        self.iconWidthLong = iconLong.iconWidth
        self.iconHeightLong = iconLong.iconHeight
        self.iconWidthStacked = iconStacked.iconWidth
        self.iconHeightStacked = iconStacked.iconHeight
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines)
    }
}

struct ToolInterfaceElementSegmentedPickerButtonConfiguration {
    let id: UInt8
    let iconPack: CheckBoxIconPack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    let nameLabelWidthLong: Int
    let nameLabelWidthStackedLarge: Int
    let nameLabelWidthStackedMedium: Int
    let nameLabelWidthStackedSmall: Int
    let iconWidthLong: Int
    let iconHeightLong: Int
    let iconWidthStacked: Int
    let iconHeightStacked: Int
    init(id: UInt8,
         iconPack: CheckBoxIconPack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.id = id
        self.iconPack = iconPack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        nameLabelWidthLong = SegmentedPickerLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                         line2: nameLabelLine2,
                                                                         orientation: orientation,
                                                                         flavor: .long) + 2
        nameLabelWidthStackedLarge = SegmentedPickerLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                 line2: nameLabelLine2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedLarge) + 2
        nameLabelWidthStackedMedium = SegmentedPickerLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                  line2: nameLabelLine2,
                                                                                  orientation: orientation,
                                                                                  flavor: .stackedMedium) + 2
        nameLabelWidthStackedSmall = SegmentedPickerLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                                 line2: nameLabelLine2,
                                                                                 orientation: orientation,
                                                                                 flavor: .stackedSmall) + 2
        let iconLong = iconPack.getTextIcon(orientation: orientation,
                                            layoutSchemeFlavor: .long,
                                            numberOfLines: _nameLabelNumberOfLines)
        let iconStacked = iconPack.getTextIcon(orientation: orientation,
                                               layoutSchemeFlavor: .stackedLarge,
                                               numberOfLines: _nameLabelNumberOfLines)
        self.iconWidthLong = iconLong.iconWidth
        self.iconHeightLong = iconLong.iconHeight
        self.iconWidthStacked = iconStacked.iconWidth
        self.iconHeightStacked = iconStacked.iconHeight
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                    numberOfLines: nameLabelNumberOfLines)
    }
}

extension ToolInterfaceElementSegmentedPickerButtonConfiguration: Identifiable {
    
}

struct ToolInterfaceElementSegmentedPickerConfiguration {
    let buttonConfigurations: [ToolInterfaceElementSegmentedPickerButtonConfiguration]
}

struct ToolInterfaceElementIconButtonConfiguration {
    let iconPack: TextIconButtonIconPack
    let iconWidth: Int
    init(iconPack: TextIconButtonIconPack,
         orientation: Orientation) {
        self.iconPack = iconPack
        let icon = iconPack.getTextIcon(orientation: orientation,
                                        layoutSchemeFlavor: .long,
                                        numberOfLines: 1)
        self.iconWidth = icon.iconWidth
    }
    
    func getTextIcon(orientation: Orientation) -> TextIconable {
        return iconPack.getTextIcon(orientation: orientation,
                                    layoutSchemeFlavor: .long,
                                    numberOfLines: 1)
    }
    
}
