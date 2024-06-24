//
//  MagicalTextIconButtonViewModel+FreezeOnSelectedWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelFreezeOnSelectedWeightRing: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionFreezeOnSelectedWeightRing()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelFreezeOnSelectedWeightRing (Dealloc)")
    }
}
