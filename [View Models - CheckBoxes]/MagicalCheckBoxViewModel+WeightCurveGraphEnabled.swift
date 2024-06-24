//
//  MagicalCheckBoxViewModel+WeightCurveGraphEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelWeightCurveGraphEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if jiggleViewModel.isWeightCurveGraphEnabled {
            if isChecked == false {
                isChecked = true
            }
        } else {
            if isChecked == true {
                isChecked = false
            }
        }
        
        //
        // See if we should be enabled...
        //
        
        finishRefreshEnableCheckForAllCreateModes()
    }
    
    override func handleClicked() {
        print("MagicalCheckBoxViewModelWeightCurveGraphEnabled => handleClicked()")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if let jiggleViewController = jiggleViewModel.jiggleViewController {
            let time = JiggleViewController.getGraphAnimationTime(orientation: jiggleViewModel.jiggleDocument.orientation)
            let previousDisplayMode = jiggleViewModel.displayMode
            let currentDisplayMode = jiggleViewModel.displayMode
            if jiggleViewModel.isWeightCurveGraphEnabled {
                jiggleViewController.exitGraphModeSafe(time: time,
                                                       previousDisplayMode: previousDisplayMode,
                                                       currentDisplayMode: currentDisplayMode)
            } else {
                jiggleViewController.enterGraphModeSafe(time: time,
                                                        previousDisplayMode: previousDisplayMode,
                                                        currentDisplayMode: currentDisplayMode)
            }
        }
    }
    
    deinit {
        print("MagicalCheckBoxViewModelWeightCurveGraphEnabled - Dealloc")
    }
}
