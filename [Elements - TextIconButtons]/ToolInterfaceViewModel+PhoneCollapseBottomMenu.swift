//
//  ToolInterfaceViewModel+PhoneCollapseBottomMenu.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getPhoneCollapseBottomMenuTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextPhoneCollapseBottomMenuLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextPhoneCollapseBottomMenuLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelPhoneCollapseBottomMenu = MagicalTextIconButtonViewModelPhoneCollapseBottomMenu(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let phoneCollapseBottomMenuToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonPhoneCollapseBottomMenu, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelPhoneCollapseBottomMenu, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelPhoneCollapseBottomMenu.refresh()
        return phoneCollapseBottomMenuToolNode
    }
}
