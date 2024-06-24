//
//  MagicalCheckBoxViewModel+StereoscopicEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelStereoscopicEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        //
        // See if we should be checked...
        //
        
        
        if jiggleViewModel.isStereoscopicEnabled {
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
        print("MagicalCheckBoxViewModelStereoscopicEnabled => handleClicked()")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if jiggleViewModel.isStereoscopicEnabled {
            jiggleViewModel.setStereoscopicEnabled(false)
        } else {
            jiggleViewModel.setStereoscopicEnabled(true)
        }
    }
    
    deinit {
        print("MagicalCheckBoxViewModelStereoscopicEnabled - Dealloc")
    }
}
