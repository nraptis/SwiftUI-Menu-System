//
//  MagicalTextIconButtonViewModel+IncreaseJigglePoints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelIncreaseJigglePoints: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionIncreaseJigglePoints()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelIncreaseJigglePoints (Dealloc)")
    }
}
