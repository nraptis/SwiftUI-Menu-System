//
//  ToolInterfaceViewModel+SelectPreviousWeightRingPoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getSelectPreviousWeightRingPointTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousWeightRingPointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousWeightRingPointLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectPreviousWeightRingPoint = MagicalTextIconButtonViewModelSelectPreviousWeightRingPoint(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let selectPreviousWeightRingPointToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonSelectPreviousWeightRingPoint, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelSelectPreviousWeightRingPoint, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelSelectPreviousWeightRingPoint.refresh()
        return selectPreviousWeightRingPointToolNode
    }
}
