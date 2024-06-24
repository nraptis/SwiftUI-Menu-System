//
//  ToolInterfaceViewModel+FreezeOnAllWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getFreezeOnAllWeightRingTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOnAllWeightRingLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOnAllWeightRingLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFreezeOnAllWeightRing = MagicalTextIconButtonViewModelFreezeOnAllWeightRing(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let freezeOnAllWeightRingToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonFreezeOnAllWeightRing, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelFreezeOnAllWeightRing, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelFreezeOnAllWeightRing.refresh()
        return freezeOnAllWeightRingToolNode
    }
}
