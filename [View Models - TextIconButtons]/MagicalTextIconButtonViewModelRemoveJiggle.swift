//
//  MagicalTextIconButtonViewModelRemoveJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/8/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelRemoveJiggle: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalTextIconButtonViewModelRemoveJiggle => handleClicked()")
        
        toolInterfaceViewModel.replaceTopToolbarA()
        
    }
    
    deinit {
        print("MagicalTextIconButtonViewModelRemoveJiggle - Dealloc")
    }
}
