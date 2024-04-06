//
//  MagicalViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/21/24.
//

import Foundation
import Observation

@Observable class MagicalViewModel {
    
    @ObservationIgnored unowned var jiggleViewModel: JiggleViewModel!
    @ObservationIgnored unowned var toolInterfaceViewModel: ToolInterfaceViewModel!
    @ObservationIgnored var orientation: Orientation
    @ObservationIgnored unowned var toolNode: ToolNode!
    @ObservationIgnored var neighborTypeLeft: ToolInterfaceElementType?
    @ObservationIgnored var neighborTypeRight: ToolInterfaceElementType?
    
    var isEnabled = true
    
    var layoutX = 0
    var layoutY = 0
    var layoutWidth = 320
    var layoutHeight = 44
    
    init(jiggleViewModel: JiggleViewModel,
         toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.jiggleViewModel = jiggleViewModel
        self.toolInterfaceViewModel = toolInterfaceViewModel
        self.orientation = jiggleViewModel.jiggleDocument.orientation
    }
    
    func refreshLayoutFrame() {
        
    }
    
    func refresh() {
        print("MagicalViewModel ==> Refresh")
    }
    
    func refreshDisabled() {
        isEnabled = false
    }
    
    func refreshEnabled() {
        isEnabled = true
    }
    
    func getLayoutSchemeFlavor() -> LayoutSchemeFlavor {
        if let toolInterfaceViewModel = toolInterfaceViewModel {
            if let toolNode = toolNode {
                let type = toolNode.type
                
                if type == .slider {
                    return toolInterfaceViewModel.layoutSchemeFlavorSliders
                }
                
                let layoutStackingCategory = toolInterfaceViewModel.layoutStackingCategory
                return layoutStackingCategory.getLayoutSchemeFlavor(toolInterfaceElementType: type)
            } else {
                return .stackedSmall
            }
        } else {
            return .stackedSmall
        }
    }
    
    func calculateStackedConsumedWidth(textWidth: Int, textPaddingLeft: Int, textPaddingRight: Int,
                                       imageWidth: Int, imagePaddingLeft: Int, imagePaddingRight: Int) -> Int {
        let width1 = textWidth + textPaddingLeft + textPaddingRight
        let width2 = imageWidth + imagePaddingLeft + imagePaddingRight
        return max(width1, width2)
    }
    
}
