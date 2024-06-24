//
//  MagicalTextIconButtonViewModel+IncreaseWeightRingPoints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelIncreaseWeightRingPoints: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionIncreaseWeightRingPoints()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelIncreaseWeightRingPoints (Dealloc)")
    }
}
