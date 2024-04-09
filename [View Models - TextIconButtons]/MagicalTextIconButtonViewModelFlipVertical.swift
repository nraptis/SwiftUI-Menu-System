//
//  MagicalTextIconButtonViewModelFlipVertical.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/8/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelFlipVertical: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalTextIconButtonViewModelFlipVertical => handleClicked()")
        
        toolInterfaceViewModel.replaceTopToolbarA()
    }
    
    deinit {
        print("MagicalTextIconButtonViewModelFlipVertical - Dealloc")
    }
}
