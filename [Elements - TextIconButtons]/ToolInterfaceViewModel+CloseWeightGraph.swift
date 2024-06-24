//
//  ToolInterfaceViewModel+CloseWeightGraph.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getCloseWeightGraphTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextCloseWeightGraphLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextCloseWeightGraphLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelCloseWeightGraph = MagicalTextIconButtonViewModelCloseWeightGraph(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let closeWeightGraphToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonCloseWeightGraph, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelCloseWeightGraph, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelCloseWeightGraph.refresh()
        return closeWeightGraphToolNode
    }
}
