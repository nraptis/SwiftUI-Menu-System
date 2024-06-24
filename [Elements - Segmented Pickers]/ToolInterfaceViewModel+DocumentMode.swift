//
//  ToolInterfaceViewModel+DocumentMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getDocumentModeSegmentToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        var buttonConfigurations = [ToolInterfaceElementSegmentedPickerButtonConfiguration]()
        
        
        let viewTextIconPackable = CheckBoxIconLibrary.removePoints
        let viewLine1 = ToolInterfaceStringLibrarySegments.segmentTextDocumentModeViewLine1()
        let viewLine2 = ToolInterfaceStringLibrarySegments.segmentTextDocumentModeViewLine2()
        let viewConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 0,
                                                                                       iconPack: viewTextIconPackable,
                                                                                       orientation: orientation,
                                                                                       nameLabelLine1: viewLine1,
                                                                                       nameLabelLine2: viewLine2)
        buttonConfigurations.append(viewConfiguration)
        
        let jigglesTextIconPackable = CheckBoxIconLibrary.removePoints
        let jigglesLine1 = ToolInterfaceStringLibrarySegments.segmentTextDocumentModeJigglesLine1()
        let jigglesLine2 = ToolInterfaceStringLibrarySegments.segmentTextDocumentModeJigglesLine2()
        let jigglesConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 1,
                                                                                          iconPack: jigglesTextIconPackable,
                                                                                          orientation: orientation,
                                                                                          nameLabelLine1: jigglesLine1,
                                                                                          nameLabelLine2: jigglesLine2)
        buttonConfigurations.append(jigglesConfiguration)
        
        let pointsTextIconPackable = CheckBoxIconLibrary.removePoints
        let pointsLine1 = ToolInterfaceStringLibrarySegments.segmentTextDocumentModePointsLine1()
        let pointsLine2 = ToolInterfaceStringLibrarySegments.segmentTextDocumentModePointsLine2()
        let pointsConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 2,
                                                                                         iconPack: pointsTextIconPackable,
                                                                                         orientation: orientation,
                                                                                         nameLabelLine1: pointsLine1,
                                                                                         nameLabelLine2: pointsLine2)
        buttonConfigurations.append(pointsConfiguration)
        
        let weightsTextIconPackable = CheckBoxIconLibrary.removePoints
        let weightsLine1 = ToolInterfaceStringLibrarySegments.segmentTextDocumentModeWeightsLine1()
        let weightsLine2 = ToolInterfaceStringLibrarySegments.segmentTextDocumentModeWeightsLine2()
        let weightsConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 3,
                                                                                          iconPack: weightsTextIconPackable,
                                                                                          orientation: orientation,
                                                                                          nameLabelLine1: weightsLine1,
                                                                                          nameLabelLine2: weightsLine2)
        buttonConfigurations.append(weightsConfiguration)
        
        let configuration = ToolInterfaceElementSegmentedPickerConfiguration(buttonConfigurations: buttonConfigurations)
        
        
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
}
