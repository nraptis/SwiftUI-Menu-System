//
//  ToolInterfaceViewModel+RecordCancel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRecordCancelTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRecordCancelLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRecordCancelLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRecordCancel = MagicalTextIconButtonViewModelRecordCancel(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let recordCancelToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonRecordCancel, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelRecordCancel, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelRecordCancel.refresh()
        return recordCancelToolNode
    }
}
