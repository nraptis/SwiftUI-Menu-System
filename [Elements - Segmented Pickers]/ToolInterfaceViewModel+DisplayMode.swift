//
//  ToolInterfaceViewModel+DisplayMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getDisplayModeSegmentToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        var buttonConfigurations = [ToolInterfaceElementSegmentedPickerButtonConfiguration]()
        
        
        let regularTextIconPackable = CheckBoxIconLibrary.removePoints
        let regularLine1 = ToolInterfaceStringLibrarySegments.segmentTextDisplayModeRegularLine1()
        let regularLine2 = ToolInterfaceStringLibrarySegments.segmentTextDisplayModeRegularLine2()
        let regularConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 0,
                                                                                          iconPack: regularTextIconPackable,
                                                                                          orientation: orientation,
                                                                                          nameLabelLine1: regularLine1,
                                                                                          nameLabelLine2: regularLine2)
        buttonConfigurations.append(regularConfiguration)
        
        let swivelTextIconPackable = CheckBoxIconLibrary.removePoints
        let swivelLine1 = ToolInterfaceStringLibrarySegments.segmentTextDisplayModeSwivelLine1()
        let swivelLine2 = ToolInterfaceStringLibrarySegments.segmentTextDisplayModeSwivelLine2()
        let swivelConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 1,
                                                                                         iconPack: swivelTextIconPackable,
                                                                                         orientation: orientation,
                                                                                         nameLabelLine1: swivelLine1,
                                                                                         nameLabelLine2: swivelLine2)
        buttonConfigurations.append(swivelConfiguration)
        
        let splitTextIconPackable = CheckBoxIconLibrary.removePoints
        let splitLine1 = ToolInterfaceStringLibrarySegments.segmentTextDisplayModeSplitLine1()
        let splitLine2 = ToolInterfaceStringLibrarySegments.segmentTextDisplayModeSplitLine2()
        let splitConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 2,
                                                                                        iconPack: splitTextIconPackable,
                                                                                        orientation: orientation,
                                                                                        nameLabelLine1: splitLine1,
                                                                                        nameLabelLine2: splitLine2)
        buttonConfigurations.append(splitConfiguration)
        
        let configuration = ToolInterfaceElementSegmentedPickerConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getSegmentFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModelDisplayMode = MagicalSegmentedPickerViewModelDisplayMode(jiggleViewModel: jiggleViewModel,
                                                                              toolInterfaceViewModel: self,
                                                                              segmentedPickerConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .segmentDisplayMode,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelDisplayMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelDisplayMode.refresh()
        return result
    }
}
