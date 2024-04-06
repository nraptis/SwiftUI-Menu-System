//
//  ToolInterfaceStringLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/24/24.
//

import Foundation
import UIKit

struct ToolInterfaceStringLibrary {
    
    static func stringOrNull(_ string: String?) -> String? {
        if let string = string {
            if string.count <= 0 {
                return nil
            }
            if string == "NULL" {
                return nil
            }
            return string
        }
        return nil
    }
    
    static func interfaceTextJiggleSpeedLine1() -> String? {
        stringOrNull(String(localized: "jiggle_speed_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextJiggleSpeedLine2() -> String? {
        stringOrNull(String(localized: "jiggle_speed_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextJigglePowerLine1() -> String? {
        stringOrNull(String(localized: "jiggle_power_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextJigglePowerLine2() -> String? {
        stringOrNull(String(localized: "jiggle_power_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextMainMenuLine1() -> String? {
        stringOrNull(String(localized: "main_menu_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextMainMenuLine2() -> String? {
        stringOrNull(String(localized: "main_menu_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextCreateJiggleLine1() -> String? {
        String("CreateCreate")
    }
    
    static func interfaceTextCreateJiggleLine2() -> String? {
        String("Jiggle")
    }
    
    
    static func interfaceTextRemoveJiggleLine1() -> String {
        String("Remove")
    }
    
    static func interfaceTextRemoveJiggleLine2() -> String {
        String("Jiggle")
    }
    
    static func interfaceTextRemovePointLine1() -> String? {
        String("Remove")
    }
    
    static func interfaceTextRemovePointLine2() -> String? {
        String("Point")
    }
    
    static func interfaceTextPointBreakTangentLine1() -> String? {
        stringOrNull(String(localized: "point_break_tangent_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextPointBreakTangentLine2() -> String? {
        stringOrNull(String(localized: "point_break_tangent_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextUndoLine1() -> String? {
        String("Undo")
    }
    
    static func interfaceTextUndoLine2() -> String? {
        nil
    }
    
    static func interfaceTextRedoLine1() -> String? {
        String("Redo")
    }
    
    static func interfaceTextRedoLine2() -> String? {
        String("Redo Redo")
    }
    
    
    static func interfaceTextCloneJiggleLine1() -> String? {
        String("Clone")
    }
    
    static func interfaceTextCloneJiggleLine2() -> String? {
        String("Jiggle")
    }
    
    
    static func interfaceTextZoomResetLine1() -> String? {
        String("Zoom Reset")
    }
    
    static func interfaceTextZoomResetLine2() -> String? {
        String("Reset")
    }
    
    
    static func interfaceTextZoomSelectedLine1() -> String? {
        String("Zoom Selected")
    }
    
    static func interfaceTextZoomSelectedLine2() -> String? {
        String("Zoom Selected")
    }
    
    static func interfaceTextDocumentModeViewLine1() -> String? {
        stringOrNull(String(localized: "mode_view_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextDocumentModeViewLine2() -> String? {
        stringOrNull(String(localized: "mode_view_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextDocumentModeEditLine1() -> String? {
        stringOrNull(String(localized: "mode_edit_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextDocumentModeEditLine2() -> String? {
        stringOrNull(String(localized: "mode_edit_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextEditModeAffineLine1() -> String? {
        stringOrNull(String(localized: "mode_affine_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextEditModeAffineLine2() -> String? {
        stringOrNull(String(localized: "mode_affine_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextEditModeDragPointsLine1() -> String? {
        stringOrNull(String(localized: "mode_move_points_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextEditModeDragPointsLine2() -> String? {
        stringOrNull(String(localized: "mode_move_points_line_2", table: "ToolInterface"))
    }
    
    

    
    

    
    


    
    
    
    static func interfaceTextEditModeDragTangentsLine1() -> String? {
        stringOrNull(String(localized: "mode_move_tangents_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextEditModeDragTangentsLine2() -> String? {
        stringOrNull(String(localized: "mode_move_tangents_line_2", table: "ToolInterface"))
    }
    
    
    static func interfaceTextEditModeWeightLine1() -> String? {
        stringOrNull(String(localized: "mode_weight_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextEditModeWeightLine2() -> String? {
        stringOrNull(String(localized: "mode_weight_line_2", table: "ToolInterface"))
    }
    
    
    static func interfaceTextStereoscopic3DEnabledLine1() -> String? {
        stringOrNull(String(localized: "stereoscopic_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextStereoscopic3DEnabledLine2() -> String? {
        stringOrNull(String(localized: "stereoscopic_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextZoomEnabledLine1() -> String? {
        stringOrNull(String(localized: "zoom_enabled_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextZoomEnabledLine2() -> String? {
        stringOrNull(String(localized: "zoom_enabled_line_2", table: "ToolInterface"))
    }
    
    
}
