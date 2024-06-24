//
//  ToolInterfaceViewModel+ResetZoomSelectedJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetZoomSelectedJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetZoomSelectedJiggleLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetZoomSelectedJiggle = MagicalTextIconButtonViewModelResetZoomSelectedJiggle(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let resetZoomSelectedJiggleToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonResetZoomSelectedJiggle, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelResetZoomSelectedJiggle, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelResetZoomSelectedJiggle.refresh()
        return resetZoomSelectedJiggleToolNode
    }
}
