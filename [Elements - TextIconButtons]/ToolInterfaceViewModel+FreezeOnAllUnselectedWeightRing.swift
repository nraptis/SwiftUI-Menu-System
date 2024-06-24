//
//  ToolInterfaceViewModel+FreezeOnAllUnselectedWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/21/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getFreezeOnAllUnselectedWeightRingTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOnAllUnselectedWeightRingLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOnAllUnselectedWeightRingLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFreezeOnAllUnselectedWeightRing = MagicalTextIconButtonViewModelFreezeOnAllUnselectedWeightRing(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let test1ToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonFreezeOnAllUnselectedWeightRing, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelFreezeOnAllUnselectedWeightRing, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelFreezeOnAllUnselectedWeightRing.refresh()
        return test1ToolNode
    }
}
