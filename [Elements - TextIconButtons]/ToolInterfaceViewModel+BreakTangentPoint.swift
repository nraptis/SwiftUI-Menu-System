//
//  ToolInterfaceViewModel+GenerateWeightRings.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getGenerateWeightRingsTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextGenerateWeightRingsLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextGenerateWeightRingsLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelGenerateWeightRings = MagicalTextIconButtonViewModelGenerateWeightRings(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let generateWeightRingsToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonGenerateWeightRings, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelGenerateWeightRings, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelGenerateWeightRings.refresh()
        return generateWeightRingsToolNode
    }
}
