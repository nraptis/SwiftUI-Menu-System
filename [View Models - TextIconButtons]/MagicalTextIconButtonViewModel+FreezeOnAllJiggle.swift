//
//  MagicalTextIconButtonViewModel+FreezeOnAllJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelFreezeOnAllJiggle: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionFreezeOnAllJiggle()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelFreezeOnAllJiggle (Dealloc)")
    }
}
