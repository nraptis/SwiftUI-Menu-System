//
//  ToolInterfaceViewModel+AudioEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getAudioEnabledCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getSAudioEnabledCheckBoxConfiguration()
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelAudioEnabled = MagicalCheckBoxViewModelAudioEnabled(jiggleViewModel: jiggleViewModel,
                                                                       toolInterfaceViewModel: self,
                                                                       checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxAudioEnabled,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelAudioEnabled,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelAudioEnabled.refresh()
        
        return result
    }
    
    func getSAudioEnabledCheckBoxConfiguration() -> ToolInterfaceElementCheckBoxConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextAudioEnabledLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextAudioEnabledLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        return ToolInterfaceElementCheckBoxConfiguration(textIconImagePack: textIconImagePack,
                                                         orientation: orientation,
                                                         nameLabelLine1: textLine1,
                                                         nameLabelLine2: textLine2)
    }
    
}
