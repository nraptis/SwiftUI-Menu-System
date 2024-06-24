//
//  ToolInterfaceViewModel+PadExpandMenu.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getPadExpandMenuTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextPadExpandMenuLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextPadExpandMenuLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelPadExpandMenu = MagicalTextIconButtonViewModelPadExpandMenu(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let padExpandMenuToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonPadExpandMenu, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelPadExpandMenu, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelPadExpandMenu.refresh()
        return padExpandMenuToolNode
    }
}
