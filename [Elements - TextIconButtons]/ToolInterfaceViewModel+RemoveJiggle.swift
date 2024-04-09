//
//  ToolInterfaceViewModel+RemoveJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/8/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRemoveJiggleButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getRemoveJiggleButtonConfiguration()
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelCreateJiggle = MagicalTextIconButtonViewModelRemoveJiggle(jiggleViewModel: jiggleViewModel,
                                                                           toolInterfaceViewModel: self,
                                                                           textIconButtonConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .buttonRemoveJiggle,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelCreateJiggle,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelCreateJiggle.refresh()
        return result
    }
    
    func getRemoveJiggleButtonConfiguration() -> ToolInterfaceElementTextIconButtonConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextRemoveJiggleLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextRemoveJiggleLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        return ToolInterfaceElementTextIconButtonConfiguration(textIconImagePack: textIconImagePack,
                                                               orientation: orientation,
                                                               nameLabelLine1: textLine1,
                                                               nameLabelLine2: textLine2)
    }
}
