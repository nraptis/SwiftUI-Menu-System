//
//  MagicalTextIconButtonViewModel+FreezeOnAllWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelFreezeOnAllWeightRing: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionFreezeOnAllWeightRing()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelFreezeOnAllWeightRing (Dealloc)")
    }
}
