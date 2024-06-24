//
//  ToolInterfaceViewModel+PhoneExpandBottomMenu.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getPhoneExpandBottomMenuTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextPhoneExpandBottomMenuLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextPhoneExpandBottomMenuLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelPhoneExpandBottomMenu = MagicalTextIconButtonViewModelPhoneExpandBottomMenu(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let phoneExpandBottomMenuToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonPhoneExpandBottomMenu, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelPhoneExpandBottomMenu, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelPhoneExpandBottomMenu.refresh()
        return phoneExpandBottomMenuToolNode
    }
}
