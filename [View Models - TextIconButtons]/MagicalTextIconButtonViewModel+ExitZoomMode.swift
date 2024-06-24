//
//  MagicalTextIconButtonViewModel+ExitZoomMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/21/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelExitZoomMode: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionExitZoomMode()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelExitZoomMode (Dealloc)")
    }
}
