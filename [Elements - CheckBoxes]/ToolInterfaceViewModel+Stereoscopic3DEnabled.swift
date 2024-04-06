//
//  ToolInterfaceViewModel+Stereoscopic3DEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getStereoscopic3DEnabledCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getStereoscopic3DEnabledCheckBoxConfiguration()
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelStereoscopic = MagicalCheckBoxViewModelStereoscopic(jiggleViewModel: jiggleViewModel,
                                                                         toolInterfaceViewModel: self,
                                                                         checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxStereoscopic3DEnabled,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelStereoscopic,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelStereoscopic.refresh()
        
        return result
    }
    
    func getStereoscopic3DEnabledCheckBoxConfiguration() -> ToolInterfaceElementCheckBoxConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextStereoscopic3DEnabledLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextStereoscopic3DEnabledLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        return ToolInterfaceElementCheckBoxConfiguration(textIconImagePack: textIconImagePack,
                                                         orientation: orientation,
                                                         nameLabelLine1: textLine1,
                                                         nameLabelLine2: textLine2)
    }
    
}
