//
//  MagicalDividerViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/29/24.
//

import Foundation
import SwiftUI

@Observable class MagicalDividerViewModel: MagicalViewModel {
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        let capsuleWidth = DividerLayout.getCapsuleWidth(orientation: orientation)
        
        let universalPaddingLeftSqueezed = DividerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .squeezed,
                                                                                  neighborType: neighborTypeLeft)
        let universalPaddingLeftStandard = DividerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .standard,
                                                                                  neighborType: neighborTypeLeft)
        let universalPaddingRightSqueezed = DividerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .squeezed,
                                                                                    neighborType: neighborTypeLeft)
        let universalPaddingRightStandard = DividerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .standard,
                                                                                    neighborType: neighborTypeRight)
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        let totalWidth = layoutWidth
        
        var consumedWidth = capsuleWidth + universalPaddingLeftSqueezed + universalPaddingRightSqueezed
        
        while (consumedWidth < totalWidth) {
            var didModify = false
            
            // Note: This seems slightly insane;
            // Once we factor in neighbors, we will likely have uneven paddings on right and left...
            
            if consumedWidth < totalWidth && _universalPaddingLeft < universalPaddingLeftStandard {
                _universalPaddingLeft += 1
                consumedWidth += 1
                didModify = true
            }
            
            if consumedWidth < totalWidth && _universalPaddingRight < universalPaddingRightStandard {
                _universalPaddingRight += 1
                consumedWidth += 1
                didModify = true
            }
            
            if !didModify {
                break
            }
        }
        
        while true {
            if consumedWidth >= totalWidth { break }
            
            _universalPaddingLeft += 1
            consumedWidth += 1
            
            if consumedWidth >= totalWidth { break }
            
            _universalPaddingRight += 1
            consumedWidth += 1
        }
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
    }
}
