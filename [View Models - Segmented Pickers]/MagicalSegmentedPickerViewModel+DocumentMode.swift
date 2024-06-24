//
//  MagicalSegmentedPickerViewModel+DocumentMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

@Observable class MagicalSegmentedPickerViewModelDocumentMode: MagicalSegmentedPickerViewModel {
    
    override func handleSelectedIndex(_ index: Int) {
        print("MagicalSegmentedPickerViewModelDocumentMode ===> handleSelectedIndex(\(index))")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if let jiggleViewController = jiggleViewModel.jiggleViewController {
            
            if index == 0 { jiggleViewController.set(documentMode: .view) }
            if index == 1 { jiggleViewController.set(documentMode: .jiggles) }
            if index == 2 { jiggleViewController.set(documentMode: .points) }
            if index == 3 { jiggleViewController.set(documentMode: .weights) }
        }
    }
    
    override func refresh() {
        switch jiggleViewModel.jiggleDocument.documentMode {
        case .view:
            selectedSegmentIndex = 0
        case .jiggles:
            selectedSegmentIndex = 1
        case .points:
            selectedSegmentIndex = 2
        case .weights:
            selectedSegmentIndex = 3
        }
    }
    
    deinit {
        print("MagicalSegmentedPickerViewModelDocumentMode - Dealloc")
    }
}
