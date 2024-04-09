//
//  ToolInterfaceElement.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/19/24.
//

import Foundation

enum ToolInterfaceElementType: UInt16 {
    case textIconButton
    case iconButton
    case slider
    case segment
    case spacer
    case divider
    case dividerSpacerDivider
    case checkBox
}

enum ToolInterfaceElement: UInt16 {
    
    case sliderJiggleSpeed
    case sliderJigglePower
    case sliderTwistSpeed
    case sliderTwistPower
    case sliderBounceSpeed
    case sliderBouncePower
    case sliderZoom
    
    case buttonPhoneCollapseTop
    case buttonPhoneCollapseBottom
    
    case buttonMainMenu
    case buttonCreateJiggle
    case buttonCreateControlPoint
    case buttonRemoveJiggle
    case buttonRemovePoint
    case buttonUndo
    case buttonRedo
    case buttonResetZoom
    case buttonFlipHorizontal
    case buttonFlipVertical
    
    case buttonCloneJiggle
    
    case buttonZoomSelected
    case buttonPointBreakTangent
    case buttonRecordMovie
    
    
    case segmentDocumentMode
    case segmentEditMode
    
    case checkBoxStereoscopicEnabled
    case checkBoxZoomEnabled
    case checkBoxAudioEnabled
    case checkBoxGyroscopeEnabled
    
    case spacer
    case divider
    
    case dividerSpacerDivider
    
    var type: ToolInterfaceElementType {
        switch self {
        case .checkBoxStereoscopicEnabled:
            return .checkBox
        case .checkBoxZoomEnabled:
            return .checkBox
        case .checkBoxAudioEnabled:
            return .checkBox
        case .checkBoxGyroscopeEnabled:
            return .checkBox
        case .sliderJiggleSpeed:
            return .slider
        case .sliderJigglePower:
            return .slider
        case .sliderTwistSpeed:
            return .slider
        case .sliderTwistPower:
            return .slider
        case .sliderZoom:
            return .slider
        case .sliderBounceSpeed:
            return .slider
        case .sliderBouncePower:
            return .slider
            
        case .buttonPhoneCollapseTop:
            return .iconButton
        case .buttonPhoneCollapseBottom:
            return .iconButton
        case .buttonMainMenu:
            return .textIconButton
        case .buttonCreateJiggle:
            return .textIconButton
        case .buttonCloneJiggle:
            return .textIconButton
            
        case .buttonCreateControlPoint:
            return .textIconButton
        case .buttonRemoveJiggle:
            return .textIconButton
        case .buttonRemovePoint:
            return .textIconButton
        case .buttonPointBreakTangent:
            return .textIconButton
        case .buttonUndo:
            return .textIconButton
        case .buttonRedo:
            return .textIconButton
        case .buttonResetZoom:
            return .textIconButton
        case .buttonZoomSelected:
            return .textIconButton
        case .buttonFlipHorizontal:
            return .textIconButton
        case .buttonFlipVertical:
            return .textIconButton
        case .buttonRecordMovie:
            return .textIconButton
            
        case .segmentDocumentMode:
            return .segment
        case .segmentEditMode:
            return .segment
        case .spacer:
            return .spacer
        case .divider:
            return .divider
        case .dividerSpacerDivider:
            return .dividerSpacerDivider
        }
    }
    
}

