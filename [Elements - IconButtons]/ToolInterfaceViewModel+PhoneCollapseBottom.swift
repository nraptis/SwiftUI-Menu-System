//
//  ToolInterfaceViewModel+PhoneCollapseBottom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation
extension ToolInterfaceViewModel {
    
    func getPhoneCollapseBottomToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let configuration = getPhoneCollapseBottomButtonConfiguration()
        let flex = Self.getIconButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        let viewModelPhoneCollapseBottom = MagicalIconButtonViewModelPhoneCollapseBottom(jiggleViewModel: jiggleViewModel,
                                                                                   toolInterfaceViewModel: self,
                                                                                   iconButtonConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .buttonPhoneCollapseBottom,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelPhoneCollapseBottom,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelPhoneCollapseBottom.refresh()
        return result
    }
    
    func getPhoneCollapseBottomButtonConfiguration() -> ToolInterfaceElementIconButtonConfiguration {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        let textIconImagePack = ToolInterfaceImageLibrary.iconPackMainMenu
        return ToolInterfaceElementIconButtonConfiguration(textIconImagePack: textIconImagePack,
                                                           orientation: orientation)
    }
}
