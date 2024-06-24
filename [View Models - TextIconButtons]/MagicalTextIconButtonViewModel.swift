//
//  MagicalTextIconButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/26/24.
//

import Foundation
import SwiftUI

@Observable class MagicalTextIconButtonViewModel: MagicalViewModel {
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var iconPaddingLeft = 0
    var iconPaddingRight = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    let textIconButtonConfiguration: ToolInterfaceElementTextIconButtonConfiguration
    init(jiggleViewModel: JiggleViewModel,
         toolInterfaceViewModel: ToolInterfaceViewModel,
         textIconButtonConfiguration: ToolInterfaceElementTextIconButtonConfiguration) {
        self.textIconButtonConfiguration = textIconButtonConfiguration
        super.init(jiggleViewModel: jiggleViewModel,
                   toolInterfaceViewModel: toolInterfaceViewModel)
    }
    
    override func refreshDisabled() {
        super.refreshDisabled()
    }
    
    override func refreshEnabled() {
        super.refreshEnabled()
    }
    
    func handleClicked() {
        print("MagicalTextIconButtonViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        let textIcon = textIconButtonConfiguration.iconPack.getTextIcon(orientation: orientation,
                                                                        layoutSchemeFlavor: layoutSchemeFlavor,
                                                                        numberOfLines: textIconButtonConfiguration.nameLabelNumberOfLines)
        let isStacked = layoutSchemeFlavor.isStacked
        
        let iconWidth = textIcon.iconWidth
        
        let nameLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            nameLabelTextWidth = textIconButtonConfiguration.nameLabelWidthLong
        case .stackedLarge:
            nameLabelTextWidth = textIconButtonConfiguration.nameLabelWidthStackedLarge
        case .stackedMedium:
            nameLabelTextWidth = textIconButtonConfiguration.nameLabelWidthStackedMedium
        case .stackedSmall:
            nameLabelTextWidth = textIconButtonConfiguration.nameLabelWidthStackedSmall
        }
        
