//
//  MagicalTextIconButtonViewModel+SendFrontJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/21/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelSendFrontJiggle: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionSendFrontJiggle()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelSendFrontJiggle (Dealloc)")
    }
}
