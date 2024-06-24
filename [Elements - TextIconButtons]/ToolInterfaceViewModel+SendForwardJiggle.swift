//
//  ToolInterfaceViewModel+SendForwardJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getSendForwardJiggleTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSendForwardJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSendForwardJiggleLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSendForwardJiggle = MagicalTextIconButtonViewModelSendForwardJiggle(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let sendForwardJiggleToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonSendForwardJiggle, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelSendForwardJiggle, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelSendForwardJiggle.refresh()
        return sendForwardJiggleToolNode
    }
}
