//
//  MagicalSegmentedPickerViewModel+WeightMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

@Observable class MagicalSegmentedPickerViewModelWeightMode: MagicalSegmentedPickerViewModel {
    
    override func handleSelectedIndex(_ index: Int) {
        print("MagicalSegmentedPickerViewModelWeightMode ===> handleSelectedIndex(\(index))")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if index == 0 { jiggleViewModel.set(weightMode: .affine) }
        if index == 1 { jiggleViewModel.set(weightMode: .points) }
        if index == 2 { jiggleViewModel.set(weightMode: .centers) }
    }
    
    override func refresh() {
        switch jiggleViewModel.jiggleDocument.weightMode {
        case .affine:
            selectedSegmentIndex = 0
        case .points:
            selectedSegmentIndex = 1
        case .centers:
            selectedSegmentIndex = 2
        }
    }
    deinit {
        print("MagicalSegmentedPickerViewModelWeightMode - Dealloc")
    }
}
