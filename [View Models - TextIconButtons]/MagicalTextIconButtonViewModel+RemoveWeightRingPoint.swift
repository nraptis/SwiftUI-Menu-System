//
//  MagicalTextIconButtonViewModel+RemoveWeightRingPoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelRemoveWeightRingPoint: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionRemoveWeightRingPoint()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelRemoveWeightRingPoint (Dealloc)")
    }
}
