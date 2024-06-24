//
//  ToolInterfaceLayoutDirection.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/26/24.
//

import Foundation

struct ToolInterfaceLayoutStackingLargeData {
    let isSegmentLong: Bool
    let isCheckBoxLong: Bool
    let isTextIconButtonLong: Bool
}

enum ToolInterfaceLayoutStackingCategory {
    case allVerticalSmall
    case allVerticalMedium
    case large(ToolInterfaceLayoutStackingLargeData)
}

extension ToolInterfaceLayoutStackingCategory {
    func getLayoutSchemeFlavor(toolInterfaceElementType: ToolInterfaceElementType) -> LayoutSchemeFlavor {
        
        switch self {
        case .allVerticalSmall:
            return .stackedSmall
        case .allVerticalMedium:
            return .stackedMedium
        case .large(let stackingLargeData):
            switch toolInterfaceElementType {
            case .textIconButton:
                if stackingLargeData.isTextIconButtonLong {
                    return .long
                } else {
                    return .stackedLarge
                }
            case .segment:
                if stackingLargeData.isSegmentLong {
                    return .long
                } else {
                    return .stackedLarge
                }
            case .checkBox:
                if stackingLargeData.isCheckBoxLong {
                    return .long
                } else {
                    return .stackedLarge
                }
            default:
                return .long
            }
        }
    }
    
    var isSmall: Bool {
        switch self {
        case .allVerticalSmall:
            return true
        default:
            return false
        }
    }
    
    var isMedium: Bool {
        switch self {
        case .allVerticalMedium:
            return true
        default:
            return false
        }
    }

    var isSegmentLong: Bool {
        switch self {
        case .allVerticalSmall:
            return false
        case .allVerticalMedium:
            return false
        case .large(let stackingLargeData):
            return stackingLargeData.isSegmentLong
        }
    }
    
    var isCheckBoxLong: Bool {
        switch self {
        case .allVerticalSmall:
            return false
        case .allVerticalMedium:
            return false
        case .large(let stackingLargeData):
            return stackingLargeData.isCheckBoxLong
        }
    }
    
    var isTextIconButtonLong: Bool {
        switch self {
        case .allVerticalSmall:
            return false
        case .allVerticalMedium:
            return false
        case .large(let stackingLargeData):
            return stackingLargeData.isTextIconButtonLong
        }
    }
}

extension ToolInterfaceLayoutStackingCategory {
    
    static func getAllInPriorityOrderExceptLeast() -> [ToolInterfaceLayoutStackingCategory] {
        
        var result = [ToolInterfaceLayoutStackingCategory]()
        
        // Observation: For iPad, we should just do "ever increasing..."
        //              This will be a little less "accurate" but it will
        //              make more sense as the user drags to resize the menu...
        
        if Device.isPad {
            
            // Case with 3
            result.append(ToolInterfaceLayoutStackingCategory.large(.init(isSegmentLong: true, isCheckBoxLong: true, isTextIconButtonLong: true)))
            
            // Cases with 2
            
            result.append(ToolInterfaceLayoutStackingCategory.large(.init(isSegmentLong: true, isCheckBoxLong: true, isTextIconButtonLong: false)))
            
            // Cases with 1
            
            result.append(ToolInterfaceLayoutStackingCategory.large(.init(isSegmentLong: true, isCheckBoxLong: false, isTextIconButtonLong: false)))
            
            
            
        } else {
            // Case with 3
            result.append(ToolInterfaceLayoutStackingCategory.large(.init(isSegmentLong: true, isCheckBoxLong: true, isTextIconButtonLong: true)))
            
            // Cases with 2
            
            result.append(ToolInterfaceLayoutStackingCategory.large(.init(isSegmentLong: true, isCheckBoxLong: true, isTextIconButtonLong: false)))
            result.append(ToolInterfaceLayoutStackingCategory.large(.init(isSegmentLong: true, isCheckBoxLong: false, isTextIconButtonLong: true)))
            result.append(ToolInterfaceLayoutStackingCategory.large(.init(isSegmentLong: false, isCheckBoxLong: true, isTextIconButtonLong: true)))
            
            // Cases with 1
            
            result.append(ToolInterfaceLayoutStackingCategory.large(.init(isSegmentLong: true, isCheckBoxLong: false, isTextIconButtonLong: false)))
            result.append(ToolInterfaceLayoutStackingCategory.large(.init(isSegmentLong: false, isCheckBoxLong: true, isTextIconButtonLong: false)))
            result.append(ToolInterfaceLayoutStackingCategory.large(.init(isSegmentLong: false, isCheckBoxLong: false, isTextIconButtonLong: true)))
        }
        
        
        // Cases with 0
        
        result.append(ToolInterfaceLayoutStackingCategory.large(.init(isSegmentLong: false, isCheckBoxLong: false, isTextIconButtonLong: false)))
        result.append(ToolInterfaceLayoutStackingCategory.allVerticalMedium)
        
        // If nothing else works, we're going to use .allVerticalSmall
        
        return result
    }
    
}
