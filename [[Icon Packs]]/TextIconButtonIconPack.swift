//
//  TextIconButtonIconPack.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/8/24.
//

import Foundation

struct TextIconButtonIconPack: TextIconPackable {
    
    func getTextIcon(orientation: Orientation,
                     layoutSchemeFlavor: LayoutSchemeFlavor,
                     numberOfLines: Int) -> (any TextIconable) {
        if Device.isPad {
            if layoutSchemeFlavor.isStacked {
                if numberOfLines == 1 {
                    return slicePad1Line
                } else {
                    return slicePad2Lines
                }
            } else {
                return slicePad0Lines
            }
            
        } else {
            if orientation.isLandscape {
                if layoutSchemeFlavor.isStacked {
                    if numberOfLines == 1 {
                        return slicePhoneLandscape1Line
                    } else {
                        return slicePhoneLandscape2Lines
                    }
                } else {
                    return slicePhoneLandscape0Lines
                }
            } else {
                if layoutSchemeFlavor.isStacked {
                    if numberOfLines == 1 {
                        return slicePhonePortrait1Line
                    } else {
                        return slicePhonePortrait2Lines
                    }
                } else {
                    return slicePhonePortrait0Lines
                }
            }
        }
    }
    
    let slicePad0Lines: AnyTextIcon
    let slicePad1Line: AnyTextIcon
    let slicePad2Lines: AnyTextIcon
    
    let slicePhoneLandscape0Lines: AnyTextIcon
    let slicePhoneLandscape1Line: AnyTextIcon
    let slicePhoneLandscape2Lines: AnyTextIcon
    
    let slicePhonePortrait0Lines: AnyTextIcon
    let slicePhonePortrait1Line: AnyTextIcon
    let slicePhonePortrait2Lines: AnyTextIcon
    
 
    init(slicePad0Lines: AnyTextIcon,
         slicePad1Line: AnyTextIcon,
         slicePad2Lines: AnyTextIcon,
         
         slicePhoneLandscape0Lines: AnyTextIcon,
         slicePhoneLandscape1Line: AnyTextIcon,
         slicePhoneLandscape2Lines: AnyTextIcon,
         
         slicePhonePortrait0Lines: AnyTextIcon,
         slicePhonePortrait1Line: AnyTextIcon,
         slicePhonePortrait2Lines: AnyTextIcon) {
        self.slicePad1Line = slicePad1Line
        self.slicePad2Lines = slicePad2Lines
        self.slicePad0Lines = slicePad0Lines
        self.slicePhoneLandscape1Line = slicePhoneLandscape1Line
        self.slicePhoneLandscape2Lines = slicePhoneLandscape2Lines
        self.slicePhoneLandscape0Lines = slicePhoneLandscape0Lines
        self.slicePhonePortrait1Line = slicePhonePortrait1Line
        self.slicePhonePortrait2Lines = slicePhonePortrait2Lines
        self.slicePhonePortrait0Lines = slicePhonePortrait0Lines
    }
}
