//
//  MagicalTextIconButtonViewModel+FreezeOnAllUnselectedJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/21/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelFreezeOnAllUnselectedJiggle: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionFreezeOnAllUnselectedJiggle()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelFreezeOnAllUnselectedJiggle (Dealloc)")
    }
}
