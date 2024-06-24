//
//  ORIGINA.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getAlternateMotionEnabledCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAlternateMotionEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAlternateMotionEnabledLine2()
        let iconPack = CheckBoxIconLibrary.removePoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelAlternateMotionEnabled = MagicalCheckBoxViewModelAlternateMotionEnabled(jiggleViewModel: jiggleViewModel,
                                                                                             toolInterfaceViewModel: self,
                                                                                             checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxAlternateMotionEnabled,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelAlternateMotionEnabled,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelAlternateMotionEnabled.refresh()
        
        return result
    }
}
