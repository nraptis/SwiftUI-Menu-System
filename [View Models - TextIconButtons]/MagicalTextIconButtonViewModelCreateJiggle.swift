//
//  MagicalTextIconButtonViewModelCreateJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/8/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelCreateJiggle: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalTextIconButtonViewModelCreateJiggle => handleClicked()")
        
        toolInterfaceViewModel.replaceTopToolbarA()
        
    }
    
    deinit {
        print("MagicalTextIconButtonViewModelCreateJiggle - Dealloc")
    }
}
