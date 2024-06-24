//
//  MagicalIconButtonViewModelExpand.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation

@Observable class MagicalIconButtonViewModelPhoneCollapseTop: MagicalIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalIconButtonViewModelPhoneCollapseTop => handleClicked()")
        toolInterfaceViewModel.toolActionPhoneCollapseTopMenu()
    }
    
    deinit {
        print("MagicalIconButtonViewModelPhoneCollapseTop - Dealloc")
    }
    
}
