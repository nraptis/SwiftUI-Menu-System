//
//  MagicalTextIconButtonViewModel+BreakManualWeightGraph.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelBreakManualWeightGraph: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionBreakManualWeightGraph()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelBreakManualWeightGraph (Dealloc)")
    }
}
