//
//  ToolInterfaceViewModel+EditMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/22/24.
//

import Foundation

extension ToolInterfaceViewModel {

    func getEditModeSegmentToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getEditModeSegmentConfiguration()
        let flex = Self.getSegmentFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModelDocumentMode = MagicalSegmentedPickerViewModelEditMode(jiggleViewModel: jiggleViewModel,
                                                                            toolInterfaceViewModel: self,
                                                                            segmentedPickerConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .segmentEditMode,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelDocumentMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelDocumentMode.refresh()
        return result
    }
    
    func getEditModeSegmentConfiguration() -> ToolInterfaceElementSegmentedPickerConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        
        let affineModeTextIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        let affineModeLine1 = ToolInterfaceStringLibrary.interfaceTextEditModeAffineLine1()
        let affineModeLine2 = ToolInterfaceStringLibrary.interfaceTextEditModeAffineLine2()
        let affineModeConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 0,
                                                                                             textIconImagePack: affineModeTextIconImagePack,
                                                                                             orientation: orientation,
                                                                                             nameLabelLine1: affineModeLine1,
                                                                                             nameLabelLine2: affineModeLine2)
        
        let dragPointsModeTextIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        let dragPointsModeLine1 = ToolInterfaceStringLibrary.interfaceTextEditModeDragPointsLine1()
        let dragPointsModeLine2 = ToolInterfaceStringLibrary.interfaceTextEditModeDragPointsLine2()
        let dragPointsModeConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 1,
                                                                                                 textIconImagePack: dragPointsModeTextIconImagePack,
                                                                                                 orientation: orientation,
                                                                                                 nameLabelLine1: dragPointsModeLine1,
                                                                                                 nameLabelLine2: dragPointsModeLine2)
        
        let dragTangentsModeTextIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        let dragTangentsModeLine1 = ToolInterfaceStringLibrary.interfaceTextEditModeDragTangentsLine1()
        let dragTangentsModeLine2 = ToolInterfaceStringLibrary.interfaceTextEditModeDragTangentsLine2()
        let dragTangentsModeConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 2,
                                                                                                   textIconImagePack: dragTangentsModeTextIconImagePack,
                                                                                                   orientation: orientation,
                                                                                                   nameLabelLine1: dragTangentsModeLine1,
                                                                                                   nameLabelLine2: dragTangentsModeLine2)
        
        let weightModeTextIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        let weightModeLine1 = ToolInterfaceStringLibrary.interfaceTextEditModeWeightLine1()
        let weightModeLine2 = ToolInterfaceStringLibrary.interfaceTextEditModeWeightLine2()
        let weightModeConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 3,
                                                                                             textIconImagePack: weightModeTextIconImagePack,
                                                                                             orientation: orientation,
                                                                                             nameLabelLine1: weightModeLine1,
                                                                                             nameLabelLine2: weightModeLine2)
        
        return ToolInterfaceElementSegmentedPickerConfiguration(buttonConfigurations: [affineModeConfiguration,
                                                                                       dragPointsModeConfiguration,
                                                                                       dragTangentsModeConfiguration,
                                                                                       weightModeConfiguration])
    }
}
