//
//  MagicalSliderViewModelZoom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/8/24.
//

import Foundation

@Observable class MagicalSliderViewModelZoom: MagicalSliderViewModel {
    
    deinit {
        print("MagicalSliderViewModelZoomAmount - Dealloc")
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        jiggleViewModel.notifySliderStartedZoom(value: value)
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        
        // TODO: Not Done
        
        print("Zoom @ \(value)")
        
        super.handleSlideUpdated(percent: percent)
    }
    
    override func handleSlideFinished(percent: CGFloat) {
        super.handleSlideFinished(percent: percent)
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        
        print("Zoom Over @ \(value)")
        
        jiggleViewModel.notifySliderFinishedZoom(value: value)
    }
}

