//
//  MagicalTextIconButtonViewModel+ResetSwivelBack.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelResetSwivelBack: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionResetSwivelBack()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelResetSwivelBack (Dealloc)")
    }
}
