//
//  CheckBoxIconLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/10/24.
//

import Foundation

struct CheckBoxIconLibrary {

    static var sample: CheckBoxIconPack = {
        let slicePad0Lines = AnyTextIcon(fileName: "check_box_sample_pad_0l",
                                         device: .pad, orientation: nil,
                                         imageWidth: 52, imageHeight: 44,
                                         iconX: 1, iconY: 1, iconWidth: 50, iconHeight: 42)
        let slicePad1Line = AnyTextIcon(fileName: "check_box_sample_pad_1l",
                                          device: .pad, orientation: nil,
                                          imageWidth: 44, imageHeight: 36,
                                          iconX: 2, iconY: 2, iconWidth: 40, iconHeight: 32)
        let slicePad2Lines = AnyTextIcon(fileName: "check_box_sample_pad_2l",
                                           device: .pad, orientation: nil,
                                           imageWidth: 32, imageHeight: 24,
                                           iconX: 2, iconY: 2, iconWidth: 28, iconHeight: 20)
        
        let slicePhoneLandscape0Lines = AnyTextIcon(fileName: "check_box_sample_phone_ls_0l",
                                                      device: .phone, orientation: .landscape,
                                                      imageWidth: 36, imageHeight: 28,
                                                      iconX: 1, iconY: 1, iconWidth: 34, iconHeight: 26)
        let slicePhoneLandscape1Line = AnyTextIcon(fileName: "check_box_sample_phone_ls_1l",
                                                     device: .phone, orientation: .landscape,
                                                     imageWidth: 32, imageHeight: 24,
                                                     iconX: 1, iconY: 1, iconWidth: 30, iconHeight: 22)
        let slicePhoneLandscape2Lines = AnyTextIcon(fileName: "check_box_sample_phone_ls_2l",
                                                      device: .phone, orientation: .landscape,
                                                      imageWidth: 24, imageHeight: 16,
                                                      iconX: 1, iconY: 1, iconWidth: 22, iconHeight: 14)
        
        let slicePhonePortrait0Lines = AnyTextIcon(fileName: "check_box_sample_phone_po_0l",
                                                     device: .phone, orientation: .portrait,
                                                     imageWidth: 44, imageHeight: 36,
                                                     iconX: 2, iconY: 2, iconWidth: 40, iconHeight: 32)
        let slicePhonePortrait1Line = AnyTextIcon(fileName: "check_box_sample_phone_po_1l",
                                                    device: .phone, orientation: .portrait,
                                                    imageWidth: 40, imageHeight: 32,
                                                    iconX: 2, iconY: 2, iconWidth: 36, iconHeight: 28)
        let slicePhonePortrait2Lines = AnyTextIcon(fileName: "check_box_sample_phone_po_2l",
                                                     device: .phone, orientation: .portrait,
                                                     imageWidth: 28, imageHeight: 20,
                                                     iconX: 1, iconY: 1, iconWidth: 26, iconHeight: 18)
        
        return CheckBoxIconPack(slicePad0Lines: slicePad0Lines,
                                slicePad1Line: slicePad1Line,
                                slicePad2Lines: slicePad2Lines,
                                
                                slicePhoneLandscape0Lines: slicePhoneLandscape0Lines,
                                slicePhoneLandscape1Line: slicePhoneLandscape1Line,
                                slicePhoneLandscape2Lines: slicePhoneLandscape2Lines,
                                
                                slicePhonePortrait0Lines: slicePhonePortrait0Lines,
                                slicePhonePortrait1Line: slicePhonePortrait1Line,
                                slicePhonePortrait2Lines: slicePhonePortrait2Lines)
    }()
    
    static var removePoints: CheckBoxIconPack = {
        let slicePad0Lines = AnyTextIcon(fileName: "check_box_remove_points_pad_0l",
                                         device: .pad, orientation: nil,
                                         imageWidth: 52, imageHeight: 44,
                                         iconX: 2, iconY: 1, iconWidth: 48, iconHeight: 42)
        let slicePad1Line = AnyTextIcon(fileName: "check_box_remove_points_pad_1l",
                                          device: .pad, orientation: nil,
                                          imageWidth: 44, imageHeight: 36,
                                          iconX: 2, iconY: 2, iconWidth: 40, iconHeight: 32)
        let slicePad2Lines = AnyTextIcon(fileName: "check_box_remove_points_pad_2l",
                                           device: .pad, orientation: nil,
                                           imageWidth: 32, imageHeight: 24,
                                           iconX: 4, iconY: 2, iconWidth: 24, iconHeight: 20)
        
        let slicePhoneLandscape0Lines = AnyTextIcon(fileName: "check_box_remove_points_phone_ls_0l",
                                                      device: .phone, orientation: .landscape,
                                                      imageWidth: 36, imageHeight: 28,
                                                      iconX: 2, iconY: 1, iconWidth: 32, iconHeight: 26)
        let slicePhoneLandscape1Line = AnyTextIcon(fileName: "check_box_remove_points_phone_ls_1l",
                                                     device: .phone, orientation: .landscape,
                                                     imageWidth: 32, imageHeight: 24,
                                                     iconX: 3, iconY: 1, iconWidth: 26, iconHeight: 22)
        let slicePhoneLandscape2Lines = AnyTextIcon(fileName: "check_box_remove_points_phone_ls_2l",
                                                      device: .phone, orientation: .landscape,
                                                      imageWidth: 24, imageHeight: 16,
                                                      iconX: 3, iconY: 1, iconWidth: 17, iconHeight: 14)
        
        let slicePhonePortrait0Lines = AnyTextIcon(fileName: "check_box_remove_points_phone_po_0l",
                                                     device: .phone, orientation: .portrait,
                                                     imageWidth: 44, imageHeight: 36,
                                                     iconX: 3, iconY: 2, iconWidth: 38, iconHeight: 32)
        let slicePhonePortrait1Line = AnyTextIcon(fileName: "check_box_remove_points_phone_po_1l",
                                                    device: .phone, orientation: .portrait,
                                                    imageWidth: 40, imageHeight: 32,
                                                    iconX: 3, iconY: 2, iconWidth: 34, iconHeight: 28)
        let slicePhonePortrait2Lines = AnyTextIcon(fileName: "check_box_remove_points_phone_po_2l",
                                                     device: .phone, orientation: .portrait,
                                                     imageWidth: 28, imageHeight: 20,
                                                     iconX: 3, iconY: 1, iconWidth: 22, iconHeight: 18)
        
        return CheckBoxIconPack(slicePad0Lines: slicePad0Lines,
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
