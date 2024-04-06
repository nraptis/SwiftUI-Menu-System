//
//  MagicalSliderViewModelJiggleSpeedAmount.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/21/24.
//

import Foundation

@Observable class MagicalSliderViewModelJiggleSpeed: MagicalSliderViewModel {
    
    override func refresh() {
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            refreshEnabled(value: selectedJiggle.jiggleSpeedAmount)
        } else {
            refreshDisabled()
        }
    }
    
    deinit {
        print("MagicalSliderViewModelJiggleSpeedAmount - Dealloc")
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        jiggleViewModel.notifySliderStartedJiggleSpeed(value: value)
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            selectedJiggle.jiggleSpeedAmount = value
        }
        super.handleSlideUpdated(percent: percent)
    }
    
    override func handleSlideFinished(percent: CGFloat) {
        super.handleSlideFinished(percent: percent)
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            selectedJiggle.jiggleSpeedAmount = value
        }
        jiggleViewModel.notifySliderFinishedJiggleSpeed(value: value)
    }
}

