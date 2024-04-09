//
//  MagicalTextIconButtonViewModelUndo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/7/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelUndo: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalTextIconButtonViewModelUndo => handleClicked()")
        
        toolInterfaceViewModel.replaceTopToolbarA()
    }
    
    deinit {
        print("MagicalTextIconButtonViewModelUndo - Dealloc")
    }
}
