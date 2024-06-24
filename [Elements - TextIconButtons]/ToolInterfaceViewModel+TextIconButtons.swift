//
//  ToolInterfaceViewModel+TextIconButtons.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getTextIconButtonFlex(orientation: Orientation,
                                      configuration: ToolInterfaceElementTextIconButtonConfiguration,
                                      neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let iconPack = configuration.iconPack
        let minimumWidthLong = TextIconButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLong,
                                                                                                     nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                     iconPack: iconPack,
                                                                                                     orientation: orientation,
                                                                                                     flavor: .long,
                                                                                                     squeeze: .squeezed,
                                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                                     neighborTypeRight: neighborTypeRight)
        
        let standardWidthLong = TextIconButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLong,
                                                                                                      nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                      iconPack: iconPack,
                                                                                                      orientation: orientation,
                                                                                                      flavor: .long,
                                                                                                      squeeze: .standard,
                                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                                      neighborTypeRight: neighborTypeRight)
        let minimumWidthStackedLarge = TextIconButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedLarge,
                                                                                                             nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                             iconPack: iconPack,
                                                                                                             orientation: orientation,
                                                                                                             flavor: .stackedLarge,
                                                                                                             squeeze: .squeezed,
                                                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                                                             neighborTypeRight: neighborTypeRight)
        let standardWidthStackedLarge = TextIconButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedLarge,
                                                                                                              nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                              iconPack: iconPack,
                                                                                                              orientation: orientation,
                                                                                                              flavor: .stackedLarge,
                                                                                                              squeeze: .standard,
                                                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                                                              neighborTypeRight: neighborTypeRight)
        
        let minimumWidthStackedMedium = TextIconButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedMedium,
                                                                                                              nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                              iconPack: iconPack,
                                                                                                              orientation: orientation,
                                                                                                              flavor: .stackedMedium,
                                                                                                              squeeze: .squeezed,
                                                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                                                              neighborTypeRight: neighborTypeRight)
        let standardWidthStackedMedium = TextIconButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedMedium,
                                                                                                               nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                               iconPack: iconPack,
                                                                                                               orientation: orientation,
                                                                                                               flavor: .stackedMedium,
                                                                                                               squeeze: .standard,
                                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                                               neighborTypeRight: neighborTypeRight)
        
        let minimumWidthStackedSmall = TextIconButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedSmall,
                                                                                                             nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                             iconPack: iconPack,
                                                                                                             orientation: orientation,
                                                                                                             flavor: .stackedSmall,
                                                                                                             squeeze: .squeezed,
                                                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                                                             neighborTypeRight: neighborTypeRight)
        let standardWidthStackedSmall = TextIconButtonLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedSmall,
                                                                                                              nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                              iconPack: iconPack,
                                                                                                              orientation: orientation,
                                                                                                              flavor: .stackedSmall,
                                                                                                              squeeze: .standard,
                                                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                                                              neighborTypeRight: neighborTypeRight)
        
        let flexTextIconButtonData = FlexTextIconButtonData(minimumWidthLong: minimumWidthLong,
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
        
        return ToolInterfaceElementFlex.textIconButton(flexTextIconButtonData)
    }
}
