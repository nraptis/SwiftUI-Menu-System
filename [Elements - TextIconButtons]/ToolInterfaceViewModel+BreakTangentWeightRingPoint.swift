//
//  ToolInterfaceViewModel+BreakTangentWeightRingPoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getBreakTangentWeightRingPointTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextBreakTangentWeightRingPointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextBreakTangentWeightRingPointLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelBreakTangentWeightRingPoint = MagicalTextIconButtonViewModelBreakTangentWeightRingPoint(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let breakTangentWeightRingPointToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonBreakTangentWeightRingPoint, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelBreakTangentWeightRingPoint, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelBreakTangentWeightRingPoint.refresh()
        return breakTangentWeightRingPointToolNode
    }
}
