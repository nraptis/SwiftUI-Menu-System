//
//  MagicalTextIconButtonViewModel+RemoveJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelRemoveJiggle: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionRemoveJiggle()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelRemoveJiggle (Dealloc)")
    }
}
