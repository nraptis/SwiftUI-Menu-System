//
//  MagicalTextIconButtonViewModel+ExitWeightMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/17/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelExitWeightMode: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionExitWeightMode()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelExitWeightMode (Dealloc)")
    }
}
