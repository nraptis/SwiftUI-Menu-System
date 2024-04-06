//
//  ToolInterfaceElementType.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/19/24.
//

import Foundation
import UIKit

struct ToolInterfaceElementCheckBoxConfiguration {
    let textIconImagePack: TextIconImagePack
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
    
    init(textIconImagePack: TextIconImagePack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.textIconImagePack = textIconImagePack
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
        let iconLong = ToolInterfaceImageLibrary.getTextIcon(numberOfLines: _nameLabelNumberOfLines,
                                                             textIconImagePack: textIconImagePack,
                                                             orientation: orientation,
                                                             layoutSchemeFlavor: .long)
        let iconStacked = ToolInterfaceImageLibrary.getTextIcon(numberOfLines: _nameLabelNumberOfLines,
                                                                textIconImagePack: textIconImagePack,
                                                                orientation: orientation,
                                                                layoutSchemeFlavor: .stackedLarge)
        self.iconWidthLong = iconLong.iconWidth
        self.iconHeightLong = iconLong.iconHeight
        self.iconWidthStacked = iconStacked.iconWidth
        self.iconHeightStacked = iconStacked.iconHeight
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
}

enum ToolInterfaceElementSliderWidthCategory {
    case fullWidth
    case halfWidthLeft // There may be a 1 pixel difference
    case halfWidthRight // There may be a 1 pixel difference
}

struct ToolInterfaceElementSliderConfiguration {
    let textIconImagePack: TextIconImagePack
    let nameLabelLine1: String?
    let nameLabelLine2: String?
    let nameLabelNumberOfLines: Int
    
    // The real text that we use...
    let realNameLabelWidthLong: Int
    let realNameLabelWidthStackedLarge: Int
    let realNameLabelWidthStackedMedium: Int
    let realNameLabelWidthStackedSmall: Int
    
    // For laying out groups of 2, 3, etc...
    // We are going to have them all "space out"
    // the same as the largest of the bunch...!!!
    let layoutNameLabelWidthLong: Int
    let layoutNameLabelWidthStackedLarge: Int
    let layoutNameLabelWidthStackedMedium: Int
    let layoutNameLabelWidthStackedSmall: Int
    
    let valueLabelWidthLong: Int
    let valueLabelWidthStackedLarge: Int
    let valueLabelWidthStackedMedium: Int
    let valueLabelWidthStackedSmall: Int
    
    let iconWidthLong: Int
    let iconHeightLong: Int
    let iconWidthStacked: Int
    let iconHeightStacked: Int
    
    // For the slider itself, this is where we control max / min, etc
    let minimumValue: Float
    let maximumValue: Float
    let valueWholeNumberCount: Int
    let valueDecimalCount: Int
    
    let widthCategory: ToolInterfaceElementSliderWidthCategory
    
