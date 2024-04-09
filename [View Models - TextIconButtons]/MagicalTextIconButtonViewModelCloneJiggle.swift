//
//  MagicalTextIconButtonViewModelCloneJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/9/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelCloneJiggle: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalTextIconButtonViewModelCloneJiggle => handleClicked()")
        
        toolInterfaceViewModel.replaceTopToolbarA()
        
    }
    
    deinit {
        print("MagicalTextIconButtonViewModelCloneJiggle - Dealloc")
    }
}
