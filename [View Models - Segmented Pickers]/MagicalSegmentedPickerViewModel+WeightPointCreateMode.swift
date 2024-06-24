//
//  MagicalSegmentedPickerViewModel+WeightPointCreateMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

@Observable class MagicalSegmentedPickerViewModelWeightPointCreateMode: MagicalSegmentedPickerViewModel {
    
    override func handleSelectedIndex(_ index: Int) {
        print("MagicalSegmentedPickerViewModelWeightPointCreateMode ===> handleSelectedIndex(\(index))")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if index == 0 { jiggleViewModel.set(weightPointCreateMode: .nearest) }
        if index == 1 { jiggleViewModel.set(weightPointCreateMode: .after) }
        if index == 2 { jiggleViewModel.set(weightPointCreateMode: .before) }
    }
    override func refresh() {
        switch jiggleViewModel.jiggleDocument.weightPointCreateMode {
        case .nearest:
            selectedSegmentIndex = 0
        case .after:
            selectedSegmentIndex = 1
        case .before:
            selectedSegmentIndex = 2
        }
    }
    deinit {
        print("MagicalSegmentedPickerViewModelWeightPointCreateMode - Dealloc")
    }
}
