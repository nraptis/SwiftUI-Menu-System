//
//  ORIGINA.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRemoveWeightRingPointsCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextRemoveWeightRingPointsLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextRemoveWeightRingPointsLine2()
        let iconPack = CheckBoxIconLibrary.removePoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelRemoveWeightRingPoints = MagicalCheckBoxViewModelRemoveWeightRingPoints(jiggleViewModel: jiggleViewModel,
                                                                                             toolInterfaceViewModel: self,
                                                                                             checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxRemoveWeightRingPoints,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelRemoveWeightRingPoints,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelRemoveWeightRingPoints.refresh()
        
        return result
    }
}
