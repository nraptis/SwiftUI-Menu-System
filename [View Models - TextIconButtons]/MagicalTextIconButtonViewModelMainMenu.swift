//
//  MagicalTextIconButtonViewModelMainMenu.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/26/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelMainMenu: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalTextIconButtonViewModelMainMenu => handleClicked()")
        
        toolInterfaceViewModel.replaceTopToolbarA()
    }
    
    deinit {
        print("MagicalTextIconButtonViewModelMainMenu - Dealloc")
    }
}
