//
//  MagicalTextIconButtonViewModel+ResetSwivelLeft.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelResetSwivelLeft: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionResetSwivelLeft()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelResetSwivelLeft (Dealloc)")
    }
}
