//
//  MagicalSegmentedPickerViewModel+AnimationMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

@Observable class MagicalSegmentedPickerViewModelAnimationMode: MagicalSegmentedPickerViewModel {
    
    override func handleSelectedIndex(_ index: Int) {
        print("MagicalSegmentedPickerViewModelAnimationMode ===> handleSelectedIndex(\(index))")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if index == 0 { jiggleViewModel.set(animationMode: .bounce) }
        if index == 1 { jiggleViewModel.set(animationMode: .wobble) }
        if index == 2 { jiggleViewModel.set(animationMode: .twist) }
    }
    
    override func refresh() {
        switch jiggleViewModel.jiggleDocument.animationMode {
        case .bounce:
            selectedSegmentIndex = 0
        case .wobble:
            selectedSegmentIndex = 1
        case .twist:
            selectedSegmentIndex = 2
        }
    }
    deinit {
        print("MagicalSegmentedPickerViewModelAnimationMode - Dealloc")
    }
}
