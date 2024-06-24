//
//  ToolInterfaceViewModel+FlipHorizontalJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getFlipHorizontalJiggleTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFlipHorizontalJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFlipHorizontalJiggleLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFlipHorizontalJiggle = MagicalTextIconButtonViewModelFlipHorizontalJiggle(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let flipHorizontalJiggleToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonFlipHorizontalJiggle, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelFlipHorizontalJiggle, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelFlipHorizontalJiggle.refresh()
        return flipHorizontalJiggleToolNode
    }
}
