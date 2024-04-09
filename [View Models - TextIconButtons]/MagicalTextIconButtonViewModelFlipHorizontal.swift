//
//  MagicalTextIconButtonViewModelFlipHorizontal.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/8/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelFlipHorizontal: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalTextIconButtonViewModelFlipHorizontal => handleClicked()")
        
        toolInterfaceViewModel.replaceTopToolbarA()
        
    }
    
    deinit {
        print("MagicalTextIconButtonViewModelFlipHorizontal - Dealloc")
    }
}
