//
//  MagicalCheckBoxViewModel+ReverseMotionEvenEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelReverseMotionEvenEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        //
        // See if we should be checked...
        //
        
        /*
        if jiggleViewModel.isZoomEnabled {
            if isChecked == false {
                isChecked = true
            }
        } else {
            if isChecked == true {
                isChecked = false
            }
        }
        */
        
        //
        // See if we should be enabled...
        //
        
        finishRefreshEnableCheckForAllCreateModes()
    }
    
    override func handleClicked() {
        print("MagicalCheckBoxViewModelReverseMotionEvenEnabled => handleClicked()")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        /*
        if jiggleViewModel.isZoomEnabled {
            jiggleViewModel.setZoomEnabled(false)
        } else {
            jiggleViewModel.setZoomEnabled(true)
        }
        */
    }
    
    deinit {
        print("MagicalCheckBoxViewModelReverseMotionEvenEnabled - Dealloc")
    }
}
