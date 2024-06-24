//
//  ToolInterfaceViewModel+RemoveWeightRingPoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRemoveWeightRingPointTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRemoveWeightRingPointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRemoveWeightRingPointLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRemoveWeightRingPoint = MagicalTextIconButtonViewModelRemoveWeightRingPoint(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let removeWeightRingPointToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonRemoveWeightRingPoint, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelRemoveWeightRingPoint, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelRemoveWeightRingPoint.refresh()
        return removeWeightRingPointToolNode
    }
}