    init(textIconImagePack: TextIconImagePack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?,
         friend_1_NameLabelLine1: String?,
         friend_1_NameLabelLine2: String?,
         friend_2_NameLabelLine1: String?,
         friend_2_NameLabelLine2: String?,
         friend_3_NameLabelLine1: String?,
         friend_3_NameLabelLine2: String?,
         friend_4_NameLabelLine1: String?,
         friend_4_NameLabelLine2: String?,
         minimumValue: Float,
         maximumValue: Float,
         valueWholeNumberCount: Int,
         valueDecimalCount: Int,
         widthCategory: ToolInterfaceElementSliderWidthCategory
    ) {
        
        self.textIconImagePack = textIconImagePack
        self.nameLabelLine1 = nameLabelLine1
        self.nameLabelLine2 = nameLabelLine2
        
        let _nameLabelNumberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: nameLabelLine1,
                                                                          line2: nameLabelLine2)
        var _nameLabelWidthLong = SliderLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                     line2: nameLabelLine2,
                                                                     orientation: orientation,
                                                                     flavor: .long) + 2
        var _nameLabelWidthStackedLarge = SliderLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                             line2: nameLabelLine2,
                                                                             orientation: orientation,
                                                                             flavor: .stackedLarge) + 2
        var _nameLabelWidthStackedMedium = SliderLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                              line2: nameLabelLine2,
                                                                              orientation: orientation,
                                                                              flavor: .stackedMedium) + 2
        var _nameLabelWidthStackedSmall = SliderLayout.getNameLabelTextWidth(line1: nameLabelLine1,
                                                                             line2: nameLabelLine2,
                                                                             orientation: orientation,
                                                                             flavor: .stackedSmall) + 2
        
        self.realNameLabelWidthLong = _nameLabelWidthLong
        self.realNameLabelWidthStackedLarge = _nameLabelWidthStackedLarge
        self.realNameLabelWidthStackedMedium = _nameLabelWidthStackedMedium
        self.realNameLabelWidthStackedSmall = _nameLabelWidthStackedSmall
        
        for friendIndex in 0...3 {
            
            var line1: String?
            var line2: String?
            if friendIndex == 0 {
                line1 = friend_1_NameLabelLine1
                line2 = friend_1_NameLabelLine2
            }
            if friendIndex == 1 {
                line1 = friend_2_NameLabelLine1
                line2 = friend_2_NameLabelLine2
            }
            if friendIndex == 2 {
                line1 = friend_3_NameLabelLine1
                line2 = friend_3_NameLabelLine2
            }
            if friendIndex == 3 {
                line1 = friend_4_NameLabelLine1
                line2 = friend_4_NameLabelLine2
            }
            if line1 != nil || line2 != nil {
                
                let _friendLabelWidthLong = SliderLayout.getNameLabelTextWidth(line1: line1,
                                                                               line2: line2,
                                                                               orientation: orientation,
                                                                               flavor: .long) + 2
                let _friendLabelWidthStackedLarge = SliderLayout.getNameLabelTextWidth(line1: line1,
                                                                                       line2: line2,
                                                                                       orientation: orientation,
                                                                                       flavor: .stackedLarge) + 2
                let _friendLabelWidthStackedMedium = SliderLayout.getNameLabelTextWidth(line1: line1,
                                                                                        line2: line2,
                                                                                        orientation: orientation,
                                                                                        flavor: .stackedMedium) + 2
                let _friendLabelWidthStackedSmall = SliderLayout.getNameLabelTextWidth(line1: line1,
                                                                                       line2: line2,
                                                                                       orientation: orientation,
                                                                                       flavor: .stackedSmall) + 2
                
                if _friendLabelWidthLong > _nameLabelWidthLong {
                    _nameLabelWidthLong = _friendLabelWidthLong
                }
                if _friendLabelWidthStackedLarge > _nameLabelWidthStackedLarge {
                    _nameLabelWidthStackedLarge = _friendLabelWidthStackedLarge
                }
                if _friendLabelWidthStackedMedium > _nameLabelWidthStackedMedium {
                    _nameLabelWidthStackedMedium = _friendLabelWidthStackedMedium
                }
                if _friendLabelWidthStackedSmall > _nameLabelWidthStackedSmall {
                    _nameLabelWidthStackedSmall = _friendLabelWidthStackedSmall
                }
            }
        }
        
        
        
        self.layoutNameLabelWidthLong = _nameLabelWidthLong
        self.layoutNameLabelWidthStackedLarge = _nameLabelWidthStackedLarge
        self.layoutNameLabelWidthStackedMedium = _nameLabelWidthStackedMedium
        self.layoutNameLabelWidthStackedSmall = _nameLabelWidthStackedSmall
        
        let iconLong = ToolInterfaceImageLibrary.getTextIcon(numberOfLines: _nameLabelNumberOfLines,
                                                             textIconImagePack: textIconImagePack,
                                                             orientation: orientation,
                                                             layoutSchemeFlavor: .long)
        let iconStacked = ToolInterfaceImageLibrary.getTextIcon(numberOfLines: _nameLabelNumberOfLines,
                                                                textIconImagePack: textIconImagePack,
                                                                orientation: orientation,
                                                                layoutSchemeFlavor: .stackedLarge)
        self.iconWidthLong = iconLong.iconWidth
        self.iconHeightLong = iconLong.iconHeight
        self.iconWidthStacked = iconStacked.iconWidth
        self.iconHeightStacked = iconStacked.iconHeight
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
        
        valueLabelWidthLong = SliderLayout.getValueLabelTextWidth(line1: exampleString,
                                                                  orientation: orientation,
                                                                  flavor: .long) + 2
        valueLabelWidthStackedLarge = SliderLayout.getValueLabelTextWidth(line1: exampleString,
                                                                          orientation: orientation,
                                                                          flavor: .stackedLarge) + 2
        valueLabelWidthStackedMedium = SliderLayout.getValueLabelTextWidth(line1: exampleString,
                                                                           orientation: orientation,
                                                                           flavor: .stackedMedium) + 2
        valueLabelWidthStackedSmall = SliderLayout.getValueLabelTextWidth(line1: exampleString,
                                                                          orientation: orientation,
                                                                          flavor: .stackedSmall) + 2
        
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue
        self.valueWholeNumberCount = valueWholeNumberCount
        self.valueDecimalCount = valueDecimalCount
        self.widthCategory = widthCategory
    }
}

