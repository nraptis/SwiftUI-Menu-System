//
//  ToolInterfaceViewModel+CloneJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/9/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getCloneJiggleButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getCloneJiggleButtonConfiguration()
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelCreateJiggle = MagicalTextIconButtonViewModelCloneJiggle(jiggleViewModel: jiggleViewModel,
                                                                           toolInterfaceViewModel: self,
                                                                           textIconButtonConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .buttonCloneJiggle,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelCreateJiggle,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelCreateJiggle.refresh()
        return result
    }
    
    func getCloneJiggleButtonConfiguration() -> ToolInterfaceElementTextIconButtonConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextCloneJiggleLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextCloneJiggleLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        return ToolInterfaceElementTextIconButtonConfiguration(textIconImagePack: textIconImagePack,
                                                               orientation: orientation,
                                                               nameLabelLine1: textLine1,
                                                               nameLabelLine2: textLine2)
    }
    
}
