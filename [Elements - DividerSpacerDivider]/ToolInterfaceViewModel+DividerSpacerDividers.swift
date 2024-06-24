//
//  ToolInterfaceViewModel+DividerSpacerDividers.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/29/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getDividerSpacerDividerFlex() -> ToolInterfaceElementFlex {
        let orientation = jiggleViewModel.jiggleDocument.orientation
        
        let dividerUniversalPaddingLeftSqueezed = DividerLayout.getUniversalPaddingLeft(orientation: orientation, 
                                                                                        flavor: .long,
                                                                                        squeeze: .squeezed,
                                                                                        neighborTypeLeft: nil,
                                                                                        neighborTypeRight: nil)
        let dividerUniversalPaddingLeftStandard = DividerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                        flavor: .long,
                                                                                        squeeze: .standard,
                                                                                        neighborTypeLeft: nil,
                                                                                        neighborTypeRight: nil)
        let dividerUniversalPaddingRightSqueezed = DividerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                          flavor: .long,
                                                                                          squeeze: .squeezed,
                                                                                          neighborTypeLeft: nil,
                                                                                          neighborTypeRight: nil)
        let dividerUniversalPaddingRightStandard = DividerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                          flavor: .long,
                                                                                          squeeze: .standard,
                                                                                          neighborTypeLeft: nil,
                                                                                          neighborTypeRight: nil)
        
        let capsuleWidth = DividerLayout.getCapsuleWidth(orientation: orientation)
        
        let minimumWidth = capsuleWidth + dividerUniversalPaddingLeftSqueezed + dividerUniversalPaddingRightSqueezed
        
        var standardWidth =  0
        
        // add one divider, standard size
        standardWidth += dividerUniversalPaddingLeftStandard
        standardWidth += capsuleWidth
        standardWidth += dividerUniversalPaddingRightStandard
        
        // add the default spacer width
        
        standardWidth += DividerLayout.getMinimumLengthForSpacerDividerSpacerToHaveTwoDividers(orientation: orientation)
        
        // add the other divider, standard size
        standardWidth += dividerUniversalPaddingLeftStandard
        standardWidth += capsuleWidth
        standardWidth += dividerUniversalPaddingRightStandard
        
        let flexDividerData = FlexDividerData(minimumWidth: minimumWidth,
                                              standardWidth: standardWidth)
        return ToolInterfaceElementFlex.dividerSpacerDivider(flexDividerData)
    }
    
    func getDividerSpacerDividerToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let flex = getDividerSpacerDividerFlex()
        let viewModelDividerSpacerDivider = MagicalDividerSpacerDividerViewModel(jiggleViewModel: jiggleViewModel,
                                                                                 toolInterfaceViewModel: self)
        let result = ToolNode(id: getToolNodeID(),
                              element: .dividerSpacerDivider,
                              flex: flex,
                              toolInterfaceViewModel: self,
                              magicalViewModel: viewModelDividerSpacerDivider,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelDividerSpacerDivider.refresh()
        return result
    }
    
}
