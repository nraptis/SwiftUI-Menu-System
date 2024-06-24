//
//  MagicalCheckBoxViewModel+DarkModeEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/20/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelDarkModeEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if jiggleViewModel.isDarkModeEnabled {
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
        print("MagicalCheckBoxViewModelDarkModeEnabled => handleClicked()")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if jiggleViewModel.isDarkModeEnabled {
            jiggleViewModel.setDarkModeEnabled(false)
        } else {
            jiggleViewModel.setDarkModeEnabled(true)
        }
    }
    
    deinit {
        print("MagicalCheckBoxViewModelDarkModeEnabled - Dealloc")
    }
}
