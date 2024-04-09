//
//  MagicalTextIconButtonViewModelRedo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/7/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelRedo: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalTextIconButtonViewModelRedo => handleClicked()")
        
        toolInterfaceViewModel.replaceTopToolbarA()
    }
    
    deinit {
        print("MagicalTextIconButtonViewModelRedo - Dealloc")
    }
}
