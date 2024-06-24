//
//  ToolInterfaceViewModel+FreezeOnSelectedWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getFreezeOnSelectedWeightRingTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOnSelectedWeightRingLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOnSelectedWeightRingLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFreezeOnSelectedWeightRing = MagicalTextIconButtonViewModelFreezeOnSelectedWeightRing(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let freezeOnSelectedWeightRingToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonFreezeOnSelectedWeightRing, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelFreezeOnSelectedWeightRing, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelFreezeOnSelectedWeightRing.refresh()
        return freezeOnSelectedWeightRingToolNode
    }
}
