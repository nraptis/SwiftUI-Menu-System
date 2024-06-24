//
//  ToolInterfaceViewModel+WeightPointCreateMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getWeightPointCreateModeSegmentToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        var buttonConfigurations = [ToolInterfaceElementSegmentedPickerButtonConfiguration]()
        
        let nearestTextIconPackable = CheckBoxIconLibrary.removePoints
        let nearestLine1 = ToolInterfaceStringLibrarySegments.segmentTextWeightPointCreateModeNearestLine1()
        let nearestLine2 = ToolInterfaceStringLibrarySegments.segmentTextWeightPointCreateModeNearestLine2()
        let nearestConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 0,
                                                                                          iconPack: nearestTextIconPackable,
                                                                                          orientation: orientation,
                                                                                          nameLabelLine1: nearestLine1,
                                                                                          nameLabelLine2: nearestLine2)
        buttonConfigurations.append(nearestConfiguration)
        
        let afterTextIconPackable = CheckBoxIconLibrary.removePoints
        let afterLine1 = ToolInterfaceStringLibrarySegments.segmentTextWeightPointCreateModeAfterLine1()
        let afterLine2 = ToolInterfaceStringLibrarySegments.segmentTextWeightPointCreateModeAfterLine2()
        let afterConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 1,
                                                                                        iconPack: afterTextIconPackable,
                                                                                        orientation: orientation,
                                                                                        nameLabelLine1: afterLine1,
                                                                                        nameLabelLine2: afterLine2)
        buttonConfigurations.append(afterConfiguration)
        
        let beforeTextIconPackable = CheckBoxIconLibrary.removePoints
        let beforeLine1 = ToolInterfaceStringLibrarySegments.segmentTextWeightPointCreateModeBeforeLine1()
        let beforeLine2 = ToolInterfaceStringLibrarySegments.segmentTextWeightPointCreateModeBeforeLine2()
        let beforeConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 2,
                                                                                         iconPack: beforeTextIconPackable,
                                                                                         orientation: orientation,
                                                                                         nameLabelLine1: beforeLine1,
                                                                                         nameLabelLine2: beforeLine2)
        buttonConfigurations.append(beforeConfiguration)
        
        let configuration = ToolInterfaceElementSegmentedPickerConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getSegmentFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModelWeightPointCreateMode = MagicalSegmentedPickerViewModelWeightPointCreateMode(jiggleViewModel: jiggleViewModel,
                                                                                                  toolInterfaceViewModel: self,
                                                                                                  segmentedPickerConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .segmentWeightPointCreateMode,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelWeightPointCreateMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelWeightPointCreateMode.refresh()
        return result
    }
}


