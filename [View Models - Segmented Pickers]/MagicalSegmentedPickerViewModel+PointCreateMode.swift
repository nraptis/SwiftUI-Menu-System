//
//  MagicalSegmentedPickerViewModel+PointCreateMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

@Observable class MagicalSegmentedPickerViewModelPointCreateMode: MagicalSegmentedPickerViewModel {
    
    override func handleSelectedIndex(_ index: Int) {
        print("MagicalSegmentedPickerViewModelPointCreateMode ===> handleSelectedIndex(\(index))")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if index == 0 { jiggleViewModel.set(pointCreateMode: .nearest) }
        if index == 1 { jiggleViewModel.set(pointCreateMode: .after) }
        if index == 2 { jiggleViewModel.set(pointCreateMode: .before) }
    }
    
    override func refresh() {
        switch jiggleViewModel.jiggleDocument.pointCreateMode {
        case .nearest:
            selectedSegmentIndex = 0
        case .after:
            selectedSegmentIndex = 1
        case .before:
            selectedSegmentIndex = 2
        }
    }
    
    deinit {
        print("MagicalSegmentedPickerViewModelPointCreateMode - Dealloc")
    }
}
