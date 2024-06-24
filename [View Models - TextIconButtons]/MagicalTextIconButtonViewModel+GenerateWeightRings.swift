//
//  MagicalTextIconButtonViewModel+GenerateWeightRings.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelGenerateWeightRings: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionGenerateWeightRings()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelGenerateWeightRings (Dealloc)")
    }
}
