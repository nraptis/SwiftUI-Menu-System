//
//  MagicalTextIconButtonViewModel+FreezeOffAllWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelFreezeOffAllWeightRing: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionFreezeOffAllWeightRing()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelFreezeOffAllWeightRing (Dealloc)")
    }
}
