//
//  MagicalTextIconButtonViewModel+ResetSwivelFront.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelResetSwivelFront: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionResetSwivelFront()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelResetSwivelFront (Dealloc)")
    }
}
