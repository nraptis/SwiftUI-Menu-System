//
//  ToolInterfaceViewModel+ExitViewMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getExitViewModeTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextExitViewModeLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextExitViewModeLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelExitViewMode = MagicalTextIconButtonViewModelExitViewMode(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let test1ToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonExitViewMode, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelExitViewMode, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelExitViewMode.refresh()
        return test1ToolNode
    }
}
