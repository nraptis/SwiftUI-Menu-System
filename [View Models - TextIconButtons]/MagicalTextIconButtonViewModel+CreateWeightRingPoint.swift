//
//  MagicalTextIconButtonViewModel+CreateWeightRingPoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelCreateWeightRingPoint: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionCreateWeightRingPoint()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelCreateWeightRingPoint (Dealloc)")
    }
}
