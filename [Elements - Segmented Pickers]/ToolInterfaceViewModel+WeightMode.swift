//
//  ToolInterfaceViewModel+WeightMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getWeightModeSegmentToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        var buttonConfigurations = [ToolInterfaceElementSegmentedPickerButtonConfiguration]()
        
        
        let affineTextIconPackable = CheckBoxIconLibrary.removePoints
        let affineLine1 = ToolInterfaceStringLibrarySegments.segmentTextWeightModeAffineLine1()
        let affineLine2 = ToolInterfaceStringLibrarySegments.segmentTextWeightModeAffineLine2()
        let affineConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 0,
                                                                                         iconPack: affineTextIconPackable,
                                                                                         orientation: orientation,
                                                                                         nameLabelLine1: affineLine1,
                                                                                         nameLabelLine2: affineLine2)
        buttonConfigurations.append(affineConfiguration)
        
        let pointsTextIconPackable = CheckBoxIconLibrary.removePoints
        let pointsLine1 = ToolInterfaceStringLibrarySegments.segmentTextWeightModePointsLine1()
        let pointsLine2 = ToolInterfaceStringLibrarySegments.segmentTextWeightModePointsLine2()
        let pointsConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 1,
                                                                                         iconPack: pointsTextIconPackable,
                                                                                         orientation: orientation,
                                                                                         nameLabelLine1: pointsLine1,
                                                                                         nameLabelLine2: pointsLine2)
        buttonConfigurations.append(pointsConfiguration)
        
        let centersTextIconPackable = CheckBoxIconLibrary.removePoints
        let centersLine1 = ToolInterfaceStringLibrarySegments.segmentTextWeightModeCentersLine1()
        let centersLine2 = ToolInterfaceStringLibrarySegments.segmentTextWeightModeCentersLine2()
        let centersConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 2,
                                                                                          iconPack: centersTextIconPackable,
                                                                                          orientation: orientation,
                                                                                          nameLabelLine1: centersLine1,
                                                                                          nameLabelLine2: centersLine2)
        buttonConfigurations.append(centersConfiguration)
        
        let configuration = ToolInterfaceElementSegmentedPickerConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getSegmentFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModelWeightMode = MagicalSegmentedPickerViewModelWeightMode(jiggleViewModel: jiggleViewModel,
                                                                            toolInterfaceViewModel: self,
                                                                            segmentedPickerConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .segmentWeightMode,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelWeightMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelWeightMode.refresh()
        return result
    }
}
