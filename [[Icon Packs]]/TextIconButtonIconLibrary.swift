//
//  TextIconButtonIconLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/8/24.
//

import Foundation

struct TextIconButtonIconLibrary {
    
    static var box: TextIconButtonIconPack = {
        
        let slicePad1Line = AnyTextIcon(fileName: "interface_text_button_box_po_1l",
                                        device: .pad,
                                        orientation: .portrait, imageWidth: 52, imageHeight: 44,
                                        iconX: 2, iconY: 2, iconWidth: 48, iconHeight: 40)
        
        let slicePad2Lines = AnyTextIcon(fileName: "interface_text_button_box_po_2l",
                                         device: .pad,
                                         orientation: .portrait,
                                         imageWidth: 40, imageHeight: 32,
                                         iconX: 3, iconY: 3, iconWidth: 34, iconHeight: 26)
        let slicePad0Lines = AnyTextIcon(fileName: "interface_text_button_box_po_0l",
                                        device: .pad,
                                        orientation: .portrait,
                                        imageWidth: 52, imageHeight: 44,
                                        iconX: 5, iconY: 1, iconWidth: 42, iconHeight: 42)
        
        let slicePhoneLandscape1Line = AnyTextIcon(fileName: "interface_text_button_box_ls_1l",
                                                   device: .pad,
                                                   orientation: .portrait,
                                                   imageWidth: 40, imageHeight: 32,
                                                   iconX: 3, iconY: 3, iconWidth: 34, iconHeight: 26)
        let slicePhoneLandscape2Lines = AnyTextIcon(fileName: "interface_text_button_box_ls_2l",
                                                    device: .pad,
                                                    orientation: .portrait,
                                                    imageWidth: 28, imageHeight: 20,
                                                    iconX: 2, iconY: 2, iconWidth: 24, iconHeight: 16)
        let slicePhoneLandscape0Lines = AnyTextIcon(fileName: "interface_text_button_box_ls_0l",
                                                   device: .pad,
                                                   orientation: .portrait,
                                                   imageWidth: 40, imageHeight: 32,
                                                   iconX: 3, iconY: 3, iconWidth: 34, iconHeight: 26)
        
        let slicePhonePortrait1Line = AnyTextIcon(fileName: "interface_text_button_box_po_1l",
                                                  device: .pad,
                                                  orientation: .portrait,
                                                  imageWidth: 44, imageHeight: 36,
                                                  iconX: 2, iconY: 2, iconWidth: 40, iconHeight: 32)
        let slicePhonePortrait2Lines = AnyTextIcon(fileName: "interface_text_button_box_po_2l",
                                                   device: .pad,
                                                   orientation: .portrait,
                                                   imageWidth: 32, imageHeight: 24,
                                                   iconX: 2, iconY: 2, iconWidth: 28, iconHeight: 20)
        let slicePhonePortrait0Lines = AnyTextIcon(fileName: "interface_text_button_box_po_0l",
                                                  device: .pad,
                                                  orientation: .portrait,
                                                  imageWidth: 44, imageHeight: 36,
                                                  iconX: 6, iconY: 2, iconWidth: 32, iconHeight: 32)
        return TextIconButtonIconPack(slicePad0Lines: slicePad0Lines,
                                      slicePad1Line: slicePad1Line,
                                      slicePad2Lines: slicePad2Lines,
                                      
                                      slicePhoneLandscape0Lines: slicePhoneLandscape0Lines,
                                      slicePhoneLandscape1Line: slicePhoneLandscape1Line,
                                      slicePhoneLandscape2Lines: slicePhoneLandscape2Lines,
                                      
                                      slicePhonePortrait0Lines: slicePhonePortrait0Lines,
                                      slicePhonePortrait1Line: slicePhonePortrait1Line,
                                      slicePhonePortrait2Lines: slicePhonePortrait2Lines)
    }()
    
}
