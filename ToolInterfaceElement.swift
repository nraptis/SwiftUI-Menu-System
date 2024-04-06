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
    
    case sliderJiggleSpeedAmount
    case sliderJigglePowerAmount
    
    case buttonPhoneCollapseTop
    case buttonPhoneCollapseBottom
    
    case buttonMainMenu
    case buttonCreateJiggle
    case buttonCreateControlPoint
    case buttonRemoveJiggle
    case buttonRemovePoint
    case buttonUndo
    case buttonRedo
    case buttonCloneJiggle
    case buttonZoomReset
    case buttonZoomSelected
    case buttonPointBreakTangent
    
    case segmentDocumentMode
    case segmentEditMode
    
    case checkBoxStereoscopic3DEnabled
    case checkBoxZoomEnabled
    
    case spacer
    case divider
    
    case dividerSpacerDivider
    
    var type: ToolInterfaceElementType {
        switch self {
        case .checkBoxStereoscopic3DEnabled:
            return .checkBox
        case .checkBoxZoomEnabled:
            return .checkBox
        case .sliderJiggleSpeedAmount:
            return .slider
        case .sliderJigglePowerAmount:
            return .slider
        case .buttonPhoneCollapseTop:
            return .iconButton
        case .buttonPhoneCollapseBottom:
            return .iconButton
        case .buttonMainMenu:
            return .textIconButton
        case .buttonCreateJiggle:
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
        case .buttonCloneJiggle:
            return .textIconButton
        case .buttonZoomReset:
            return .textIconButton
        case .buttonZoomSelected:
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

