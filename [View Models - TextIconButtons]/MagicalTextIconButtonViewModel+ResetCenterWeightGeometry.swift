//
//  MagicalTextIconButtonViewModel+ResetCenterWeightGeometry.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelResetCenterWeightGeometry: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionResetCenterWeightGeometry()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelResetCenterWeightGeometry (Dealloc)")
    }
}
