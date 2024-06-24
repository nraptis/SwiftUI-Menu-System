//
//  MagicalIconButtonViewModelCollapse.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation

@Observable class MagicalIconButtonViewModelPhoneCollapseBottom: MagicalIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalIconButtonViewModelPhoneCollapseBottom => handleClicked()")
        toolInterfaceViewModel.toolActionPhoneCollapseBottomMenu()
    }
    
    deinit {
        print("MagicalIconButtonViewModelPhoneCollapseBottom - Dealloc")
    }
}
