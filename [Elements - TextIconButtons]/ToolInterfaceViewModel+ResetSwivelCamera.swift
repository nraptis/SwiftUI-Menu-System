//
//  ToolInterfaceViewModel+ResetSwivelCamera.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getResetSwivelCameraTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetSwivelCameraLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetSwivelCameraLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetSwivelCamera = MagicalTextIconButtonViewModelResetSwivelCamera(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self, textIconButtonConfiguration: configuration)
        let resetSwivelCameraToolNode = ToolNode(id: getToolNodeID(), element: .textIconButtonResetSwivelCamera, flex: flex, toolInterfaceViewModel: self, magicalViewModel: viewModelResetSwivelCamera, neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        viewModelResetSwivelCamera.refresh()
        return resetSwivelCameraToolNode
    }
}
