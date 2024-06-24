//
//  ToolInterfaceViewModel+SelectNextWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getSelectNextWeightRingTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextWeightRingLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextWeightRingLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectNextWeightRing = MagicalTextIconButtonViewModelSelectNextWeightRing(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let selectNextWeightRingToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonSelectNextWeightRing, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelSelectNextWeightRing, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelSelectNextWeightRing.refresh()
        return selectNextWeightRingToolNode
    }
}
