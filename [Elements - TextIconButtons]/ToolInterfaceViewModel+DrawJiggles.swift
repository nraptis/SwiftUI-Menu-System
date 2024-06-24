//
//  ToolInterfaceViewModel+DrawJiggles.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getDrawJigglesTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextDrawJigglesLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextDrawJigglesLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelDrawJiggles = MagicalTextIconButtonViewModelDrawJiggles(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let drawJigglesToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonDrawJiggles, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelDrawJiggles, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelDrawJiggles.refresh()
        return drawJigglesToolNode
    }
}
