//
//  ToolInterfaceViewModel+Dividers.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/29/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getDividerFlex() -> ToolInterfaceElementFlex {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        
        let universalPaddingLeftSqueezed = DividerLayout.getUniversalPaddingLeft(orientation: orientation, 
                                                                                 flavor: .long,
                                                                                 squeeze: .squeezed,
                                                                                 neighborType: nil)
        let universalPaddingLeftStandard = DividerLayout.getUniversalPaddingLeft(orientation: orientation, 
                                                                                 flavor: .long,
                                                                                 squeeze: .standard,
                                                                                 neighborType: nil)
        let universalPaddingRightSqueezed = DividerLayout.getUniversalPaddingRight(orientation: orientation, 
                                                                                   flavor: .long,
                                                                                   squeeze: .squeezed,
                                                                                   neighborType: nil)
        let universalPaddingRightStandard = DividerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                   flavor: .long,
                                                                                   squeeze: .standard, 
                                                                                   neighborType: nil)
        
        let capsuleWidth = DividerLayout.getCapsuleWidth(orientation: orientation)
        
        let minimumWidth = capsuleWidth + universalPaddingLeftSqueezed + universalPaddingRightSqueezed
        let standardWidth = capsuleWidth + universalPaddingLeftStandard + universalPaddingRightStandard
        
        let flexDividerData = FlexDividerData(minimumWidth: minimumWidth,
                                              standardWidth: standardWidth)
        return ToolInterfaceElementFlex.divider(flexDividerData)
    }
    
    func getDividerToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let flex = getDividerFlex()
        let viewModelDivider = MagicalDividerViewModel(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: self)
        let result = ToolNode(id: getToolNodeID(),
                              element: .divider,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelDivider, 
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelDivider.refresh()
        return result
    }
}