struct ToolInterfaceElementTextIconButtonConfiguration {
    
    let textIconImagePack: TextIconImagePack
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
    
    init(textIconImagePack: TextIconImagePack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.textIconImagePack = textIconImagePack
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
        let iconLong = ToolInterfaceImageLibrary.getTextIcon(numberOfLines: _nameLabelNumberOfLines, 
                                                             textIconImagePack: textIconImagePack,
                                                             orientation: orientation, 
                                                             layoutSchemeFlavor: .long)
        let iconStacked = ToolInterfaceImageLibrary.getTextIcon(numberOfLines: _nameLabelNumberOfLines, 
                                                                textIconImagePack: textIconImagePack,
                                                                orientation: orientation, 
                                                                layoutSchemeFlavor: .stackedLarge)
        self.iconWidthLong = iconLong.iconWidth
        self.iconHeightLong = iconLong.iconHeight
        self.iconWidthStacked = iconStacked.iconWidth
        self.iconHeightStacked = iconStacked.iconHeight
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
}

struct ToolInterfaceElementSegmentedPickerButtonConfiguration {
    let id: UInt8
    let textIconImagePack: TextIconImagePack
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
         textIconImagePack: TextIconImagePack,
         orientation: Orientation,
         nameLabelLine1: String?,
         nameLabelLine2: String?) {
        self.id = id
        self.textIconImagePack = textIconImagePack
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
        let iconLong = ToolInterfaceImageLibrary.getTextIcon(numberOfLines: _nameLabelNumberOfLines,
                                                             textIconImagePack: textIconImagePack,
                                                             orientation: orientation,
                                                             layoutSchemeFlavor: .long)
        let iconStacked = ToolInterfaceImageLibrary.getTextIcon(numberOfLines: _nameLabelNumberOfLines,
                                                                textIconImagePack: textIconImagePack,
                                                                orientation: orientation,
                                                                layoutSchemeFlavor: .stackedLarge)
        self.iconWidthLong = iconLong.iconWidth
        self.iconHeightLong = iconLong.iconHeight
        self.iconWidthStacked = iconStacked.iconWidth
        self.iconHeightStacked = iconStacked.iconHeight
        self.nameLabelNumberOfLines = _nameLabelNumberOfLines
    }
}

extension ToolInterfaceElementSegmentedPickerButtonConfiguration: Identifiable {
    
}

struct ToolInterfaceElementSegmentedPickerConfiguration {
    let buttonConfigurations: [ToolInterfaceElementSegmentedPickerButtonConfiguration]
}

struct ToolInterfaceElementIconButtonConfiguration {
    let textIconImagePack: TextIconImagePack
    let iconWidth: Int
    init(textIconImagePack: TextIconImagePack,
         orientation: Orientation) {
        self.textIconImagePack = textIconImagePack
        let icon = ToolInterfaceImageLibrary.getTextIcon(numberOfLines: 1,
                                                         textIconImagePack: textIconImagePack,
                                                         orientation: orientation,
                                                         layoutSchemeFlavor: .long)
        
        self.iconWidth = icon.iconWidth
    }
}
