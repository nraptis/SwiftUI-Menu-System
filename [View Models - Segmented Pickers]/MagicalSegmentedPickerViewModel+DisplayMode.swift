//
//  MagicalSegmentedPickerViewModel+DisplayMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

@Observable class MagicalSegmentedPickerViewModelDisplayMode: MagicalSegmentedPickerViewModel {
    
    override func handleSelectedIndex(_ index: Int) {
        print("MagicalSegmentedPickerViewModelDisplayMode ===> handleSelectedIndex(\(index))")
        
        if toolInterfaceViewModel.isBlocked { return }
        
        if let jiggleViewController = jiggleViewModel.jiggleViewController {
            if index == 0 { jiggleViewController.set(displayMode: .regular) }
            if index == 1 { jiggleViewController.set(displayMode: .swivel) }
            if index == 2 { jiggleViewController.set(displayMode: .split) }
        }
    }
    override func refresh() {
        switch jiggleViewModel.displayMode {
        case .regular:
            selectedSegmentIndex = 0
        case .swivel:
            selectedSegmentIndex = 1
        case .split:
            selectedSegmentIndex = 2
        }
    }
    deinit {
        print("MagicalSegmentedPickerViewModelDisplayMode - Dealloc")
    }
}
