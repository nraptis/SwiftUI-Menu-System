//
//  ToolInterfaceViewModel+RemoveJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRemoveJiggleTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRemoveJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRemoveJiggleLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRemoveJiggle = MagicalTextIconButtonViewModelRemoveJiggle(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let removeJiggleToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonRemoveJiggle, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelRemoveJiggle, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelRemoveJiggle.refresh()
        return removeJiggleToolNode
    }
}
