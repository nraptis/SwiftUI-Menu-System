//
//  MagicalSegmentedPickerPrimarySegmentButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/24/24.
//

import SwiftUI



struct MagicalSegmentedPickerPrimarySegmentButton: View {
    
    @Environment(MagicalSegmentedPickerViewModel.self) var magicalSegmentedPickerViewModel: MagicalSegmentedPickerViewModel
    @Environment(MagicalSegmentedPickerButtonViewModel.self) var magicalSegmentedPickerButtonViewModel: MagicalSegmentedPickerButtonViewModel
    let index: Int
    let isSelected: Bool
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let segmentedPickerPosition: SegmentedPickerPosition
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.width),
               height: CGFloat(magicalSegmentedPickerViewModel.layoutHeight))
        .offset(x: CGFloat(magicalSegmentedPickerButtonViewModel.x),
                y: CGFloat(magicalSegmentedPickerButtonViewModel.y))
    }
    
    func bodyContent() -> some View {
        
        Button {
            magicalSegmentedPickerViewModel.handleSelectedIndex(index)
        } label: {
            HStack(spacing: 0.0) {
                
            }
            .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.width),
                   height: CGFloat(magicalSegmentedPickerViewModel.layoutHeight))
        }
        .buttonStyle(MagicalSegmentedPickerPrimarySegmentButtonButtonStyle(index: index,
                                                                           isSelected: isSelected,
                                                                           orientation: orientation,
                                                                           layoutSchemeFlavor: layoutSchemeFlavor,
                                                                           segmentedPickerPosition: segmentedPickerPosition,
                                                                           universalPaddingTop: universalPaddingTop,
                                                                           universalPaddingBottom: universalPaddingBottom))
    }
}
