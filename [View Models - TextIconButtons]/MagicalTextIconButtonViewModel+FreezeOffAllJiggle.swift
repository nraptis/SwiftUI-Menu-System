//
//  MagicalTextIconButtonViewModel+FreezeOffAllJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelFreezeOffAllJiggle: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionFreezeOffAllJiggle()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelFreezeOffAllJiggle (Dealloc)")
    }
}
