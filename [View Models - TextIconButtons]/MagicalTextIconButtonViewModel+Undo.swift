//
//  MagicalTextIconButtonViewModel+Undo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelUndo: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionUndo()
    }
    
    override func refresh() {
        
        if let jiggleViewController = jiggleViewModel.jiggleViewController {
            if jiggleViewController.historyController.canUndo() {
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
        print("[Deinit] MagicalTextIconButtonViewModelUndo (Dealloc)")
    }
}
