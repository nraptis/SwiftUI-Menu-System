//
//  ORIGINA.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getStaggerEnabledCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextStaggerEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextStaggerEnabledLine2()
        let iconPack = CheckBoxIconLibrary.removePoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelStaggerEnabled = MagicalCheckBoxViewModelStaggerEnabled(jiggleViewModel: jiggleViewModel,
                                                                             toolInterfaceViewModel: self,
                                                                             checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxStaggerEnabled,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelStaggerEnabled,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelStaggerEnabled.refresh()
        
        return result
    }
}
