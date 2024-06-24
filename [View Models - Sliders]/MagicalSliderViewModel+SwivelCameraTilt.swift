//
//  MagicalSliderViewModel+SwivelCameraTilt.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/24/24.
//

import Foundation

@Observable class MagicalSliderViewModelSwivelCameraTilt: MagicalSliderViewModel {
    
    override func refresh() {
        /*
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            refreshEnabled(value: selectedJiggle.bouncePower)
        } else {
            refreshDisabled()
        }
        */
    }
    
    deinit {
        print("MagicalSlider SwivelCameraTilt - Dealloc")
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        jiggleViewModel.notifySliderStartedSwivelCameraTilt(value: value)
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        /*
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            
            selectedJiggle.bouncePower = value
        }
        */
        super.handleSlideUpdated(percent: percent)
    }
    
    override func handleSlideFinished(percent: CGFloat) {
        super.handleSlideFinished(percent: percent)
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        /*
        
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            selectedJiggle.bouncePower = value
        }
        
        */
        jiggleViewModel.notifySliderFinishedSwivelCameraTilt(value: value)
    }
}
