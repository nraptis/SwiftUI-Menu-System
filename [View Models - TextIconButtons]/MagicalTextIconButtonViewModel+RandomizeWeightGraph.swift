//
//  MagicalTextIconButtonViewModel+RandomizeWeightGraph.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelRandomizeWeightGraph: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionRandomizeWeightGraph()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelRandomizeWeightGraph (Dealloc)")
    }
}
