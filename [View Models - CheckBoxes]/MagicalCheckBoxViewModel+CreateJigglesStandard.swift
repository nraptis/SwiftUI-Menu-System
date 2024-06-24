//
//  MagicalCheckBoxViewModel+CreateJigglesStandard.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelCreateJigglesStandard: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        //
        // See if we should be checked...
        //
        
        if jiggleViewModel.jiggleDocument.isCreateJiggleStandardEnabled {
            if isChecked == false {
                isChecked = true
            }
        } else {
            if isChecked == true {
                isChecked = false
            }
        }
        
        //
        // See if we should be highlighted...
        //
        
        if jiggleViewModel.jiggleDocument.isCreateJiggleStandardEnabled {
            if isHighlighted == false {
                isHighlighted = true
            }
        } else {
            if isHighlighted == true {
                isHighlighted = false
            }
        }
        
        //
        // See if we should be enabled...
        //
        
        if jiggleViewModel.jiggleDocument.isCreatePointsEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isRemovePointsEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isCreateWeightRingsStandardEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isCreateWeightRingsDrawingEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isCreateWeightRingPointsEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isRemoveWeightRingPointsEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if isEnabled == false {
            isEnabled = true
        }
        
        
    }
    
    override func handleClicked() {
        print("MagicalCheckBoxViewModelCreateJigglesStandard => handleClicked()")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if jiggleViewModel.jiggleDocument.isCreateJiggleStandardEnabled {
            jiggleViewModel.createJiggleStandardDisable()
        } else {
            jiggleViewModel.createJiggleStandardEnable()
        }
    }
    
    deinit {
        print("MagicalCheckBoxViewModelCreateJigglesStandard - Dealloc")
    }
}
