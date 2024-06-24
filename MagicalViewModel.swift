//
//  MagicalViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/21/24.
//

import Foundation
import Observation
import SwiftUI

@Observable class MagicalViewModel {
    
    @ObservationIgnored unowned var jiggleViewModel: JiggleViewModel!
    @ObservationIgnored unowned var toolInterfaceViewModel: ToolInterfaceViewModel!
    @ObservationIgnored var orientation: Orientation
    @ObservationIgnored unowned var toolNode: ToolNode!
    @ObservationIgnored var neighborTypeLeft: ToolInterfaceElementType?
    @ObservationIgnored var neighborTypeRight: ToolInterfaceElementType?
    @ObservationIgnored var layoutStackingCategory = ToolInterfaceLayoutStackingCategory.allVerticalSmall
    @ObservationIgnored var layoutSchemeFlavorSliders = LayoutSchemeFlavor.stackedSmall
    
    
    var isEnabled = true
    var isHighlighted = false
    
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
        
    }
    
    func refreshDisabled() {
        isEnabled = false
    }
    
    func refreshEnabled() {
        isEnabled = true
    }
    
    func getLayoutSchemeFlavor() -> LayoutSchemeFlavor {
        if let toolNode = toolNode {
            let type = toolNode.type
            
            if type == .slider {
                return layoutSchemeFlavorSliders
            }
            
            return layoutStackingCategory.getLayoutSchemeFlavor(toolInterfaceElementType: type)
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
    
    func getTextAndIconColor(isPressed: Bool) -> Color {
        if isEnabled {
            if isPressed {
                if isHighlighted {
                    return ToolInterfaceTheme.highlightedYellowDown
                } else {
                    return ToolInterfaceTheme.enabledGrayDown
                }
            } else {
                if isHighlighted {
                    return ToolInterfaceTheme.highlightedYellowUp
                } else {
                    return ToolInterfaceTheme.enabledGrayUp
                }
            }
        } else {
            return ToolInterfaceTheme.disabledGray
        }
    }
    
    func getTextAndIconColor() -> Color {
        if isEnabled {
            if isHighlighted {
                return ToolInterfaceTheme.highlightedYellowUp
            } else {
                return ToolInterfaceTheme.enabledGrayUp
            }
        } else {
            return ToolInterfaceTheme.disabledGray
        }
    }
    
    func finishRefreshEnableCheckForAllCreateModes() {
        
        if jiggleViewModel.jiggleDocument.isCreateJiggleStandardEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isCreateJiggleDrawingEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isCreatePointsEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isRemovePointsEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isCreateWeightRingsStandardEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isCreateWeightRingsDrawingEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isCreateWeightRingPointsEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if jiggleViewModel.jiggleDocument.isRemoveWeightRingPointsEnabled {
            if isEnabled {
                isEnabled = false
            }
            return
        }
        
        if isEnabled == false {
            isEnabled = true
        }
    }
    
}
