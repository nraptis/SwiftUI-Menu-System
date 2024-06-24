//
//  ToolInterfaceViewModel+IncreaseJigglePoints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getIncreaseJigglePointsTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextIncreaseJigglePointsLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextIncreaseJigglePointsLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelIncreaseJigglePoints = MagicalTextIconButtonViewModelIncreaseJigglePoints(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let test1ToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonIncreaseJigglePoints, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelIncreaseJigglePoints, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelIncreaseJigglePoints.refresh()
        return test1ToolNode
    }
}
