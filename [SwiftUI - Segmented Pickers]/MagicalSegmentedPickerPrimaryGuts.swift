//
//  MagicalSegmentedPickerPrimaryGuts.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/2/24.
//

import SwiftUI

struct MagicalSegmentedPickerPrimaryGuts: View {
    
    @Environment(MagicalSegmentedPickerViewModel.self) var magicalSegmentedPickerViewModel: MagicalSegmentedPickerViewModel
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let layoutWidth: Int
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalSegmentedPickerViewModel.layoutHeight))
    }
    
    func bodyContent() -> some View {
        
        let layoutSchemeFlavor = magicalSegmentedPickerViewModel.getLayoutSchemeFlavor()
        let buttonCount = magicalSegmentedPickerViewModel.segmentedPickerConfiguration.buttonConfigurations.count
        let buttonCount1 = (buttonCount - 1)
        
        var greatestNumberOfLines = 0
        for buttonConfiguration in magicalSegmentedPickerViewModel.segmentedPickerConfiguration.buttonConfigurations {
            let line1 = buttonConfiguration.nameLabelLine1
            let line2 = buttonConfiguration.nameLabelLine2
            let _numberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: line1, line2: line2)
            greatestNumberOfLines = max(greatestNumberOfLines, _numberOfLines)
        }
        
        let universalPaddingTop = SegmentedPickerLayout.getUniversalPaddingTop(orientation: orientation,
                                                                               flavor: layoutSchemeFlavor,
                                                                               numberOfLines: greatestNumberOfLines)
        let universalPaddingBottom = SegmentedPickerLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     numberOfLines: greatestNumberOfLines)
        
        return GeometryReader { _ in
            ForEach(magicalSegmentedPickerViewModel.segmentedPickerConfiguration.buttonConfigurations) { buttonConfiguration in
                let index = Int(buttonConfiguration.id)
                let buttonViewModel = magicalSegmentedPickerViewModel.buttonViewModels[index]
                let segmentedPickerPosition = getPosition(index: index, count1: buttonCount1)
                let isSelected = magicalSegmentedPickerViewModel.selectedSegmentIndex == index
                MagicalSegmentedPickerPrimarySegmentButton(index: index,
                                                           isSelected: isSelected,
                                                           orientation: orientation,
                                                           layoutSchemeFlavor: layoutSchemeFlavor,
                                                           segmentedPickerPosition: segmentedPickerPosition, 
                                                           universalPaddingTop: universalPaddingTop,
                                                           universalPaddingBottom: universalPaddingBottom)
                .environment(buttonViewModel)
            }
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalSegmentedPickerViewModel.layoutHeight))
    }
    
    func getPosition(index: Int, count1: Int) -> SegmentedPickerPosition {
        if index == 0 {
            return .bookendLeft
        } else if index == count1 {
            return .bookendRight
        } else {
            return .middle
        }
    }
}
