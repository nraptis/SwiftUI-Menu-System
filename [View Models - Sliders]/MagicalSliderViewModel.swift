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
    var thumbMinimumX: CGFloat
    var thumbMaximumX: CGFloat
    var thumbOffsetX = CGFloat(0.0)
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var valueLabelPaddingLeft = 0
    var valueLabelPaddingRight = 0
    
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
    
    func refreshThumbPosition() {
        
    }
    
    func getValueString() -> String {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        let formatString = "%.\(sliderConfiguration.valueDecimalCount)f"
        return String(format: formatString, value)
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        
        let nameLabelTextWidth: Int
        let valueLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long, .stackedLarge:
            nameLabelTextWidth = sliderConfiguration.layoutNameLabelWidthLarge
            valueLabelTextWidth = sliderConfiguration.valueLabelWidthLarge
        case .stackedMedium:
            nameLabelTextWidth = sliderConfiguration.layoutNameLabelWidthMedium
            valueLabelTextWidth = sliderConfiguration.valueLabelWidthMedium
        case .stackedSmall:
            nameLabelTextWidth = sliderConfiguration.layoutNameLabelWidthSmall
            valueLabelTextWidth = sliderConfiguration.valueLabelWidthSmall
        }
        
        let universalPaddingLeftSqueezed = SliderLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                squeeze: .squeezed,
                                                                                neighborTypeLeft: neighborTypeLeft,
                                                                                neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStandard = SliderLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                squeeze: .standard,
                                                                                neighborTypeLeft: neighborTypeLeft,
                                                                                neighborTypeRight: neighborTypeRight)
        let universalPaddingRightSqueezed = SliderLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .squeezed,
                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                  neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStandard = SliderLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .standard,
                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                  neighborTypeRight: neighborTypeRight)
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
        
        var _sliderBoxWidth = 0
        
        let totalWidth = layoutWidth
        
        var howMuchSpaceWeAreUsingSoFar = 0
        howMuchSpaceWeAreUsingSoFar += universalPaddingLeftSqueezed
        howMuchSpaceWeAreUsingSoFar += universalPaddingRightSqueezed
        
        howMuchSpaceWeAreUsingSoFar += nameLabelTextWidth
        howMuchSpaceWeAreUsingSoFar += nameLabelPaddingLeftSqueezed
        howMuchSpaceWeAreUsingSoFar += nameLabelPaddingRightSqueezed
        
        howMuchSpaceWeAreUsingSoFar += valueLabelTextWidth
        howMuchSpaceWeAreUsingSoFar += valueLabelPaddingLeftSqueezed
        howMuchSpaceWeAreUsingSoFar += valueLabelPaddingRightSqueezed
        
        let preferredMinimumBarWidth = SliderLayout.getPreferredMinimumBarWidth(orientation: orientation,
                                                                                widthCategory: sliderConfiguration.widthCategory)
        
        // Grow bar to at least the mininum width
        while howMuchSpaceWeAreUsingSoFar < totalWidth && _sliderBoxWidth < preferredMinimumBarWidth {
            howMuchSpaceWeAreUsingSoFar += 1
            _sliderBoxWidth += 1
        }
        
        // Grow all paddings to "standard" size...
        var consumedWidth = Int(0)
        consumedWidth += universalPaddingRightSqueezed
        consumedWidth += universalPaddingLeftSqueezed
        
        consumedWidth += nameLabelTextWidth
        consumedWidth += nameLabelPaddingLeftSqueezed
        consumedWidth += nameLabelPaddingRightSqueezed
        
        consumedWidth += valueLabelTextWidth
        consumedWidth += valueLabelPaddingLeftSqueezed
        consumedWidth += valueLabelPaddingRightSqueezed
        
        consumedWidth += preferredMinimumBarWidth
        
        
        while consumedWidth < totalWidth {
            
            var didModify = false
            
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
        
        howMuchSpaceWeAreUsingSoFar = 0
        
        howMuchSpaceWeAreUsingSoFar += _universalPaddingLeft
        howMuchSpaceWeAreUsingSoFar += _universalPaddingRight
        
        howMuchSpaceWeAreUsingSoFar += nameLabelTextWidth
        howMuchSpaceWeAreUsingSoFar += _nameLabelPaddingLeft
        howMuchSpaceWeAreUsingSoFar += _nameLabelPaddingRight

        
        howMuchSpaceWeAreUsingSoFar += valueLabelTextWidth
        howMuchSpaceWeAreUsingSoFar += _valueLabelPaddingLeft
        howMuchSpaceWeAreUsingSoFar += _valueLabelPaddingRight
        howMuchSpaceWeAreUsingSoFar += _sliderBoxWidth
        
        if howMuchSpaceWeAreUsingSoFar < totalWidth {
            _sliderBoxWidth += (totalWidth - howMuchSpaceWeAreUsingSoFar)
        }
        
        nameLabelPaddingLeft = _nameLabelPaddingLeft
        nameLabelPaddingRight = _nameLabelPaddingRight
        
        valueLabelPaddingLeft = _valueLabelPaddingLeft
        valueLabelPaddingRight = _valueLabelPaddingRight
        
        sliderBoxWidth = _sliderBoxWidth
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
        
        
        let thumbWidth = SliderLayout.getThumbWidth(orientation: orientation)
        
        let thumbInset = SliderLayout.getThumbInset(orientation: orientation)
        
        let bumperWidth = SliderLayout.getBumperWidth(orientation: orientation)
        
        thumbMinimumX = CGFloat(thumbInset + bumperWidth)
        thumbMaximumX = CGFloat(sliderBoxWidth - (thumbWidth + thumbInset + bumperWidth))
        
        thumbOffsetX = thumbMinimumX + (thumbMaximumX - thumbMinimumX) * percent
        
    }
}
