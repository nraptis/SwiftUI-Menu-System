//
//  ToolInterfaceViewModel+GenerateTopography.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getGenerateTopographyTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextGenerateTopographyLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextGenerateTopographyLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelGenerateTopography = MagicalTextIconButtonViewModelGenerateTopography(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let test1ToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonGenerateTopography, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelGenerateTopography, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelGenerateTopography.refresh()
        return test1ToolNode
    }
}
