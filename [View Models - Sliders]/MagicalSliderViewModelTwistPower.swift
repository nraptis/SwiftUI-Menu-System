//
//  MagicalSliderViewModelTwistPower.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/8/24.
//

import Foundation

@Observable class MagicalSliderViewModelTwistPower: MagicalSliderViewModel {
    
    override func refresh() {
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            refreshEnabled(value: selectedJiggle.twistPower)
        } else {
            refreshDisabled()
        }
    }
    
    deinit {
        print("MagicalSliderViewModelTwistPowerAmount - Dealloc")
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        jiggleViewModel.notifySliderStartedTwistPower(value: value)
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            selectedJiggle.twistPower = value
        }
        super.handleSlideUpdated(percent: percent)
    }
    
    override func handleSlideFinished(percent: CGFloat) {
        super.handleSlideFinished(percent: percent)
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            selectedJiggle.twistPower = value
        }
        jiggleViewModel.notifySliderFinishedTwistPower(value: value)
    }
}

