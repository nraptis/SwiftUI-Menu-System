//
//  MagicalSliderViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/21/24.
//

import Foundation
import SwiftUI

@Observable class MagicalSliderViewModel: MagicalViewModel {
    
    var percent = CGFloat(0.0)
    let thumbMinimumX: CGFloat
    var thumbMaximumX: CGFloat
    var thumbOffsetX = CGFloat(0.0)
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var valueLabelPaddingLeft = 0
    var valueLabelPaddingRight = 0
    
    var iconPaddingLeft = 0
    var iconPaddingRight = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    var sliderBoxWidth = 0
    
    let sliderConfiguration: ToolInterfaceElementSliderConfiguration
    init(jiggleViewModel: JiggleViewModel,
         toolInterfaceViewModel: ToolInterfaceViewModel,
         sliderConfiguration: ToolInterfaceElementSliderConfiguration) {
        
        self.sliderConfiguration = sliderConfiguration
        
        self.thumbMinimumX = 0.0
        self.thumbMaximumX = 100.0
        super.init(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: toolInterfaceViewModel)
    }
    
    
    
    func handleSlideStarted(percent: CGFloat) {
        self.percent = CGFloat(percent)
    }
    
    func handleSlideUpdated(percent: CGFloat) {
        self.percent = percent
    }
    
    func handleSlideFinished(percent: CGFloat) {
        self.percent = percent
    }
    
    override func refreshDisabled() {
        super.refreshDisabled()
    }
    
    override func refreshEnabled() {
        super.refreshEnabled()
    }
    
    func refreshEnabled(value: Float) {
        let delta = (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue)
        if delta > Math.epsilon {
            var _percent = CGFloat((value - sliderConfiguration.minimumValue) / delta)
            if _percent < 0.0 { _percent = 0.0 }
            if _percent > 1.0 { _percent = 1.0 }
            thumbOffsetX = thumbMinimumX + (thumbMaximumX - thumbMinimumX) * _percent
            percent = _percent
        }
        refreshEnabled()
    }
    
    func getValueString() -> String {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        let formatString = "%.\(sliderConfiguration.valueDecimalCount)f"
        return String(format: formatString, value)
    }
    
    func getTextIcon(layoutSchemeFlavor: LayoutSchemeFlavor) -> TextIcon {
        return ToolInterfaceImageLibrary.getTextIcon(numberOfLines: sliderConfiguration.nameLabelNumberOfLines,
                                                     textIconImagePack: sliderConfiguration.textIconImagePack,
                                                     orientation: orientation,
                                                     layoutSchemeFlavor: layoutSchemeFlavor)
    }
    
