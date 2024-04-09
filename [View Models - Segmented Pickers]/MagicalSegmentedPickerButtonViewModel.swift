//
//  MagicalSegmentedPickerButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/1/24.
//

import Foundation

@Observable class MagicalSegmentedPickerButtonViewModel {
    
    deinit {
        print("MagicalSegmentedPickerButtonViewModel - Dealloc")
    }
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var iconPaddingLeft = 0
    var iconPaddingRight = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    var x = 0
    var y = 0
    var width = 128
    
    let orientation: Orientation
    let segmentedPickerButtonConfiguration: ToolInterfaceElementSegmentedPickerButtonConfiguration
    init(orientation: Orientation, segmentedPickerButtonConfiguration: ToolInterfaceElementSegmentedPickerButtonConfiguration) {
        self.orientation = orientation
        self.segmentedPickerButtonConfiguration = segmentedPickerButtonConfiguration
    }
    
    func getTextIcon(layoutSchemeFlavor: LayoutSchemeFlavor) -> TextIcon {
        return ToolInterfaceImageLibrary.getTextIcon(numberOfLines: segmentedPickerButtonConfiguration.nameLabelNumberOfLines,
                                                     textIconImagePack: segmentedPickerButtonConfiguration.textIconImagePack,
                                                     orientation: orientation,
                                                     layoutSchemeFlavor: layoutSchemeFlavor)
    }
}

class MagicalSegmentedPickerButtonLayoutNode {
    
    deinit {
        print("MagicalSegmentedPickerButtonLayoutNode - Dealloc")
    }
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var iconPaddingLeft = 0
    var iconPaddingRight = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    var x = 0
    var y = 0
    var width = 128
    
    let segmentedPickerButtonConfiguration: ToolInterfaceElementSegmentedPickerButtonConfiguration
    init(segmentedPickerButtonConfiguration: ToolInterfaceElementSegmentedPickerButtonConfiguration) {
        self.segmentedPickerButtonConfiguration = segmentedPickerButtonConfiguration
    }
    
    var nameLabelWidth = 0
    var iconWidth = 0
    var isStacked = false
    func prepareForLayout(layoutSchemeFlavor: LayoutSchemeFlavor, textIcon: TextIcon) {
        isStacked = layoutSchemeFlavor.isStacked
        iconWidth = textIcon.iconWidth
        switch layoutSchemeFlavor {
        case .long:
            nameLabelWidth = segmentedPickerButtonConfiguration.nameLabelWidthLong
        case .stackedLarge:
            nameLabelWidth = segmentedPickerButtonConfiguration.nameLabelWidthStackedLarge
        case .stackedMedium:
            nameLabelWidth = segmentedPickerButtonConfiguration.nameLabelWidthStackedMedium
        case .stackedSmall:
            nameLabelWidth = segmentedPickerButtonConfiguration.nameLabelWidthStackedSmall
        }
    }
    
    func getWidth(layoutSchemeFlavor: LayoutSchemeFlavor) -> Int {
        let width1 = nameLabelWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        let width2 = iconWidth + iconPaddingLeft + iconPaddingRight
        if isStacked {
            return max(width1, width2)
        } else {
            return width1 + width2
        }
    }
}
