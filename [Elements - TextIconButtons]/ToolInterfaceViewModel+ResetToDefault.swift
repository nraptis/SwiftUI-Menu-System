//
//  ToolInterfaceViewModel+ResetToDefault.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getResetToDefaultTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetToDefaultLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetToDefaultLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetToDefault = MagicalTextIconButtonViewModelResetToDefault(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let resetToDefaultToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonResetToDefault, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelResetToDefault, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelResetToDefault.refresh()
        return resetToDefaultToolNode
    }
}
