//
//  MagicalTextIconButtonViewModel+ExitViewMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/17/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelExitViewMode: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionExitViewMode()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelExitViewMode (Dealloc)")
    }
}
