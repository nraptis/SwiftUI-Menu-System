//
//  MagicalTextIconButtonViewModel+SelectPreviousWeightRingPoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelSelectPreviousWeightRingPoint: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionSelectPreviousWeightRingPoint()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelSelectPreviousWeightRingPoint (Dealloc)")
    }
}
