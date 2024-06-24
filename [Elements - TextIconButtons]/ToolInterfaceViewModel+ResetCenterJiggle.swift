//
//  ToolInterfaceViewModel+ResetCenterJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getResetCenterJiggleTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetCenterJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetCenterJiggleLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetCenterJiggle = MagicalTextIconButtonViewModelResetCenterJiggle(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let resetCenterJiggleToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonResetCenterJiggle, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelResetCenterJiggle, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelResetCenterJiggle.refresh()
        return resetCenterJiggleToolNode
    }
}
