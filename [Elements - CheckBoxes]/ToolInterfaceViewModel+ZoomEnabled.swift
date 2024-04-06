//
//  ToolInterfaceViewModel+ZoomEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getZoomEnabledCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getSZoomEnabledCheckBoxConfiguration()
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelZoomEnabled = MagicalCheckBoxViewModelZoomEnabled(jiggleViewModel: jiggleViewModel,
                                                                       toolInterfaceViewModel: self,
                                                                       checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxStereoscopic3DEnabled,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelZoomEnabled,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelZoomEnabled.refresh()
        
        return result
    }
    
    func getSZoomEnabledCheckBoxConfiguration() -> ToolInterfaceElementCheckBoxConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextZoomEnabledLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextZoomEnabledLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        return ToolInterfaceElementCheckBoxConfiguration(textIconImagePack: textIconImagePack,
                                                         orientation: orientation,
                                                         nameLabelLine1: textLine1,
                                                         nameLabelLine2: textLine2)
    }
    
}
