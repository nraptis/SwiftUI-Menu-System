//
//  MagicalTextIconButtonViewModel+Redo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelRedo: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionRedo()
    }
    
    override func refresh() {
        
        if let jiggleViewController = jiggleViewModel.jiggleViewController {
            if jiggleViewController.historyController.canRedo() {
                if isEnabled == false {
                    isEnabled = true
                }
            } else {
                if isEnabled == true {
                    isEnabled = false
                }
            }
        }
        super.refresh()
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelRedo (Dealloc)")
    }
}
