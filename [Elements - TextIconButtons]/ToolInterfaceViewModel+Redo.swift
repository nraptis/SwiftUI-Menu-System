//
//  ToolInterfaceViewModel+Redo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRedoButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getRedoButtonConfiguration()
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelCreateJiggle = MagicalTextIconButtonViewModelRedo(jiggleViewModel: jiggleViewModel,
                                                                           toolInterfaceViewModel: self,
                                                                           textIconButtonConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .buttonRedo,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelCreateJiggle,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelCreateJiggle.refresh()
        return result
    }
    
    func getRedoButtonConfiguration() -> ToolInterfaceElementTextIconButtonConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextRedoLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextRedoLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        return ToolInterfaceElementTextIconButtonConfiguration(textIconImagePack: textIconImagePack,
                                                               orientation: orientation,
                                                               nameLabelLine1: textLine1,
                                                               nameLabelLine2: textLine2)
    }
}
