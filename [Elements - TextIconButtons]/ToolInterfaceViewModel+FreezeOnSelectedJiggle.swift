//
//  ToolInterfaceViewModel+FreezeOnSelectedJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getFreezeOnSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOnSelectedJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOnSelectedJiggleLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFreezeOnSelectedJiggle = MagicalTextIconButtonViewModelFreezeOnSelectedJiggle(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let freezeOnSelectedJiggleToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonFreezeOnSelectedJiggle, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelFreezeOnSelectedJiggle, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelFreezeOnSelectedJiggle.refresh()
        return freezeOnSelectedJiggleToolNode
    }
}
