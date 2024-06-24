//
//  ToolInterfaceViewModel+FreezeOffAllWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getFreezeOffAllWeightRingTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOffAllWeightRingLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFreezeOffAllWeightRingLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFreezeOffAllWeightRing = MagicalTextIconButtonViewModelFreezeOffAllWeightRing(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let freezeOffAllWeightRingToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonFreezeOffAllWeightRing, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelFreezeOffAllWeightRing, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelFreezeOffAllWeightRing.refresh()
        return freezeOffAllWeightRingToolNode
    }
}
