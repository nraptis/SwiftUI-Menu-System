//
//  MagicalCheckBoxViewModel+RemoveWeightRingPoints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelRemoveWeightRingPoints: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if jiggleViewModel.jiggleDocument.isRemoveWeightRingPointsEnabled {
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
        
        if isEnabled == false {
            isEnabled = true
        }
    }
    
    override func handleClicked() {
        print("MagicalCheckBoxViewModelRemoveWeightRingPoints => handleClicked()")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if jiggleViewModel.jiggleDocument.isRemoveWeightRingPointsEnabled {
            jiggleViewModel.removeWeightRingPointsDisable()
        } else {
            jiggleViewModel.removeWeightRingPointsEnable()
        }
    }
    
    deinit {
        print("MagicalCheckBoxViewModelRemoveWeightRingPoints - Dealloc")
    }
}
