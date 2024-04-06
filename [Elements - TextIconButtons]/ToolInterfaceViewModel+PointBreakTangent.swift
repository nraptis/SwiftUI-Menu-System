//
//  ToolInterfaceViewModel+PointBreakTangent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/27/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getPointBreakTangentButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getPointBreakTangentButtonConfiguration()
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        let viewModelPointBreakTangent = MagicalTextIconButtonViewModelPointBreakTangent(jiggleViewModel: jiggleViewModel,
                                                                                         toolInterfaceViewModel: self,
                                                                                         textIconButtonConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .buttonPointBreakTangent,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelPointBreakTangent,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelPointBreakTangent.refresh()
        return result
    }
    
    func getPointBreakTangentButtonConfiguration() -> ToolInterfaceElementTextIconButtonConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibrary.interfaceTextPointBreakTangentLine1()
        let textLine2 = ToolInterfaceStringLibrary.interfaceTextPointBreakTangentLine2()
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        
        return ToolInterfaceElementTextIconButtonConfiguration(textIconImagePack: textIconImagePack,
                                                               orientation: orientation,
                                                               nameLabelLine1: textLine1,
                                                               nameLabelLine2: textLine2)
    }
    
}
