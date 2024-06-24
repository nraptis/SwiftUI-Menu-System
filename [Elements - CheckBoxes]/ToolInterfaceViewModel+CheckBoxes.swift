//
//  ToolInterfaceViewModel+CheckBoxes.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getCheckBoxFlex(orientation: Orientation,
                                configuration: ToolInterfaceElementCheckBoxConfiguration,
                                neighborTypeLeft: ToolInterfaceElementType?,
                                neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        
        let iconPack = configuration.iconPack
        
        var minimumWidthLong = CheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLong,
                                                                                               nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                               iconPack: iconPack,
                                                                                               orientation: orientation,
                                                                                               flavor: .long,
                                                                                               squeeze: .squeezed,
                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                               neighborTypeRight: neighborTypeRight)
        
        var standardWidthLong = CheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLong,
                                                                                                nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                iconPack: iconPack,
                                                                                                orientation: orientation,
                                                                                                flavor: .long,
                                                                                                squeeze: .standard,
                                                                                                neighborTypeLeft: neighborTypeLeft,
                                                                                                neighborTypeRight: neighborTypeRight)
        var minimumWidthStackedLarge = CheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedLarge,
                                                                                                       nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                       iconPack: iconPack,
                                                                                                       orientation: orientation,
                                                                                                       flavor: .stackedLarge,
                                                                                                       squeeze: .squeezed,
                                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                                       neighborTypeRight: neighborTypeRight)
        var standardWidthStackedLarge = CheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedLarge,
                                                                                                        nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                        iconPack: iconPack,
                                                                                                        orientation: orientation,
                                                                                                        flavor: .stackedLarge,
                                                                                                        squeeze: .standard,
                                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                                        neighborTypeRight: neighborTypeRight)
        
        var minimumWidthStackedMedium = CheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedMedium,
                                                                                                        nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                        iconPack: iconPack,
                                                                                                        orientation: orientation,
                                                                                                        flavor: .stackedMedium,
                                                                                                        squeeze: .squeezed,
                                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                                        neighborTypeRight: neighborTypeRight)
        var standardWidthStackedMedium = CheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedMedium,
                                                                                                         nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                         iconPack: iconPack,
                                                                                                         orientation: orientation,
                                                                                                         flavor: .stackedMedium,
                                                                                                         squeeze: .standard,
                                                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                                                         neighborTypeRight: neighborTypeRight)
        
        var minimumWidthStackedSmall = CheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedSmall,
                                                                                                       nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                       iconPack: iconPack,
                                                                                                       orientation: orientation,
                                                                                                       flavor: .stackedSmall,
                                                                                                       squeeze: .squeezed,
                                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                                       neighborTypeRight: neighborTypeRight)
        var standardWidthStackedSmall = CheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedSmall,
                                                                                                        nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                        iconPack: iconPack,
                                                                                                        orientation: orientation,
                                                                                                        flavor: .stackedSmall,
                                                                                                        squeeze: .standard,
                                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                                        neighborTypeRight: neighborTypeRight)
        
        let checkBoxPaddingLeftLongSqueezed = CheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                    flavor: .long,
                                                                                    squeeze: .squeezed)
        let checkBoxPaddingLeftLongStandard = CheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                    flavor: .long,
                                                                                    squeeze: .standard)
        
        let checkBoxPaddingRightLongSqueezed = CheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .squeezed)
        let checkBoxPaddingRightLongStandard = CheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .standard)
        
        let checkBoxPaddingLeftStackedLargeSqueezed = CheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                            flavor: .stackedLarge,
                                                                                            squeeze: .squeezed)
        let checkBoxPaddingLeftStackedLargeStandard = CheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                            flavor: .stackedLarge,
                                                                                            squeeze: .standard)
        
        let checkBoxPaddingRightStackedLargeSqueezed = CheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                              flavor: .stackedLarge,
                                                                                              squeeze: .squeezed)
        let checkBoxPaddingRightStackedLargeStandard = CheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                              flavor: .stackedLarge,
                                                                                              squeeze: .standard)
        
        let checkBoxPaddingLeftStackedMediumSqueezed = CheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                             flavor: .stackedMedium,
                                                                                             squeeze: .squeezed)
        let checkBoxPaddingLeftStackedMediumStandard = CheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                             flavor: .stackedMedium,
                                                                                             squeeze: .standard)
        
        let checkBoxPaddingRightStackedMediumSqueezed = CheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                               flavor: .stackedMedium,
                                                                                               squeeze: .squeezed)
        let checkBoxPaddingRightStackedMediumStandard = CheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                               flavor: .stackedMedium,
                                                                                               squeeze: .standard)
        
        let checkBoxPaddingLeftStackedSmallSqueezed = CheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                            flavor: .stackedSmall,
                                                                                            squeeze: .squeezed)
        let checkBoxPaddingLeftStackedSmallStandard = CheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                            flavor: .stackedSmall,
                                                                                            squeeze: .standard)
        
        let checkBoxPaddingRightStackedSmallSqueezed = CheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                              flavor: .stackedSmall,
                                                                                              squeeze: .squeezed)
        let checkBoxPaddingRightStackedSmallStandard = CheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                              flavor: .stackedSmall,
                                                                                              squeeze: .standard)
        
        minimumWidthLong += checkBoxPaddingLeftLongSqueezed
        minimumWidthLong += checkBoxPaddingRightLongSqueezed
        standardWidthLong += checkBoxPaddingLeftLongStandard
        standardWidthLong += checkBoxPaddingRightLongStandard
        
        minimumWidthStackedLarge += checkBoxPaddingLeftStackedLargeSqueezed
        minimumWidthStackedLarge += checkBoxPaddingRightStackedLargeSqueezed
        standardWidthStackedLarge += checkBoxPaddingLeftStackedLargeStandard
        standardWidthStackedLarge += checkBoxPaddingRightStackedLargeStandard
        
        minimumWidthStackedMedium += checkBoxPaddingLeftStackedMediumSqueezed
        minimumWidthStackedMedium += checkBoxPaddingRightStackedMediumSqueezed
        standardWidthStackedMedium += checkBoxPaddingLeftStackedMediumStandard
        standardWidthStackedMedium += checkBoxPaddingRightStackedMediumStandard
        
        minimumWidthStackedSmall += checkBoxPaddingLeftStackedSmallSqueezed
        minimumWidthStackedSmall += checkBoxPaddingRightStackedSmallSqueezed
        standardWidthStackedSmall += checkBoxPaddingLeftStackedSmallStandard
        standardWidthStackedSmall += checkBoxPaddingRightStackedSmallStandard
        
        let checkBoxWidthLongSqueezed = CheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                        flavor: .long,
                                                                        squeeze: .squeezed)
        let checkBoxWidthLongStandard = CheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                        flavor: .long,
                                                                        squeeze: .standard)
        
        let checkBoxWidthStackedLargeSqueezed = CheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                                flavor: .stackedLarge,
                                                                                squeeze: .squeezed)
        let checkBoxWidthStackedLargeStandard = CheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                                flavor: .stackedLarge,
                                                                                squeeze: .standard)
        
        let checkBoxWidthStackedMediumSqueezed = CheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                                 flavor: .stackedMedium,
                                                                                 squeeze: .squeezed)
        let checkBoxWidthStackedMediumStandard = CheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                                 flavor: .stackedMedium,
                                                                                 squeeze: .standard)
        
        let checkBoxWidthStackedSmallSqueezed = CheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                                flavor: .stackedSmall,
                                                                                squeeze: .squeezed)
        let checkBoxWidthStackedSmallStandard = CheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                                flavor: .stackedSmall,
                                                                                squeeze: .standard)
        
        minimumWidthLong += checkBoxWidthLongSqueezed
        standardWidthLong += checkBoxWidthLongStandard
        
        minimumWidthStackedLarge += checkBoxWidthStackedLargeSqueezed
        standardWidthStackedLarge += checkBoxWidthStackedLargeStandard
        
        minimumWidthStackedMedium += checkBoxWidthStackedMediumSqueezed
        standardWidthStackedMedium += checkBoxWidthStackedMediumStandard
        
        minimumWidthStackedSmall += checkBoxWidthStackedSmallSqueezed
        standardWidthStackedSmall += checkBoxWidthStackedSmallStandard
        
        let flexCheckBoxData = FlexCheckBoxData(minimumWidthLong: minimumWidthLong,
                                                standardWidthLong: standardWidthLong,
                                                maximumWidthLong: standardWidthLong,
                                                minimumWidthStackedLarge: minimumWidthStackedLarge,
                                                standardWidthStackedLarge: standardWidthStackedLarge,
                                                maximumWidthStackedLarge: standardWidthStackedLarge,
                                                minimumWidthStackedMedium: minimumWidthStackedMedium,
                                                standardWidthStackedMedium: standardWidthStackedMedium,
                                                maximumWidthStackedMedium: standardWidthStackedMedium,
                                                minimumWidthStackedSmall: minimumWidthStackedSmall,
                                                standardWidthStackedSmall: standardWidthStackedSmall,
                                                maximumWidthStackedSmall: standardWidthStackedSmall)
        
        return ToolInterfaceElementFlex.checkBox(flexCheckBoxData)
    }
}
