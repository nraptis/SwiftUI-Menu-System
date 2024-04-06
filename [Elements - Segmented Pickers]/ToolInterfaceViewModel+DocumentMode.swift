//
//  ToolInterfaceViewModel+DocumentMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/22/24.
//

import Foundation

extension ToolInterfaceViewModel {

    
    func getDocumentModeSegmentToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getDocumentModeSegmentConfiguration()
        let flex = Self.getSegmentFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModelDocumentMode = MagicalSegmentedPickerViewModelDocumentMode(jiggleViewModel: jiggleViewModel,
                                                                                toolInterfaceViewModel: self,
                                                                                segmentedPickerConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .segmentDocumentMode,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelDocumentMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelDocumentMode.refresh()
        return result
    }
    
    func getDocumentModeSegmentConfiguration() -> ToolInterfaceElementSegmentedPickerConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        
        let viewModeTextIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        let viewModeLine1 = ToolInterfaceStringLibrary.interfaceTextDocumentModeViewLine1()
        let viewModeLine2 = ToolInterfaceStringLibrary.interfaceTextDocumentModeViewLine2()
        
        let viewModeConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 0,
                                                                                           textIconImagePack: viewModeTextIconImagePack,
                                                                                           orientation: orientation,
                                                                                           nameLabelLine1: viewModeLine1,
                                                                                           nameLabelLine2: viewModeLine2)
        
        let editModeTextIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        let editModeLine1 = ToolInterfaceStringLibrary.interfaceTextDocumentModeEditLine1()
        let editModeLine2 = ToolInterfaceStringLibrary.interfaceTextDocumentModeEditLine2()
        
        let editModeConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 1,
                                                                                           textIconImagePack: editModeTextIconImagePack,
                                                                                           orientation: orientation,
                                                                                           nameLabelLine1: editModeLine1,
                                                                                           nameLabelLine2: editModeLine2)
        
        return ToolInterfaceElementSegmentedPickerConfiguration(buttonConfigurations: [viewModeConfiguration,
                                                                                       editModeConfiguration])
        
    }
    
}