        let universalPaddingLeftSqueezed = TextIconButtonLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .squeezed,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStandard = TextIconButtonLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .standard,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        let universalPaddingRightSqueezed = TextIconButtonLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .squeezed,
                                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                                          neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStandard = TextIconButtonLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .standard,
                                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                                          neighborTypeRight: neighborTypeRight)
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        let nameLabelPaddingLeftSqueezed = TextIconButtonLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .squeezed)
        let nameLabelPaddingLeftStandard = TextIconButtonLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .standard)
        let nameLabelPaddingRightSqueezed = TextIconButtonLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .squeezed)
        let nameLabelPaddingRightStandard = TextIconButtonLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .standard)
        var _nameLabelPaddingLeft = nameLabelPaddingLeftSqueezed
        var _nameLabelPaddingRight = nameLabelPaddingRightSqueezed
        
        
        let iconPaddingLeftSqueezed = TextIconButtonLayout.getIconPaddingLeft(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              squeeze: .squeezed)
        let iconPaddingLeftStandard = TextIconButtonLayout.getIconPaddingLeft(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              squeeze: .standard)
        let iconPaddingRightSqueezed = TextIconButtonLayout.getIconPaddingRight(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                squeeze: .squeezed)
        let iconPaddingRightStandard = TextIconButtonLayout.getIconPaddingRight(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                squeeze: .standard)
        var _iconPaddingLeft = iconPaddingLeftSqueezed
        var _iconPaddingRight = iconPaddingRightSqueezed

        
        let totalWidth = layoutWidth
        
        if isStacked {
            var consumedBaseWidth = Int(0)
            consumedBaseWidth += universalPaddingRightSqueezed
            consumedBaseWidth += universalPaddingLeftSqueezed
            
            var consumedWidth = 0
            while true {
                
                if _universalPaddingLeft >= universalPaddingLeftStandard &&
                    _universalPaddingRight >= universalPaddingRightStandard &&
                    _nameLabelPaddingLeft >= nameLabelPaddingLeftStandard &&
                    _nameLabelPaddingRight >= nameLabelPaddingRightStandard &&
                    _iconPaddingLeft >= iconPaddingLeftStandard &&
                    _iconPaddingRight >= iconPaddingRightStandard {
                    break
                }
                
                var didModify = false
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                if _iconPaddingLeft < iconPaddingLeftStandard && consumedWidth < totalWidth {
                    _iconPaddingLeft += 1
                    didModify = true
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                if _iconPaddingRight < iconPaddingRightStandard && consumedWidth < totalWidth {
                    _iconPaddingRight += 1
                    didModify = true
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                if _nameLabelPaddingLeft < nameLabelPaddingLeftStandard && consumedWidth < totalWidth {
                    _nameLabelPaddingLeft += 1
                    didModify = true
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                if _nameLabelPaddingRight < nameLabelPaddingRightStandard && consumedWidth < totalWidth {
                    _nameLabelPaddingRight += 1
                    didModify = true
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                if _universalPaddingLeft < universalPaddingLeftStandard && consumedWidth < totalWidth {
                    _universalPaddingLeft += 1
                    consumedBaseWidth += 1
                    didModify = true
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                if _universalPaddingRight < universalPaddingRightStandard && consumedWidth < totalWidth {
                    _universalPaddingRight += 1
                    consumedBaseWidth += 1
                    didModify = true
                }
                
                if didModify == false {
                    break
                }
            }
            
            let consumedStackWidth = calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                   textPaddingLeft: _nameLabelPaddingLeft,
                                                                   textPaddingRight: _nameLabelPaddingRight,
                                                                   imageWidth: iconWidth,
                                                                   imagePaddingLeft: _iconPaddingLeft,
                                                                   imagePaddingRight: _iconPaddingRight)
            consumedWidth = consumedBaseWidth + consumedStackWidth
            
            while true {
                
                if consumedWidth >= totalWidth { break }
                
                _universalPaddingRight += 1
                consumedWidth += 1
                
                if consumedWidth >= totalWidth { break }
                
                _universalPaddingLeft += 1
                consumedWidth += 1
            }
            
        } else {
            
            var consumedWidth = Int(0)
            consumedWidth += universalPaddingRightSqueezed
            consumedWidth += universalPaddingLeftSqueezed
            
            consumedWidth += nameLabelTextWidth
            consumedWidth += nameLabelPaddingLeftSqueezed
            consumedWidth += nameLabelPaddingRightSqueezed
            
            consumedWidth += iconWidth
            consumedWidth += iconPaddingLeftSqueezed
            consumedWidth += iconPaddingRightSqueezed
            
            while consumedWidth < totalWidth {
                
                var didModify = false
                
                if _iconPaddingLeft < iconPaddingLeftStandard && consumedWidth < totalWidth {
                    _iconPaddingLeft += 1
                    consumedWidth += 1
                    didModify = true
                }
                
                if _iconPaddingRight < iconPaddingRightStandard && consumedWidth < totalWidth {
                    _iconPaddingRight += 1
                    consumedWidth += 1
                    didModify = true
                }
                
                if _nameLabelPaddingLeft < nameLabelPaddingLeftStandard && consumedWidth < totalWidth {
                    _nameLabelPaddingLeft += 1
                    consumedWidth += 1
                    didModify = true
                }
                
                if _nameLabelPaddingRight < nameLabelPaddingRightStandard && consumedWidth < totalWidth {
                    _nameLabelPaddingRight += 1
                    consumedWidth += 1
                    didModify = true
                }
                
                if _universalPaddingLeft < universalPaddingLeftStandard && consumedWidth < totalWidth {
                    _universalPaddingLeft += 1
                    consumedWidth += 1
                    didModify = true
                }
                
                if _universalPaddingRight < universalPaddingRightStandard && consumedWidth < totalWidth {
                    _universalPaddingRight += 1
                    consumedWidth += 1
                    didModify = true
                }
                
                if didModify == false {
                    break
                }
            }
            
            while consumedWidth < totalWidth {
                if consumedWidth < totalWidth {
                    _universalPaddingRight += 1
                    consumedWidth += 1
                }
                if consumedWidth < totalWidth {
                    _universalPaddingLeft += 1
                    consumedWidth += 1
                }
            }
        }
        
        nameLabelPaddingLeft = _nameLabelPaddingLeft
        nameLabelPaddingRight = _nameLabelPaddingRight
        
        iconPaddingLeft = _iconPaddingLeft
        iconPaddingRight = _iconPaddingRight
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
    }
}
