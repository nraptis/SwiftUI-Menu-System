//
//  ToolInterfaceViewModel+PadCollapseMenu.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getPadCollapseMenuTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextPadCollapseMenuLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextPadCollapseMenuLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelPadCollapseMenu = MagicalTextIconButtonViewModelPadCollapseMenu(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let padCollapseMenuToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonPadCollapseMenu, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelPadCollapseMenu, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelPadCollapseMenu.refresh()
        return padCollapseMenuToolNode
    }
}
