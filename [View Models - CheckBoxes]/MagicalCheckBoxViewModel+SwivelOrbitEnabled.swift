//
//  MagicalCheckBoxViewModel+SwivelOrbitEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelSwivelOrbitEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if jiggleViewModel.isSwivelOrbitEnabled {
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
        print("MagicalCheckBoxViewModelSwivelOrbitEnabled => handleClicked()")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if jiggleViewModel.isSwivelOrbitEnabled {
            jiggleViewModel.setSwivelOrbitEnabled(false)
        } else {
            jiggleViewModel.setSwivelOrbitEnabled(true)
        }
    }
    
    deinit {
        print("MagicalCheckBoxViewModelSwivelOrbitEnabled - Dealloc")
    }
}
