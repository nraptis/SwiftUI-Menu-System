//
//  MagicalTextIconButtonViewModel+GenerateTopography.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/17/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelGenerateTopography: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionGenerateTopography()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelGenerateTopography (Dealloc)")
    }
}
