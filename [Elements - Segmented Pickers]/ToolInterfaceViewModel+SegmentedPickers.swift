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
            
            let line1 = buttonConfiguration.nameLabelLine1
            let line2 = buttonConfiguration.nameLabelLine2
            
            let textIconImagePack = buttonConfiguration.textIconImagePack
            
            let numberOfLines = buttonConfiguration.nameLabelNumberOfLines
            
            let minimumWidthLong = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthLong,
                                                                                      nameLabelNumberOfLines: numberOfLines,
                                                                                      textIconImagePack: textIconImagePack,
                                                                                      orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .squeezed)
            
            let standardWidthLong = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthLong,
                                                                                       nameLabelNumberOfLines: numberOfLines,
                                                                                       textIconImagePack: textIconImagePack,
                                                                                       orientation: orientation,
                                                                                       flavor: .long,
                                                                                       squeeze: .standard)
            let minimumWidthStackedLarge = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedLarge,
                                                                                              nameLabelNumberOfLines: numberOfLines,
                                                                                              textIconImagePack: textIconImagePack,
                                                                                              orientation: orientation,
                                                                                              flavor: .stackedLarge,
                                                                                              squeeze: .squeezed)
            let standardWidthStackedLarge = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedLarge,
                                                                                               nameLabelNumberOfLines: numberOfLines,
                                                                                               textIconImagePack: textIconImagePack,
                                                                                               orientation: orientation,
                                                                                               flavor: .stackedLarge,
                                                                                               squeeze: .standard)
            
            let minimumWidthStackedMedium = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedMedium,
                                                                                               nameLabelNumberOfLines: numberOfLines,
                                                                                               textIconImagePack: textIconImagePack,
                                                                                               orientation: orientation,
                                                                                               flavor: .stackedMedium,
                                                                                               squeeze: .squeezed)
            
            let standardWidthStackedMedium = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedMedium,
                                                                                                nameLabelNumberOfLines: numberOfLines,
                                                                                                textIconImagePack: textIconImagePack,
                                                                                                orientation: orientation,
                                                                                                flavor: .stackedMedium,
                                                                                                squeeze: .standard)
            
            let minimumWidthStackedSmall = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedSmall,
                                                                                              nameLabelNumberOfLines: numberOfLines,
                                                                                              textIconImagePack: textIconImagePack,
                                                                                              orientation: orientation,
                                                                                              flavor: .stackedSmall,
                                                                                              squeeze: .squeezed)
            let standardWidthStackedSmall = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedSmall,
                                                                                               nameLabelNumberOfLines: numberOfLines,
                                                                                               textIconImagePack: textIconImagePack,
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
                                                                                             neighborType: neighborTypeLeft)
        let universalPaddingLeftLongStandard = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                             flavor: .long,
                                                                                             squeeze: .standard,
                                                                                             neighborType: neighborTypeLeft)
        
        let universalPaddingRightLongSqueezed = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                               flavor: .long,
                                                                                               squeeze: .squeezed,
                                                                                               neighborType: neighborTypeRight)
        let universalPaddingRightLongStandard = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                               flavor: .long,
                                                                                               squeeze: .standard,
                                                                                               neighborType: neighborTypeRight)
        
        
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
                                                                                                     neighborType: neighborTypeLeft)
        let universalPaddingLeftStackedLargeStandard = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                     flavor: .stackedLarge,
                                                                                                     squeeze: .standard,
                                                                                                     neighborType: neighborTypeLeft)
        
        let universalPaddingRightStackedLargeSqueezed = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                       flavor: .stackedLarge,
                                                                                                       squeeze: .squeezed,
                                                                                                       neighborType: neighborTypeRight)
        let universalPaddingRightStackedLargeStandard = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                       flavor: .stackedLarge,
                                                                                                       squeeze: .standard,
                                                                                                       neighborType: neighborTypeRight)
        
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
                                                                                                      neighborType: neighborTypeLeft)
        let universalPaddingLeftStackedMediumStandard = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                      flavor: .stackedMedium,
                                                                                                      squeeze: .standard,
                                                                                                      neighborType: neighborTypeLeft)
        
        let universalPaddingRightStackedMediumSqueezed = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                        flavor: .stackedMedium,
                                                                                                        squeeze: .squeezed,
                                                                                                        neighborType: neighborTypeRight)
        let universalPaddingRightStackedMediumStandard = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                        flavor: .stackedMedium,
                                                                                                        squeeze: .standard,
                                                                                                        neighborType: neighborTypeRight)
        
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
                                                                                                     neighborType: neighborTypeLeft)
        let universalPaddingLeftStackedSmallStandard = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                                     flavor: .stackedSmall,
                                                                                                     squeeze: .standard,
                                                                                                     neighborType: neighborTypeLeft)
        
        let universalPaddingRightStackedSmallSqueezed = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                       flavor: .stackedSmall,
                                                                                                       squeeze: .squeezed,
                                                                                                       neighborType: neighborTypeRight)
        let universalPaddingRightStackedSmallStandard = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                                       flavor: .stackedSmall,
                                                                                                       squeeze: .standard,
                                                                                                       neighborType: neighborTypeRight)
        
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
        
        //////
        
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
        
        //////
        
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
        
        
        /*
        
        var minimumWidthStackedSmall = 0
        
        minimumWidthStackedSmall += SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                  flavor: .stackedSmall,
                                                                                  squeeze: .squeezed,
                                                                                  neighborType: nil)
        minimumWidthStackedSmall += SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                  flavor: .stackedSmall,
                                                                                  squeeze: .squeezed,
                                                                                  neighborType: nil)
        
        for buttonConfiguration in configuration.buttonConfigurations {
            
            let textIconImagePack = buttonConfiguration.textIconImagePack

            let textIconAndNameLabelWidth = SegmentedPickerLayout.getTextIconAndNameLabelWidth(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedSmall,
                                                                                               nameLabelNumberOfLines: buttonConfiguration.nameLabelNumberOfLines,
                                                                                               textIconImagePack: textIconImagePack,
                                                                                               orientation: orientation,
                                                                                               flavor: .stackedSmall,
                                                                                               squeeze: .squeezed)
            let buttonUniversalPaddingLeft = SegmentedPickerLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                 flavor: .stackedSmall,
                                                                                                 squeeze: .squeezed)
            let buttonUniversalPaddingRight = SegmentedPickerLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                   flavor: .stackedSmall,
                                                                                                   squeeze: .squeezed)
            
            
            minimumWidthStackedSmall += textIconAndNameLabelWidth
            
            minimumWidthStackedSmall += buttonUniversalPaddingLeft
            minimumWidthStackedSmall += buttonUniversalPaddingRight
            
            
            
            
        }
        
        
        
        let flexSegmentData = FlexSegmentData(minimumWidthLong: 1000,
                                              middle1WidthLong: 1000,
                                              middle2WidthLong: 1000,
                                              maximumWidthLong: 1000,
                                                 
                                              minimumWidthStackedLarge: 1000,
                                              middle1WidthStackedLarge: 1000,
                                              middle2WidthStackedLarge: 1000,
                                              maximumWidthStackedLarge: 1000,
                                                 
                                              minimumWidthStackedMedium: 1000,
                                              middle1WidthStackedMedium: 1000,
                                              middle2WidthStackedMedium: 1000,
                                              maximumWidthStackedMedium: 1000,
                                                 
                                              minimumWidthStackedSmall: minimumWidthStackedSmall,
                                              middle1WidthStackedSmall: minimumWidthStackedSmall + 100,
                                              middle2WidthStackedSmall: minimumWidthStackedSmall + 200,
                                              maximumWidthStackedSmall: minimumWidthStackedSmall + 300)
        
        */
         
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