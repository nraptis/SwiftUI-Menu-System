//
//  ToolInterfaceViewModel+PhoneCollapseTopMenu.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getPhoneCollapseTopMenuTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextPhoneCollapseTopMenuLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextPhoneCollapseTopMenuLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelPhoneCollapseTopMenu = MagicalTextIconButtonViewModelPhoneCollapseTopMenu(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let phoneCollapseTopMenuToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonPhoneCollapseTopMenu, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelPhoneCollapseTopMenu, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelPhoneCollapseTopMenu.refresh()
        return phoneCollapseTopMenuToolNode
    }
}
