//
//  ToolInterfaceViewModel+SelectPreviousWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getSelectPreviousWeightRingTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousWeightRingLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousWeightRingLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectPreviousWeightRing = MagicalTextIconButtonViewModelSelectPreviousWeightRing(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let selectPreviousWeightRingToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonSelectPreviousWeightRing, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelSelectPreviousWeightRing, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelSelectPreviousWeightRing.refresh()
        return selectPreviousWeightRingToolNode
    }
}
