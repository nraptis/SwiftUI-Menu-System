//
//  MagicalTextIconButtonViewModel+SendFrontWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelSendFrontWeightRing: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionSendFrontWeightRing()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelSendFrontWeightRing (Dealloc)")
    }
}
