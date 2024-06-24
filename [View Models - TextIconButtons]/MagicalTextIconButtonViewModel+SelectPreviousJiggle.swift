//
//  MagicalTextIconButtonViewModel+SelectPreviousJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelSelectPreviousJiggle: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionSelectPreviousJiggle()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelSelectPreviousJiggle (Dealloc)")
    }
}
