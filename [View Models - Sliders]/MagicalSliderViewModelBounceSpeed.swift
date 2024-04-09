//
//  MagicalSliderViewModelBounceSpeed.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/9/24.
//

import Foundation

@Observable class MagicalSliderViewModelBounceSpeed: MagicalSliderViewModel {
    
    override func refresh() {
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            refreshEnabled(value: selectedJiggle.bounceSpeed)
        } else {
            refreshDisabled()
        }
    }
    
    deinit {
        print("MagicalSliderViewModelBounceSpeedAmount - Dealloc")
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        jiggleViewModel.notifySliderStartedBounceSpeed(value: value)
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            selectedJiggle.bounceSpeed = value
        }
        super.handleSlideUpdated(percent: percent)
    }
    
    override func handleSlideFinished(percent: CGFloat) {
        super.handleSlideFinished(percent: percent)
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            selectedJiggle.bounceSpeed = value
        }
        jiggleViewModel.notifySliderFinishedBounceSpeed(value: value)
    }
}

