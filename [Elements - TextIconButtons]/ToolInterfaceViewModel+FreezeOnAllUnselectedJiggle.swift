//
//  ToolInterfaceViewModel+FreezeOnAllUnselectedJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/21/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getFreezeOnAllUnselectedJiggleTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOnAllUnselectedJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOnAllUnselectedJiggleLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFreezeOnAllUnselectedJiggle = MagicalTextIconButtonViewModelFreezeOnAllUnselectedJiggle(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let test1ToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonFreezeOnAllUnselectedJiggle, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelFreezeOnAllUnselectedJiggle, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelFreezeOnAllUnselectedJiggle.refresh()
        return test1ToolNode
    }
}
