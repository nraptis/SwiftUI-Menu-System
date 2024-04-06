//
//  MagicalSegmentedPickerViewModelEditMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/22/24.
//

import Foundation

@Observable class MagicalSegmentedPickerViewModelEditMode: MagicalSegmentedPickerViewModel {
    
    deinit {
        print("MagicalSegmentedPickerViewModelEditMode - Dealloc")
    }
    
    override func handleSelectedIndex(_ index: Int) {
        print("MagicalSegmentedPickerViewModelDocumentMode => handleSelectedIndex(\(index))")
        
        if index == 0 {
            jiggleViewModel.set(editMode: .create)
        }
        if index == 1 {
            jiggleViewModel.set(editMode: .affine)
        }
        if index == 2 {
            jiggleViewModel.set(editMode: .point)
        }
        if index == 3 {
            jiggleViewModel.set(editMode: .weight)
        }
    }
    
    override func refresh() {
        switch jiggleViewModel.jiggleDocument.editMode {
        case .create:
            selectedSegmentIndex = 0
        case .affine:
            selectedSegmentIndex = 1
        case .point:
            selectedSegmentIndex = 2
        case .weight:
            selectedSegmentIndex = 3
        }
    }
}
