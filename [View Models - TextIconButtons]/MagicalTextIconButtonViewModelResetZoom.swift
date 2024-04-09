//
//  MagicalTextIconButtonViewModelResetZoom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/27/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelResetZoom: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalTextIconButtonViewModelResetZoom => handleClicked()")
        
        toolInterfaceViewModel.replaceTopToolbarB()
    }
    
    deinit {
        print("MagicalTextIconButtonViewModelResetZoom - Dealloc")
    }
}
