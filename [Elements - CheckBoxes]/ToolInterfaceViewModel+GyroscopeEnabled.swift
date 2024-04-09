//
//  ToolInterfaceViewModel+GyroscopeEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getGyroscopeEnabledCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getSGyroscopeEnabledCheckBoxConfiguration()
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelGyroscopeEnabled = MagicalCheckBoxViewModelGyroscopeEnabled(jiggleViewModel: jiggleViewModel,
                                                                       toolInterfaceViewModel: self,
                                                                       checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxGyroscopeEnabled,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelGyroscopeEnabled,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelGyroscopeEnabled.refresh()
        
        return result
    }
    
    func getSGyroscopeEnabledCheckBoxConfiguration() -> ToolInterfaceElementCheckBoxConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextGyroscopeEnabledLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextGyroscopeEnabledLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        return ToolInterfaceElementCheckBoxConfiguration(textIconImagePack: textIconImagePack,
                                                         orientation: orientation,
                                                         nameLabelLine1: textLine1,
                                                         nameLabelLine2: textLine2)
    }
}
