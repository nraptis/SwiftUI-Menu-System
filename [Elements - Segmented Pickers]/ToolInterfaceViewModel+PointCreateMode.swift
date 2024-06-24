//
//  ToolInterfaceViewModel+PointCreateMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getPointCreateModeSegmentToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        var buttonConfigurations = [ToolInterfaceElementSegmentedPickerButtonConfiguration]()
        
        
        let nearestTextIconPackable = CheckBoxIconLibrary.removePoints
        let nearestLine1 = ToolInterfaceStringLibrarySegments.segmentTextPointCreateModeNearestLine1()
        let nearestLine2 = ToolInterfaceStringLibrarySegments.segmentTextPointCreateModeNearestLine2()
        let nearestConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 0,
                                                                                          iconPack: nearestTextIconPackable,
                                                                                          orientation: orientation,
                                                                                          nameLabelLine1: nearestLine1,
                                                                                          nameLabelLine2: nearestLine2)
        buttonConfigurations.append(nearestConfiguration)
        
        let afterTextIconPackable = CheckBoxIconLibrary.removePoints
        let afterLine1 = ToolInterfaceStringLibrarySegments.segmentTextPointCreateModeAfterLine1()
        let afterLine2 = ToolInterfaceStringLibrarySegments.segmentTextPointCreateModeAfterLine2()
        let afterConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 1,
                                                                                        iconPack: afterTextIconPackable,
                                                                                        orientation: orientation,
                                                                                        nameLabelLine1: afterLine1,
                                                                                        nameLabelLine2: afterLine2)
        buttonConfigurations.append(afterConfiguration)
        
        let beforeTextIconPackable = CheckBoxIconLibrary.removePoints
        let beforeLine1 = ToolInterfaceStringLibrarySegments.segmentTextPointCreateModeBeforeLine1()
        let beforeLine2 = ToolInterfaceStringLibrarySegments.segmentTextPointCreateModeBeforeLine2()
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
        let viewModelPointCreateMode = MagicalSegmentedPickerViewModelPointCreateMode(jiggleViewModel: jiggleViewModel,
                                                                                      toolInterfaceViewModel: self,
                                                                                      segmentedPickerConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .segmentPointCreateMode,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelPointCreateMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelPointCreateMode.refresh()
        return result
    }
}
