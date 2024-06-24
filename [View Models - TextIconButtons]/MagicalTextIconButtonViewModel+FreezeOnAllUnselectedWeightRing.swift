//
//  MagicalTextIconButtonViewModel+FreezeOnAllUnselectedWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/21/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelFreezeOnAllUnselectedWeightRing: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionFreezeOnAllUnselectedWeightRing()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelFreezeOnAllUnselectedWeightRing (Dealloc)")
    }
}
