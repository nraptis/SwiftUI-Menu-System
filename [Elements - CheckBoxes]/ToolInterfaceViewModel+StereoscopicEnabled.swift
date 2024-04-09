//
//  ToolInterfaceViewModel+StereoscopicEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getStereoscopicEnabledCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getStereoscopicEnabledCheckBoxConfiguration()
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelStereoscopic = MagicalCheckBoxViewModelStereoscopicEnabled(jiggleViewModel: jiggleViewModel,
                                                                         toolInterfaceViewModel: self,
                                                                         checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxStereoscopicEnabled,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelStereoscopic,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelStereoscopic.refresh()
        
        return result
    }
    
    func getStereoscopicEnabledCheckBoxConfiguration() -> ToolInterfaceElementCheckBoxConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextStereoscopicEnabledLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextStereoscopicEnabledLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        return ToolInterfaceElementCheckBoxConfiguration(textIconImagePack: textIconImagePack,
                                                         orientation: orientation,
                                                         nameLabelLine1: textLine1,
                                                         nameLabelLine2: textLine2)
    }
    
}
