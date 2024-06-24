//
//  SliderIconLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/24/24.
//

import Foundation

struct SliderIconLibrary {
    
    static var boxus: SliderIconPack = {
        let slicePad = AnyTextIcon(fileName: "interface_text_button_box_po_0l",
                                   device: .pad,
                                   orientation: .portrait,
                                   imageWidth: 52, imageHeight: 44,
                                   iconX: 5, iconY: 1, iconWidth: 42, iconHeight: 42)
        let slicePhoneLandscape = AnyTextIcon(fileName: "interface_text_button_box_ls_0l",
                                              device: .pad,
                                              orientation: .portrait,
                                              imageWidth: 40, imageHeight: 32,
                                              iconX: 3, iconY: 3, iconWidth: 34, iconHeight: 26)
        let slicePhonePortrait = AnyTextIcon(fileName: "interface_text_button_box_po_0l",
                                             device: .pad,
                                             orientation: .portrait,
                                             imageWidth: 44, imageHeight: 36,
                                             iconX: 6, iconY: 2, iconWidth: 32, iconHeight: 32)
        return SliderIconPack(slicePad: slicePad,
                              slicePhoneLandscape: slicePhoneLandscape,
                              slicePhonePortrait: slicePhonePortrait)
    }()
}
