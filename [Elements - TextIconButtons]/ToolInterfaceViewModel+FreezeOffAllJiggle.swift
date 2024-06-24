//
//  ToolInterfaceViewModel+FreezeOffAllJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getFreezeOffAllJiggleTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOffAllJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOffAllJiggleLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFreezeOffAllJiggle = MagicalTextIconButtonViewModelFreezeOffAllJiggle(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let freezeOffAllJiggleToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonFreezeOffAllJiggle, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelFreezeOffAllJiggle, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelFreezeOffAllJiggle.refresh()
        return freezeOffAllJiggleToolNode
    }
}
