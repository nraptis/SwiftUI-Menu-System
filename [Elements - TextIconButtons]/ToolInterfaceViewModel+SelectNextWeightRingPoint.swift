//
//  ToolInterfaceViewModel+SelectNextWeightRingPoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getSelectNextWeightRingPointTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextWeightRingPointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextWeightRingPointLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectNextWeightRingPoint = MagicalTextIconButtonViewModelSelectNextWeightRingPoint(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let selectNextWeightRingPointToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonSelectNextWeightRingPoint, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelSelectNextWeightRingPoint, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelSelectNextWeightRingPoint.refresh()
        return selectNextWeightRingPointToolNode
    }
}
