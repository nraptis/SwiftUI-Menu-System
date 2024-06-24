//
//  ToolInterfaceViewModel+FlipHorizontalWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getFlipHorizontalWeightRingTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFlipHorizontalWeightRingLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFlipHorizontalWeightRingLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFlipHorizontalWeightRing = MagicalTextIconButtonViewModelFlipHorizontalWeightRing(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let flipHorizontalWeightRingToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonFlipHorizontalWeightRing, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelFlipHorizontalWeightRing, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelFlipHorizontalWeightRing.refresh()
        return flipHorizontalWeightRingToolNode
    }
}
