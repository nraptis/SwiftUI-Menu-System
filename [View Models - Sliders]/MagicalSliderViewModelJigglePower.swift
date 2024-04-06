//
//  MagicalSliderViewModelJigglePowerPower.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/22/24.
//

import Foundation

@Observable class MagicalSliderViewModelJigglePower: MagicalSliderViewModel {
    
    override func refresh() {
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            refreshEnabled(value: selectedJiggle.jigglePowerAmount)
        } else {
            refreshDisabled()
        }
    }
    
    deinit {
        print("MagicalSliderViewModelJigglePowerAmount - Dealloc")
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        jiggleViewModel.notifySliderStartedJigglePower(value: value)
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            selectedJiggle.jigglePowerAmount = value
        }
        super.handleSlideUpdated(percent: percent)
    }
    
    override func handleSlideFinished(percent: CGFloat) {
        super.handleSlideFinished(percent: percent)
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            selectedJiggle.jigglePowerAmount = value
        }
        jiggleViewModel.notifySliderFinishedJigglePower(value: value)
    }
}
