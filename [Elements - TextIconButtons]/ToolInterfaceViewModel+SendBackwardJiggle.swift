//
//  ToolInterfaceViewModel+SendBackwardJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getSendBackwardJiggleTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSendBackwardJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSendBackwardJiggleLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSendBackwardJiggle = MagicalTextIconButtonViewModelSendBackwardJiggle(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let sendBackwardJiggleToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonSendBackwardJiggle, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelSendBackwardJiggle, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelSendBackwardJiggle.refresh()
        return sendBackwardJiggleToolNode
    }
}
