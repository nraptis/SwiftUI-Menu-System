//
//  MagicalDividerSpacerDividerViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/29/24.
//

import Foundation
import SwiftUI

@Observable class MagicalDividerSpacerDividerViewModel: MagicalViewModel {
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    var spaceBetween = 0
    
    var isShowingTwoDividers = false
    
    override func refreshLayoutFrame() {
        
        let totalWidth = layoutWidth
        
        let minimumLengthForSpacerDividerSpacerToHaveTwoDividers = DividerLayout.getMinimumLengthForSpacerDividerSpacerToHaveTwoDividers(orientation: orientation)
        
        let capsuleWidth = DividerLayout.getCapsuleWidth(orientation: orientation)
            
        let universalPaddingLeftSqueezed = DividerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                 flavor: .long,
                                                                                 squeeze: .squeezed, 
                                                                                 neighborType: neighborTypeLeft)
        let universalPaddingLeftStandard = DividerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                 flavor: .long,
                                                                                 squeeze: .standard,
                                                                                 neighborType: neighborTypeLeft)
        let universalPaddingRightSqueezed = DividerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                   flavor: .long,
                                                                                   squeeze: .squeezed,
                                                                                   neighborType: neighborTypeRight)
        let universalPaddingRightStandard = DividerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                   flavor: .long,
                                                                                   squeeze: .standard,
                                                                                   neighborType: neighborTypeRight)
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        var _spaceBetween = 0
        
        var testWidth = 0
        testWidth += _universalPaddingLeft
        testWidth += capsuleWidth
        testWidth += minimumLengthForSpacerDividerSpacerToHaveTwoDividers
        testWidth += capsuleWidth
        testWidth += _universalPaddingRight
        
        if totalWidth >= testWidth {
            isShowingTwoDividers = true
            
            var consumedWidth = capsuleWidth + capsuleWidth + universalPaddingLeftSqueezed + universalPaddingRightSqueezed
            
            while (consumedWidth < totalWidth) {
                var didModify = false
                
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
                
                if consumedWidth < totalWidth {
                    _spaceBetween += 1
                    consumedWidth += 1
                }
                
                if !didModify {
                    break
                }
            }
            
            let spaceRemaining = totalWidth - consumedWidth
            if spaceRemaining > 0 {
                _spaceBetween += spaceRemaining
                consumedWidth += spaceRemaining
            }
            
        } else {
            isShowingTwoDividers = false
            
            var consumedWidth = capsuleWidth + universalPaddingLeftSqueezed + universalPaddingRightSqueezed
            
            while (consumedWidth < totalWidth) {
                var didModify = false
                
                if _universalPaddingLeft < universalPaddingLeftStandard {
                    _universalPaddingLeft += 1
                    consumedWidth += 1
                    didModify = true
                }
                
                if _universalPaddingRight < universalPaddingRightStandard {
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
        }
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
        
        spaceBetween = _spaceBetween
    }
}
