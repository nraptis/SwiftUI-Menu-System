//
//  ToolInterfaceViewModel+FlipVerticalJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getFlipVerticalJiggleTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFlipVerticalJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFlipVerticalJiggleLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFlipVerticalJiggle = MagicalTextIconButtonViewModelFlipVerticalJiggle(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let flipVerticalJiggleToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonFlipVerticalJiggle, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelFlipVerticalJiggle, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelFlipVerticalJiggle.refresh()
        return flipVerticalJiggleToolNode
    }
}
