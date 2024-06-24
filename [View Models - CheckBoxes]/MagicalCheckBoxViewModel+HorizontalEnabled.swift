//
//  MagicalCheckBoxViewModel+HorizontalEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelHorizontalEnabled: MagicalCheckBoxViewModel {
    
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
        print("MagicalCheckBoxViewModelHorizontalEnabled => handleClicked()")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if let jiggleViewController = jiggleViewModel.jiggleViewController {
            
        }
        
        /*
        if jiggleViewModel.isZoomEnabled {
            jiggleViewModel.setZoomEnabled(false)
        } else {
            jiggleViewModel.setZoomEnabled(true)
        }
        */
    }
    
    deinit {
        print("MagicalCheckBoxViewModelHorizontalEnabled - Dealloc")
    }
}
