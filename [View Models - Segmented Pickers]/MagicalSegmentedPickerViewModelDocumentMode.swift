//
//  MagicalSegmentedPickerViewModelDocumentMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/22/24.
//

import Foundation

@Observable class MagicalSegmentedPickerViewModelDocumentMode: MagicalSegmentedPickerViewModel {
    
    deinit {
        print("MagicalSegmentedPickerViewModelDocumentMode - Dealloc")
    }
    
    override func handleSelectedIndex(_ index: Int) {
        print("MagicalSegmentedPickerViewModelDocumentMode => handleSelectedIndex(\(index))")
        
        if index == 0 {
            jiggleViewModel.set(documentMode: .view)
        }
        if index == 1 {
            jiggleViewModel.set(documentMode: .edit)
        }
        
    }
    
    override func refresh() {
        switch jiggleViewModel.jiggleDocument.documentMode {
        case .view:
            selectedSegmentIndex = 0
        case .edit:
            selectedSegmentIndex = 1
        }
    }
    
    
}
