//
//  MagicalTextIconButtonViewModelRecordMovie.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/9/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelRecordMovie: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalTextIconButtonViewModelRecordMovie => handleClicked()")
        
        toolInterfaceViewModel.replaceTopToolbarA()
        
    }
    
    deinit {
        print("MagicalTextIconButtonViewModelRecordMovie - Dealloc")
    }
}
