//
//  MagicalTextIconButtonViewModel+PhoneCollapseTopMenu.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelPhoneCollapseTopMenu: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionPhoneCollapseTopMenu()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelPhoneCollapseTopMenu (Dealloc)")
    }
}
