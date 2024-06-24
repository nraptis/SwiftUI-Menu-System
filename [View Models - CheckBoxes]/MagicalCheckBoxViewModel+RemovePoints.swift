//
//  MagicalCheckBoxViewModel+RemovePoints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelRemovePoints: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        //
        // See if we should be checked...
        //
        
        if jiggleViewModel.jiggleDocument.isRemovePointsEnabled {
            if isChecked == false {
                isChecked = true
            }
            if isHighlighted == false {
                isHighlighted = true
            }
        } else {
            if isChecked == true {
                isChecked = false
            }
            if isHighlighted == true {
                isHighlighted = false
            }
        }
        
        //
        // See if we should be enabled...
        //
        
        if !jiggleViewModel.isAnyJigglePresent {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isCreateJiggleStandardEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isCreateJiggleDrawingEnabled {
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
        print("MagicalCheckBoxViewModelRemovePoints => handleClicked()")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if jiggleViewModel.jiggleDocument.isRemovePointsEnabled {
            jiggleViewModel.removePointsDisable()
        } else {
            jiggleViewModel.removePointsEnable()
        }
    }
    
    deinit {
        print("MagicalCheckBoxViewModelRemovePoints - Dealloc")
    }
}
