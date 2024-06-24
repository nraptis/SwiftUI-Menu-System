//
//  ToolInterfaceViewModel+RandomizeWeightGraph.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRandomizeWeightGraphTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRandomizeWeightGraphLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRandomizeWeightGraphLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRandomizeWeightGraph = MagicalTextIconButtonViewModelRandomizeWeightGraph(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let randomizeWeightGraphToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonRandomizeWeightGraph, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelRandomizeWeightGraph, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelRandomizeWeightGraph.refresh()
        return randomizeWeightGraphToolNode
    }
}
