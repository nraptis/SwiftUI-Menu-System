//
//  ToolInterfaceViewModel+ResetWeightGraph.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getResetWeightGraphTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraph = MagicalTextIconButtonViewModelResetWeightGraph(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let resetWeightGraphToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonResetWeightGraph, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelResetWeightGraph, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraph.refresh()
        return resetWeightGraphToolNode
    }
}
