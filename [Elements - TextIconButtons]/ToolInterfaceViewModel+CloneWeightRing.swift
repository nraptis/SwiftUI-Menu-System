//
//  ToolInterfaceViewModel+CloneWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getCloneWeightRingTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextCloneWeightRingLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextCloneWeightRingLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelCloneWeightRing = MagicalTextIconButtonViewModelCloneWeightRing(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let cloneWeightRingToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonCloneWeightRing, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelCloneWeightRing, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelCloneWeightRing.refresh()
        return cloneWeightRingToolNode
    }
}
