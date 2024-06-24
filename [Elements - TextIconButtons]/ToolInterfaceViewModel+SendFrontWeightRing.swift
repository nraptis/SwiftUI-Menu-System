//
//  ToolInterfaceViewModel+SendFrontWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getSendFrontWeightRingTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSendFrontWeightRingLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSendFrontWeightRingLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSendFrontWeightRing = MagicalTextIconButtonViewModelSendFrontWeightRing(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let sendFrontWeightRingToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonSendFrontWeightRing, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelSendFrontWeightRing, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelSendFrontWeightRing.refresh()
        return sendFrontWeightRingToolNode
    }
}
