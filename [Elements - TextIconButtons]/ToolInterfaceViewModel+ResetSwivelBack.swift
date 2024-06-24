//
//  ToolInterfaceViewModel+ResetSwivelBack.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getResetSwivelBackTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetSwivelBackLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetSwivelBackLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetSwivelBack = MagicalTextIconButtonViewModelResetSwivelBack(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let test1ToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonResetSwivelBack, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelResetSwivelBack, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelResetSwivelBack.refresh()
        return test1ToolNode
    }
}
