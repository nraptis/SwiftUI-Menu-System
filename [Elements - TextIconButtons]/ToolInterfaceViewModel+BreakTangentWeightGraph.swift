//
//  ToolInterfaceViewModel+BreakManualWeightGraph.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getBreakManualWeightGraphTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextBreakManualWeightGraphLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextBreakManualWeightGraphLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelBreakManualWeightGraph = MagicalTextIconButtonViewModelBreakManualWeightGraph(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let breakManualWeightGraphToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonBreakManualWeightGraph, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelBreakManualWeightGraph, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelBreakManualWeightGraph.refresh()
        return breakManualWeightGraphToolNode
    }
}
