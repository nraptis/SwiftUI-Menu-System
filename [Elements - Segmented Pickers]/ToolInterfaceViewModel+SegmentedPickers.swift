//
//  ToolInterfaceViewModel+SegmentedPickers.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getSegmentFlex(orientation: Orientation,
                               configuration: ToolInterfaceElementSegmentedPickerConfiguration,
                               neighborTypeLeft: ToolInterfaceElementType?,
                               neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        
        let numberOfButtons = configuration.buttonConfigurations.count
        
        var greatestStandardWidthLong = 0
        var greatestStandardWidthStackedLarge = 0
        var greatestStandardWidthStackedMedium = 0
        var greatestStandardWidthStackedSmall = 0
        
        var sumMinimumWidthLong = 0
        var sumStandardWidthLong = 0
        
        var sumMinimumWidthStackedLarge = 0
        var sumStandardWidthStackedLarge = 0
        
        var sumMinimumWidthStackedMedium = 0
        var sumStandardWidthStackedMedium = 0
        
        var sumMinimumWidthStackedSmall = 0
        var sumStandardWidthStackedSmall = 0
        
        for buttonConfiguration in configuration.buttonConfigurations {
            
            let iconPack = buttonConfiguration.iconPack
            
            let numberOfLines = buttonConfiguration.nameLabelNumberOfLines
            
            let minimumWidthLong = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthLong,
                                                                                      nameLabelNumberOfLines: numberOfLines,
                                                                                      iconPack: iconPack,
                                                                                      orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .squeezed)
            
            let standardWidthLong = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthLong,
                                                                                       nameLabelNumberOfLines: numberOfLines,
                                                                                       iconPack: iconPack,
                                                                                       orientation: orientation,
                                                                                       flavor: .long,
                                                                                       squeeze: .standard)
            let minimumWidthStackedLarge = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedLarge,
                                                                                              nameLabelNumberOfLines: numberOfLines,
                                                                                              iconPack: iconPack,
                                                                                              orientation: orientation,
                                                                                              flavor: .stackedLarge,
                                                                                              squeeze: .squeezed)
            let standardWidthStackedLarge = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedLarge,
                                                                                               nameLabelNumberOfLines: numberOfLines,
                                                                                               iconPack: iconPack,
                                                                                               orientation: orientation,
                                                                                               flavor: .stackedLarge,
                                                                                               squeeze: .standard)
            
            let minimumWidthStackedMedium = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedMedium,
                                                                                               nameLabelNumberOfLines: numberOfLines,
                                                                                               iconPack: iconPack,
                                                                                               orientation: orientation,
                                                                                               flavor: .stackedMedium,
                                                                                               squeeze: .squeezed)
            
            let standardWidthStackedMedium = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedMedium,
                                                                                                nameLabelNumberOfLines: numberOfLines,
                                                                                                iconPack: iconPack,
                                                                                                orientation: orientation,
                                                                                                flavor: .stackedMedium,
                                                                                                squeeze: .standard)
            
            let minimumWidthStackedSmall = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedSmall,
                                                                                              nameLabelNumberOfLines: numberOfLines,
                                                                                              iconPack: iconPack,
                                                                                              orientation: orientation,
                                                                                              flavor: .stackedSmall,
                                                                                              squeeze: .squeezed)
            let standardWidthStackedSmall = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedSmall,
                                                                                               nameLabelNumberOfLines: numberOfLines,
                                                                                               iconPack: iconPack,
                                                                                               orientation: orientation,
                                                                                               flavor: .stackedSmall,
                                                                                               squeeze: .standard)
            
            greatestStandardWidthLong = max(greatestStandardWidthLong, standardWidthLong)
            greatestStandardWidthStackedLarge = max(greatestStandardWidthStackedLarge, standardWidthStackedLarge)
            greatestStandardWidthStackedMedium = max(greatestStandardWidthStackedMedium, standardWidthStackedMedium)
            greatestStandardWidthStackedSmall = max(greatestStandardWidthStackedSmall, standardWidthStackedSmall)
            
            sumMinimumWidthLong += minimumWidthLong
            sumStandardWidthLong += standardWidthLong
            
            sumMinimumWidthStackedLarge += minimumWidthStackedLarge
            sumStandardWidthStackedLarge += standardWidthStackedLarge
            
            sumMinimumWidthStackedMedium += minimumWidthStackedMedium
            sumStandardWidthStackedMedium += standardWidthStackedMedium
            
            sumMinimumWidthStackedSmall += minimumWidthStackedSmall
            sumStandardWidthStackedSmall += standardWidthStackedSmall
        }
        
        let universalPaddingLeftLongSqueezed = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                             flavor: .long,
                                                                                             squeeze: .squeezed,
                                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                                             neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftLongStandard = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                             flavor: .long,
                                                                                             squeeze: .standard,
                                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                                             neighborTypeRight: neighborTypeRight)
        
        let universalPaddingRightLongSqueezed = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                               flavor: .long,
                                                                                               squeeze: .squeezed,
                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                               neighborTypeRight: neighborTypeRight)
        let universalPaddingRightLongStandard = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                               flavor: .long,
                                                                                               squeeze: .standard,
                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                               neighborTypeRight: neighborTypeRight)
        
        var buttonUniversalPaddingLeftLongSqueezed = SegmentedPickerLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                         flavor: .long,
                                                                                                         squeeze: .squeezed)
        var buttonUniversalPaddingLeftLongStandard = SegmentedPickerLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                         flavor: .long,
                                                                                                         squeeze: .standard)
        var buttonUniversalPaddingRightLongSqueezed = SegmentedPickerLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                           flavor: .long,
                                                                                                           squeeze: .squeezed)
        var buttonUniversalPaddingRightLongStandard = SegmentedPickerLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                           flavor: .long,
                                                                                                           squeeze: .standard)
        
        let universalPaddingLeftStackedLargeSqueezed = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                     flavor: .stackedLarge,
                                                                                                     squeeze: .squeezed,
                                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                                     neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStackedLargeStandard = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                     flavor: .stackedLarge,
                                                                                                     squeeze: .standard,
                                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                                     neighborTypeRight: neighborTypeRight)
        
        let universalPaddingRightStackedLargeSqueezed = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                       flavor: .stackedLarge,
                                                                                                       squeeze: .squeezed,
                                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                                       neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStackedLargeStandard = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                       flavor: .stackedLarge,
                                                                                                       squeeze: .standard,
                                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                                       neighborTypeRight: neighborTypeRight)
        
        var buttonUniversalPaddingLeftStackedLargeSqueezed = SegmentedPickerLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                                 flavor: .stackedLarge,
                                                                                                                 squeeze: .squeezed)
        var buttonUniversalPaddingLeftStackedLargeStandard = SegmentedPickerLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                                 flavor: .stackedLarge,
                                                                                                                 squeeze: .standard)
        var buttonUniversalPaddingRightStackedLargeSqueezed = SegmentedPickerLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                                   flavor: .stackedLarge,
                                                                                                                   squeeze: .squeezed)
        var buttonUniversalPaddingRightStackedLargeStandard = SegmentedPickerLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                                   flavor: .stackedLarge,
                                                                                                                   squeeze: .standard)
        
        let universalPaddingLeftStackedMediumSqueezed = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                      flavor: .stackedMedium,
                                                                                                      squeeze: .squeezed,
                                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                                      neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStackedMediumStandard = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                      flavor: .stackedMedium,
                                                                                                      squeeze: .standard,
                                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                                      neighborTypeRight: neighborTypeRight)
        
        let universalPaddingRightStackedMediumSqueezed = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                        flavor: .stackedMedium,
                                                                                                        squeeze: .squeezed,
                                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                                        neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStackedMediumStandard = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                        flavor: .stackedMedium,
                                                                                                        squeeze: .standard,
                                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                                        neighborTypeRight: neighborTypeRight)
        
        var buttonUniversalPaddingLeftStackedMediumSqueezed = SegmentedPickerLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                                  flavor: .stackedMedium,
                                                                                                                  squeeze: .squeezed)
        var buttonUniversalPaddingLeftStackedMediumStandard = SegmentedPickerLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                                  flavor: .stackedMedium,
                                                                                                                  squeeze: .standard)
        var buttonUniversalPaddingRightStackedMediumSqueezed = SegmentedPickerLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                                    flavor: .stackedMedium,
                                                                                                                    squeeze: .squeezed)
        var buttonUniversalPaddingRightStackedMediumStandard = SegmentedPickerLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                                    flavor: .stackedMedium,
                                                                                                                    squeeze: .standard)
        
        let universalPaddingLeftStackedSmallSqueezed = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                     flavor: .stackedSmall,
                                                                                                     squeeze: .squeezed,
                                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                                     neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStackedSmallStandard = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                     flavor: .stackedSmall,
                                                                                                     squeeze: .standard,
                                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                                     neighborTypeRight: neighborTypeRight)
        
        let universalPaddingRightStackedSmallSqueezed = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                       flavor: .stackedSmall,
                                                                                                       squeeze: .squeezed,
                                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                                       neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStackedSmallStandard = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                       flavor: .stackedSmall,
                                                                                                       squeeze: .standard,
                                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                                       neighborTypeRight: neighborTypeRight)
        
        var buttonUniversalPaddingLeftStackedSmallSqueezed = SegmentedPickerLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                                 flavor: .stackedSmall,
                                                                                                                 squeeze: .squeezed)
        var buttonUniversalPaddingLeftStackedSmallStandard = SegmentedPickerLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                                 flavor: .stackedSmall,
                                                                                                                 squeeze: .standard)
        var buttonUniversalPaddingRightStackedSmallSqueezed = SegmentedPickerLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                                   flavor: .stackedSmall,
                                                                                                                   squeeze: .squeezed)
        var buttonUniversalPaddingRightStackedSmallStandard = SegmentedPickerLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                                   flavor: .stackedSmall,
                                                                                                                   squeeze: .standard)
        
        buttonUniversalPaddingLeftLongSqueezed *= numberOfButtons
        buttonUniversalPaddingLeftLongStandard *= numberOfButtons
        buttonUniversalPaddingRightLongSqueezed *= numberOfButtons
        buttonUniversalPaddingRightLongStandard *= numberOfButtons
        
        buttonUniversalPaddingLeftStackedLargeSqueezed *= numberOfButtons
        buttonUniversalPaddingLeftStackedLargeStandard *= numberOfButtons
        buttonUniversalPaddingRightStackedLargeSqueezed *= numberOfButtons
        buttonUniversalPaddingRightStackedLargeStandard *= numberOfButtons
        
        buttonUniversalPaddingLeftStackedMediumSqueezed *= numberOfButtons
        buttonUniversalPaddingLeftStackedMediumStandard *= numberOfButtons
        buttonUniversalPaddingRightStackedMediumSqueezed *= numberOfButtons
        buttonUniversalPaddingRightStackedMediumStandard *= numberOfButtons
        
        buttonUniversalPaddingLeftStackedSmallSqueezed *= numberOfButtons
        buttonUniversalPaddingLeftStackedSmallStandard *= numberOfButtons
        buttonUniversalPaddingRightStackedSmallSqueezed *= numberOfButtons
        buttonUniversalPaddingRightStackedSmallStandard *= numberOfButtons
        
        let maximumExtraPadding = 4 * numberOfButtons
        
        let sumAllEqualLongStandard = greatestStandardWidthLong * numberOfButtons
        let sumAllEqualStackedLargeStandard = greatestStandardWidthStackedLarge * numberOfButtons
        let sumAllEqualStackedMediumStandard = greatestStandardWidthStackedMedium * numberOfButtons
        let sumAllEqualStackedSmallStandard = greatestStandardWidthStackedSmall * numberOfButtons
        
        let minimumWidthLong = sumMinimumWidthLong +
        buttonUniversalPaddingLeftLongSqueezed +
        buttonUniversalPaddingRightLongSqueezed +
        universalPaddingLeftLongSqueezed + 
        universalPaddingRightLongSqueezed
        
        let middle1WidthLong = sumStandardWidthLong +
        buttonUniversalPaddingLeftLongStandard +
        buttonUniversalPaddingRightLongStandard +
        universalPaddingLeftLongStandard + 
        universalPaddingRightLongStandard
        
        let middle2WidthLong = sumAllEqualLongStandard +
        buttonUniversalPaddingLeftLongStandard +
        buttonUniversalPaddingRightLongStandard +
        universalPaddingLeftLongStandard + 
        universalPaddingRightLongStandard
        
        let maximumWidthLong = middle2WidthLong + maximumExtraPadding
        
        let minimumWidthStackedLarge = sumMinimumWidthStackedLarge +
        buttonUniversalPaddingLeftStackedLargeSqueezed +
        buttonUniversalPaddingRightStackedLargeSqueezed +
        universalPaddingLeftStackedLargeSqueezed + 
        universalPaddingRightStackedLargeSqueezed
        
        let middle1WidthStackedLarge = sumStandardWidthStackedLarge +
        buttonUniversalPaddingLeftStackedLargeStandard +
        buttonUniversalPaddingRightStackedLargeStandard +
        universalPaddingLeftStackedLargeStandard +
        universalPaddingRightStackedLargeStandard
        
        let middle2WidthStackedLarge = sumAllEqualStackedLargeStandard +
        buttonUniversalPaddingLeftStackedLargeStandard +
        buttonUniversalPaddingRightStackedLargeStandard +
        universalPaddingLeftStackedLargeStandard + 
        universalPaddingRightStackedLargeStandard
        
        let maximumWidthStackedLarge = middle2WidthStackedLarge + maximumExtraPadding
        
        let minimumWidthStackedMedium = sumMinimumWidthStackedMedium +
        buttonUniversalPaddingLeftStackedMediumSqueezed +
        buttonUniversalPaddingRightStackedMediumSqueezed +
        universalPaddingLeftStackedMediumSqueezed +
        universalPaddingRightStackedMediumSqueezed
        
        let middle1WidthStackedMedium = sumStandardWidthStackedMedium +
        buttonUniversalPaddingLeftStackedMediumStandard +
        buttonUniversalPaddingRightStackedMediumStandard +
        universalPaddingLeftStackedMediumStandard +
        universalPaddingRightStackedMediumStandard
        
        let middle2WidthStackedMedium = sumAllEqualStackedMediumStandard +
        buttonUniversalPaddingLeftStackedMediumStandard +
        buttonUniversalPaddingRightStackedMediumStandard +
        universalPaddingLeftStackedMediumStandard +
        universalPaddingRightStackedMediumStandard
        
        let maximumWidthStackedMedium = middle2WidthStackedMedium + maximumExtraPadding
        
        let minimumWidthStackedSmall = sumMinimumWidthStackedSmall +
        buttonUniversalPaddingLeftStackedSmallSqueezed +
        buttonUniversalPaddingRightStackedSmallSqueezed + 
        universalPaddingLeftStackedSmallSqueezed +
        universalPaddingRightStackedSmallSqueezed
        
        let middle1WidthStackedSmall = sumStandardWidthStackedSmall +
        buttonUniversalPaddingLeftStackedSmallStandard +
        buttonUniversalPaddingRightStackedSmallStandard + 
        universalPaddingLeftStackedSmallStandard +
        universalPaddingRightStackedSmallStandard
        
        let middle2WidthStackedSmall = sumAllEqualStackedSmallStandard +
        buttonUniversalPaddingLeftStackedSmallStandard +
        buttonUniversalPaddingRightStackedSmallStandard + 
        universalPaddingLeftStackedSmallStandard +
        universalPaddingRightStackedSmallStandard
        
        let maximumWidthStackedSmall = middle2WidthStackedSmall + maximumExtraPadding
        
        let flexSegmentData = FlexSegmentData(minimumWidthLong: minimumWidthLong,
                                              middle1WidthLong: middle1WidthLong,
                                              middle2WidthLong: middle2WidthLong,
                                              maximumWidthLong: maximumWidthLong,
                                              
                                              minimumWidthStackedLarge: minimumWidthStackedLarge,
                                              middle1WidthStackedLarge: middle1WidthStackedLarge,
                                              middle2WidthStackedLarge: middle2WidthStackedLarge,
                                              maximumWidthStackedLarge: maximumWidthStackedLarge,
                                              
                                              minimumWidthStackedMedium: minimumWidthStackedMedium,
                                              middle1WidthStackedMedium: middle1WidthStackedMedium,
                                              middle2WidthStackedMedium: middle2WidthStackedMedium,
                                              maximumWidthStackedMedium: maximumWidthStackedMedium,
                                              
                                              minimumWidthStackedSmall: minimumWidthStackedSmall,
                                              middle1WidthStackedSmall: middle1WidthStackedSmall,
                                              middle2WidthStackedSmall: middle2WidthStackedSmall,
                                              maximumWidthStackedSmall: maximumWidthStackedSmall)
        
        return ToolInterfaceElementFlex.segment(flexSegmentData)
    }
}
