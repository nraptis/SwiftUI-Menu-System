//
//  MagicalTextIconButtonViewModelPointBreakTangent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/27/24.
//

import Foundation


@Observable class MagicalTextIconButtonViewModelPointBreakTangent: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalTextIconButtonViewModelPointBreakTangent => handleClicked()")
        
        toolInterfaceViewModel.replaceTopToolbarB()
    }
    
    deinit {
        print("MagicalTextIconButtonViewModelPointBreakTangent - Dealloc")
    }
}
