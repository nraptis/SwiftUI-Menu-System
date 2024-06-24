//
//  MagicalTextIconButtonViewModel+ExitRecordMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelExitRecordMode: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        toolInterfaceViewModel.toolActionExitRecordMode()
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        print("[Deinit] MagicalTextIconButtonViewModelExitRecordMode (Dealloc)")
    }
}
