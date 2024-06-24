//
//  MagicalTextIconButtonViewModel+PhoneExpandTopMenu.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelPhoneExpandTopMenu: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionPhoneExpandTopMenu()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelPhoneExpandTopMenu (Dealloc)")
    }
}
