//
//  SliderIconLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/24/24.
//

import Foundation

struct SliderIconPack: TextIconPackable {
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     numberOfLines: Int) -> (any TextIconable) {
        if Device.isPad {
            return slicePad
        } else {
            if orientation.isLandscape {
                return slicePhoneLandscape
            } else {
                return slicePhonePortrait
            }
        }
    }
    
    let slicePad: AnyTextIcon
    let slicePhoneLandscape: AnyTextIcon
    let slicePhonePortrait: AnyTextIcon
    
    init(slicePad: AnyTextIcon,
         slicePhoneLandscape: AnyTextIcon,
         slicePhonePortrait: AnyTextIcon) {
        self.slicePad = slicePad
        self.slicePhoneLandscape = slicePhoneLandscape
        self.slicePhonePortrait = slicePhonePortrait
    }
}
