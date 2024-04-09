//
//  MagicalIconButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation
import SwiftUI

// So, it's not until the LAYOUT (row) step that we will KNOW WHICH CONFIGURATION...
// It has HAS HAS to be... That we DO NOT DECIDE which layout until... Until... THEN!!!

@Observable class MagicalIconButtonViewModel: MagicalViewModel {
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var iconPaddingLeft = 0
    var iconPaddingRight = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    let iconButtonConfiguration: ToolInterfaceElementIconButtonConfiguration
    init(jiggleViewModel: JiggleViewModel,
         toolInterfaceViewModel: ToolInterfaceViewModel,
         iconButtonConfiguration: ToolInterfaceElementIconButtonConfiguration) {
        self.iconButtonConfiguration = iconButtonConfiguration
        super.init(jiggleViewModel: jiggleViewModel,
                   toolInterfaceViewModel: toolInterfaceViewModel)
    }
    
    override func refreshDisabled() {
        super.refreshDisabled()
    }
    
    override func refreshEnabled() {
        super.refreshEnabled()
    }
    
    func handleClicked() {
        print("MagicalIconButtonViewModel => handleClicked()")
    }
    
    func getTextIcon() -> TextIcon {
        return ToolInterfaceImageLibrary.getTextIcon(numberOfLines: 1,
                                                     textIconImagePack: iconButtonConfiguration.textIconImagePack,
                                                     orientation: orientation,
                                                     layoutSchemeFlavor: .long)
    }
    
    override func refreshLayoutFrame() {
        
        let textIcon = getTextIcon()
        
        let iconWidth = textIcon.iconWidth
        
        let universalPaddingLeftSqueezed = IconButtonLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                    flavor: .long,
                                                                                    squeeze: .squeezed,
                                                                                    neighborType: neighborTypeLeft)
        let universalPaddingLeftStandard = IconButtonLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                    flavor: .long,
                                                                                    squeeze: .standard,
                                                                                    neighborType: neighborTypeLeft)
        let universalPaddingRightSqueezed = IconButtonLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .squeezed,
                                                                                      neighborType: neighborTypeLeft)
        let universalPaddingRightStandard = IconButtonLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .standard,
                                                                                      neighborType: neighborTypeRight)
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        let iconPaddingLeftSqueezed = IconButtonLayout.getIconPaddingLeft(orientation: orientation,
                                                                          flavor: .long,
                                                                          squeeze: .squeezed)
        let iconPaddingLeftStandard = IconButtonLayout.getIconPaddingLeft(orientation: orientation,
                                                                          flavor: .long,
                                                                          squeeze: .standard)
        let iconPaddingRightSqueezed = IconButtonLayout.getIconPaddingRight(orientation: orientation,
                                                                            flavor: .long,
                                                                            squeeze: .squeezed)
        let iconPaddingRightStandard = IconButtonLayout.getIconPaddingRight(orientation: orientation,
                                                                            flavor: .long,
                                                                            squeeze: .standard)
        var _iconPaddingLeft = iconPaddingLeftSqueezed
        var _iconPaddingRight = iconPaddingRightSqueezed
        
        let totalWidth = layoutWidth
        
        var consumedWidth = Int(0)
        consumedWidth += universalPaddingRightSqueezed
        consumedWidth += universalPaddingLeftSqueezed
        
        consumedWidth += iconWidth
        consumedWidth += iconPaddingLeftSqueezed
        consumedWidth += iconPaddingRightSqueezed
        
        while consumedWidth < totalWidth {
            
            var didModify = false
            
            if _iconPaddingLeft < iconPaddingLeftStandard && consumedWidth < totalWidth {
                _iconPaddingLeft += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _iconPaddingRight < iconPaddingRightStandard && consumedWidth < totalWidth {
                _iconPaddingRight += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _universalPaddingLeft < universalPaddingLeftStandard && consumedWidth < totalWidth {
                _universalPaddingLeft += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _universalPaddingRight < universalPaddingRightStandard && consumedWidth < totalWidth {
                _universalPaddingRight += 1
                consumedWidth += 1
                didModify = true
            }
            
            if didModify == false {
                break
            }
        }
        
        while consumedWidth < totalWidth {
            if consumedWidth < totalWidth {
                _universalPaddingRight += 1
                consumedWidth += 1
            }
            if consumedWidth < totalWidth {
                _universalPaddingLeft += 1
                consumedWidth += 1
            }
        }
        
        iconPaddingLeft = _iconPaddingLeft
        iconPaddingRight = _iconPaddingRight
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
    }
}