    /*
    func computeLayoutSchemeFlavor(width: Int,
                                   height: Int,
                                   safeAreaLeft: Int,
                                   safeAreaRight: Int) -> LayoutSchemeFlavor {
        let universalPaddingLeftStandardLong = SliderLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                    flavor: .long,
                                                                                    squeeze: .standard,
                                                                                    neighborType: neighborTypeLeft)
        let universalPaddingRightStandardLong = SliderLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .standard,
                                                                                      neighborType: neighborTypeRight)
        let universalPaddingLeftStandardStacked = SliderLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                       flavor: .stackedLarge,
                                                                                       squeeze: .standard,
                                                                                       neighborType: neighborTypeLeft)
        let universalPaddingRightStandardStacked = SliderLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                         flavor: .stackedLarge,
                                                                                         squeeze: .standard,
                                                                                         neighborType: neighborTypeRight)
        let iconPaddingLeftStandardLong = SliderLayout.getIconPaddingLeft(orientation: orientation,
                                                                          flavor: .long,
                                                                          squeeze: .standard)
        let iconPaddingRightStandardLong = SliderLayout.getIconPaddingRight(orientation: orientation,
                                                                            flavor: .long,
                                                                            squeeze: .standard)
        let nameLabelPaddingLeftStandardLong = SliderLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                    flavor: .long,
                                                                                    squeeze: .standard)
        let nameLabelPaddingRightStandardLong = SliderLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .standard)
        let valueLabelPaddingLeftStandardLong = SliderLayout.getValueLabelPaddingLeft(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .standard)
        let valueLabelPaddingRightStandardLong = SliderLayout.getValueLabelPaddingRight(orientation: orientation,
                                                                                        flavor: .long,
                                                                                        squeeze: .standard)
        let iconPaddingLeftStandardStacked = SliderLayout.getIconPaddingLeft(orientation: orientation,
                                                                             flavor: .stackedLarge,
                                                                             squeeze: .standard)
        let iconPaddingRightStandardStacked = SliderLayout.getIconPaddingRight(orientation: orientation,
                                                                               flavor: .stackedLarge,
                                                                               squeeze: .standard)
        let nameLabelPaddingLeftStandardStacked = SliderLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                       flavor: .stackedLarge,
                                                                                       squeeze: .standard)
        let nameLabelPaddingRightStandardStacked = SliderLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                         flavor: .stackedLarge,
                                                                                         squeeze: .standard)
        let valueLabelPaddingLeftStandardStacked = SliderLayout.getValueLabelPaddingLeft(orientation: orientation,
                                                                                         flavor: .stackedLarge,
                                                                                         squeeze: .standard)
        let valueLabelPaddingRightStandardStacked = SliderLayout.getValueLabelPaddingRight(orientation: orientation,
                                                                                           flavor: .stackedLarge,
                                                                                           squeeze: .standard)
        
        let nameLabelWidthLong = sliderConfiguration.layoutNameLabelWidthLong
        let valueLabelWidthLong = sliderConfiguration.valueLabelWidthLong
        let nameLabelWidthStackedLarge = sliderConfiguration.layoutNameLabelWidthStackedLarge
        let valueLabelWidthStackedLarge = sliderConfiguration.valueLabelWidthStackedLarge
        let nameLabelWidthStackedMedium = sliderConfiguration.layoutNameLabelWidthStackedMedium
        let valueLabelWidthStackedMedium = sliderConfiguration.valueLabelWidthStackedMedium
        let nameLabelWidthStackedSmall = sliderConfiguration.layoutNameLabelWidthStackedSmall
        let valueLabelWidthStackedSmall = sliderConfiguration.valueLabelWidthStackedSmall
        
        let nameLabelSpaceLong = nameLabelWidthLong + nameLabelPaddingLeftStandardLong + nameLabelPaddingRightStandardLong
        let nameLabelSpaceStackedLarge = nameLabelWidthStackedLarge + nameLabelPaddingLeftStandardStacked + nameLabelPaddingRightStandardStacked
        let nameLabelSpaceStackedMedium = nameLabelWidthStackedMedium + nameLabelPaddingLeftStandardStacked + nameLabelPaddingRightStandardStacked
        let nameLabelSpaceStackedSmall = nameLabelWidthStackedSmall + nameLabelPaddingLeftStandardStacked + nameLabelPaddingRightStandardStacked
        
        let valueLabelSpaceLong = valueLabelWidthLong + valueLabelPaddingLeftStandardLong + valueLabelPaddingRightStandardLong
        let valueLabelSpaceStackedLarge = valueLabelWidthStackedLarge + valueLabelPaddingLeftStandardStacked + valueLabelPaddingRightStandardStacked
        let valueLabelSpaceStackedMedium = valueLabelWidthStackedMedium + valueLabelPaddingLeftStandardStacked + valueLabelPaddingRightStandardStacked
        let valueLabelSpaceStackedSmall = valueLabelWidthStackedSmall + valueLabelPaddingLeftStandardStacked + valueLabelPaddingRightStandardStacked
        
        let iconWidthLong = sliderConfiguration.iconWidthLong + iconPaddingLeftStandardLong + iconPaddingRightStandardLong
        let iconWidthStacked = sliderConfiguration.iconWidthStacked + iconPaddingLeftStandardStacked + iconPaddingRightStandardStacked
        
        let textAndIconSpaceLong = nameLabelSpaceLong + iconWidthLong
        let textAndIconSpaceStackedLarge = max(nameLabelSpaceStackedLarge, iconWidthStacked)
        let textAndIconSpaceStackedMedium = max(nameLabelSpaceStackedMedium, iconWidthStacked)
        let textAndIconSpaceStackedSmall = max(nameLabelSpaceStackedSmall, iconWidthStacked)
        
        let preferredMinimumBarWidth = SliderLayout.getPreferredMinimumBarWidth(orientation: orientation,
                                                                                widthCategory: sliderConfiguration.widthCategory)
        
        var proposedLongWidth = 0
        proposedLongWidth += universalPaddingLeftStandardLong
        proposedLongWidth += textAndIconSpaceLong
        proposedLongWidth += preferredMinimumBarWidth
        proposedLongWidth += valueLabelSpaceLong
        proposedLongWidth += universalPaddingRightStandardLong
        
        var proposedStackedLargeWidth = 0
        proposedStackedLargeWidth += universalPaddingLeftStandardStacked
        proposedStackedLargeWidth += textAndIconSpaceStackedLarge
        proposedStackedLargeWidth += preferredMinimumBarWidth
        proposedStackedLargeWidth += valueLabelSpaceStackedLarge
        proposedStackedLargeWidth += universalPaddingRightStandardStacked
        
        var proposedStackedMediumWidth = 0
        proposedStackedMediumWidth += universalPaddingLeftStandardStacked
        proposedStackedMediumWidth += textAndIconSpaceStackedMedium
        proposedStackedMediumWidth += preferredMinimumBarWidth
        proposedStackedMediumWidth += valueLabelSpaceStackedMedium
        proposedStackedMediumWidth += universalPaddingRightStandardStacked
        
        var proposedStackedSmallWidth = 0
        proposedStackedSmallWidth += universalPaddingLeftStandardStacked
        proposedStackedSmallWidth += textAndIconSpaceStackedSmall
        proposedStackedSmallWidth += preferredMinimumBarWidth
        proposedStackedSmallWidth += valueLabelSpaceStackedSmall
        proposedStackedSmallWidth += universalPaddingRightStandardStacked
        
        let totalWidth = width
        let availableSpace: Int
        switch sliderConfiguration.widthCategory {
        case .fullWidth:
            availableSpace = totalWidth
        case .halfWidthLeft:
            availableSpace = totalWidth / 2
        case .halfWidthRight:
            availableSpace = totalWidth - (totalWidth / 2)
        }
        
        if availableSpace >= proposedLongWidth {
            return .long
        } else if availableSpace >= proposedStackedLargeWidth {
            return .stackedLarge
        } else if availableSpace >= proposedStackedMediumWidth {
            return .stackedMedium
        } else {
            return .stackedSmall
        }
    }
    */
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        let textIcon = getTextIcon(layoutSchemeFlavor: layoutSchemeFlavor)
        let isStacked = layoutSchemeFlavor.isStacked
        let iconWidth = textIcon.iconWidth
        
