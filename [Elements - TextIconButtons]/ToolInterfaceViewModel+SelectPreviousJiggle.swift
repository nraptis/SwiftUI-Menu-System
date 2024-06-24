//
//  ToolInterfaceViewModel+SelectPreviousJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation


extension ToolInterfaceViewModel {
    
    func getSelectPreviousJiggleTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousJiggleLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectPreviousJiggle = MagicalTextIconButtonViewModelSelectPreviousJiggle(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let selectPreviousJiggleToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonSelectPreviousJiggle, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelSelectPreviousJiggle, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelSelectPreviousJiggle.refresh()
        return selectPreviousJiggleToolNode
    }
}