        let nameLabelTextWidth: Int
        let valueLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            nameLabelTextWidth = sliderConfiguration.layoutNameLabelWidthLong
            valueLabelTextWidth = sliderConfiguration.valueLabelWidthLong
        case .stackedLarge:
            nameLabelTextWidth = sliderConfiguration.layoutNameLabelWidthStackedLarge
            valueLabelTextWidth = sliderConfiguration.valueLabelWidthStackedLarge
        case .stackedMedium:
            nameLabelTextWidth = sliderConfiguration.layoutNameLabelWidthStackedMedium
            valueLabelTextWidth = sliderConfiguration.valueLabelWidthStackedMedium
        case .stackedSmall:
            nameLabelTextWidth = sliderConfiguration.layoutNameLabelWidthStackedSmall
            valueLabelTextWidth = sliderConfiguration.valueLabelWidthStackedSmall
        }
        
        let universalPaddingLeftSqueezed = SliderLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .squeezed,
                                                                                        neighborType: neighborTypeLeft)
        let universalPaddingLeftStandard = SliderLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .standard,
                                                                                        neighborType: neighborTypeLeft)
        let universalPaddingRightSqueezed = SliderLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .squeezed,
                                                                                          neighborType: neighborTypeLeft)
        let universalPaddingRightStandard = SliderLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .standard,
                                                                                          neighborType: neighborTypeRight)
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        let nameLabelPaddingLeftSqueezed = SliderLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                squeeze: .squeezed)
        let nameLabelPaddingLeftStandard = SliderLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                squeeze: .standard)
        let nameLabelPaddingRightSqueezed = SliderLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .squeezed)
        let nameLabelPaddingRightStandard = SliderLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .standard)
        var _nameLabelPaddingLeft = nameLabelPaddingLeftSqueezed
        var _nameLabelPaddingRight = nameLabelPaddingRightSqueezed
        
        let valueLabelPaddingLeftSqueezed = SliderLayout.getValueLabelPaddingLeft(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .squeezed)
        let valueLabelPaddingLeftStandard = SliderLayout.getValueLabelPaddingLeft(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .standard)
        let valueLabelPaddingRightSqueezed = SliderLayout.getValueLabelPaddingRight(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .squeezed)
        let valueLabelPaddingRightStandard = SliderLayout.getValueLabelPaddingRight(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .standard)
        
        var _valueLabelPaddingLeft = valueLabelPaddingLeftSqueezed
        var _valueLabelPaddingRight = valueLabelPaddingRightSqueezed
        
        let iconPaddingLeftSqueezed = SliderLayout.getIconPaddingLeft(orientation: orientation,
                                                                      flavor: layoutSchemeFlavor,
                                                                      squeeze: .squeezed)
        let iconPaddingLeftStandard = SliderLayout.getIconPaddingLeft(orientation: orientation,
                                                                      flavor: layoutSchemeFlavor,
                                                                      squeeze: .standard)
        let iconPaddingRightSqueezed = SliderLayout.getIconPaddingRight(orientation: orientation,
                                                                        flavor: layoutSchemeFlavor,
                                                                        squeeze: .squeezed)
        let iconPaddingRightStandard = SliderLayout.getIconPaddingRight(orientation: orientation,
                                                                        flavor: layoutSchemeFlavor,
                                                                        squeeze: .standard)
        
        var _iconPaddingLeft = iconPaddingLeftSqueezed
        var _iconPaddingRight = iconPaddingRightSqueezed
        
        var _sliderBoxWidth = 0
        
        let totalWidth = layoutWidth
        
        var howMuchSpaceWeAreUsingSoFar = 0
        howMuchSpaceWeAreUsingSoFar += universalPaddingLeftSqueezed
        howMuchSpaceWeAreUsingSoFar += universalPaddingRightSqueezed
        
        if isStacked {
            let width1 = iconWidth + iconPaddingLeftSqueezed + iconPaddingRightSqueezed
            let width2 = nameLabelTextWidth + nameLabelPaddingLeftSqueezed + nameLabelPaddingRightSqueezed
            howMuchSpaceWeAreUsingSoFar += max(width1, width2)
        } else {
            let width1 = iconWidth + iconPaddingLeftSqueezed + iconPaddingRightSqueezed
            let width2 = nameLabelTextWidth + nameLabelPaddingLeftSqueezed + nameLabelPaddingRightSqueezed
            howMuchSpaceWeAreUsingSoFar += width1 + width2
        }
        howMuchSpaceWeAreUsingSoFar += (valueLabelTextWidth + valueLabelPaddingLeftSqueezed + valueLabelPaddingRightSqueezed)
        
        let preferredMinimumBarWidth = SliderLayout.getPreferredMinimumBarWidth(orientation: orientation,
                                                                                widthCategory: sliderConfiguration.widthCategory)
        
        // Grow bar to at least the mininum width
        while howMuchSpaceWeAreUsingSoFar < totalWidth && _sliderBoxWidth < preferredMinimumBarWidth {
            howMuchSpaceWeAreUsingSoFar += 1
            _sliderBoxWidth += 1
        }
        
        // Grow all paddings to "standard" size...
        
        if isStacked {
            var consumedBaseWidth = Int(0)
            consumedBaseWidth += universalPaddingRightSqueezed
            consumedBaseWidth += universalPaddingLeftSqueezed
            consumedBaseWidth += valueLabelTextWidth
            consumedBaseWidth += valueLabelPaddingLeftSqueezed
            consumedBaseWidth += valueLabelPaddingRightSqueezed
            consumedBaseWidth += preferredMinimumBarWidth
            
            var consumedWidth = 0
            
            
            while true {
                
                if _universalPaddingLeft >= universalPaddingLeftStandard &&
                    _universalPaddingRight >= universalPaddingRightStandard &&
                    _nameLabelPaddingLeft >= nameLabelPaddingLeftStandard &&
                    _nameLabelPaddingRight >= nameLabelPaddingRightStandard &&
                    _valueLabelPaddingLeft >= valueLabelPaddingLeftStandard &&
                    _valueLabelPaddingRight >= valueLabelPaddingRightStandard &&
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
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                
                if _valueLabelPaddingLeft < valueLabelPaddingLeftStandard && consumedWidth < totalWidth {
                    _valueLabelPaddingLeft += 1
                    consumedBaseWidth += 1
                    didModify = true
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                if _valueLabelPaddingRight < valueLabelPaddingRightStandard && consumedWidth < totalWidth {
                    _valueLabelPaddingRight += 1
                    consumedBaseWidth += 1
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
            
            consumedWidth += valueLabelTextWidth
            consumedWidth += valueLabelPaddingLeftSqueezed
            consumedWidth += valueLabelPaddingRightSqueezed
            
            consumedWidth += preferredMinimumBarWidth
            
            
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
                
                if _valueLabelPaddingLeft < valueLabelPaddingLeftStandard && consumedWidth < totalWidth {
                    _valueLabelPaddingLeft += 1
                    consumedWidth += 1
                    didModify = true
                }
                
                if _valueLabelPaddingRight < valueLabelPaddingRightStandard && consumedWidth < totalWidth {
                    _valueLabelPaddingRight += 1
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
        }
        
        
        howMuchSpaceWeAreUsingSoFar = 0
        
        
        
        howMuchSpaceWeAreUsingSoFar += _universalPaddingLeft
        howMuchSpaceWeAreUsingSoFar += _universalPaddingRight
        
        if isStacked {
            let width1 = iconWidth + _iconPaddingLeft + _iconPaddingRight
            let width2 = nameLabelTextWidth + _nameLabelPaddingLeft + _nameLabelPaddingRight
            howMuchSpaceWeAreUsingSoFar += max(width1, width2)
        } else {
            let width1 = iconWidth + _iconPaddingLeft + _iconPaddingRight
            let width2 = nameLabelTextWidth + _nameLabelPaddingLeft + _nameLabelPaddingRight
            howMuchSpaceWeAreUsingSoFar += width1 + width2
        }
        
        howMuchSpaceWeAreUsingSoFar += (valueLabelTextWidth + _valueLabelPaddingLeft + _valueLabelPaddingRight)
        
        howMuchSpaceWeAreUsingSoFar += _sliderBoxWidth
        
        while howMuchSpaceWeAreUsingSoFar < totalWidth {
            howMuchSpaceWeAreUsingSoFar += 1
            _sliderBoxWidth += 1
        }
        
        nameLabelPaddingLeft = _nameLabelPaddingLeft
        nameLabelPaddingRight = _nameLabelPaddingRight
        
        valueLabelPaddingLeft = _valueLabelPaddingLeft
        valueLabelPaddingRight = _valueLabelPaddingRight
        
        iconPaddingLeft = _iconPaddingLeft
        iconPaddingRight = _iconPaddingRight
        
        sliderBoxWidth = _sliderBoxWidth
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
        
        
        let thumbCircleSize = SliderLayout.getThumbCircleSize(orientation: orientation)
        thumbMaximumX = CGFloat(sliderBoxWidth - thumbCircleSize)
        
        
    }
}