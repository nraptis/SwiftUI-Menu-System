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
        if let string = string?.trimmingCharacters(in: .whitespacesAndNewlines) {
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
    
    static func interfaceTextZoomLine1() -> String? {
        stringOrNull(String(localized: "zoom_amount_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextZoomLine2() -> String? {
        stringOrNull(String(localized: "zoom_amount_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextTwistSpeedLine1() -> String? {
        stringOrNull(String(localized: "twist_speed_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextTwistSpeedLine2() -> String? {
        stringOrNull(String(localized: "twist_speed_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextTwistPowerLine1() -> String? {
        stringOrNull(String(localized: "twist_power_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextTwistPowerLine2() -> String? {
        stringOrNull(String(localized: "twist_power_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextBounceSpeedLine1() -> String? {
        stringOrNull(String(localized: "bounce_speed_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextBounceSpeedLine2() -> String? {
        stringOrNull(String(localized: "bounce_speed_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextBouncePowerLine1() -> String? {
        stringOrNull(String(localized: "bounce_power_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextBouncePowerLine2() -> String? {
        stringOrNull(String(localized: "bounce_power_line_2", table: "ToolInterface"))
    }
    
    
    static func interfaceTextMainMenuLine1() -> String? {
        stringOrNull(String(localized: "main_menu_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextMainMenuLine2() -> String? {
        stringOrNull(String(localized: "main_menu_line_2", table: "ToolInterface"))
    }
    
    
    static func interfaceTextCreateJiggleLine1() -> String? {
        stringOrNull(String(localized: "create_jiggle_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextCreateJiggleLine2() -> String? {
        stringOrNull(String(localized: "create_jiggle_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextRemoveJiggleLine1() -> String? {
        stringOrNull(String(localized: "remove_jiggle_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextRemoveJiggleLine2() -> String? {
        stringOrNull(String(localized: "remove_jiggle_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextCloneJiggleLine1() -> String? {
        stringOrNull(String(localized: "clone_jiggle_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextCloneJiggleLine2() -> String? {
        stringOrNull(String(localized: "clone_jiggle_line_2", table: "ToolInterface"))
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
        stringOrNull(String(localized: "undo_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextUndoLine2() -> String? {
        stringOrNull(String(localized: "undo_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextRedoLine1() -> String? {
        stringOrNull(String(localized: "redo_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextRedoLine2() -> String? {
        stringOrNull(String(localized: "redo_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextFlipVerticalLine1() -> String? {
        stringOrNull(String(localized: "flip_vertical_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextFlipVerticalLine2() -> String? {
        stringOrNull(String(localized: "flip_vertical_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextFlipHorizontalLine1() -> String? {
        stringOrNull(String(localized: "flip_horizontal_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextFlipHorizontalLine2() -> String? {
        stringOrNull(String(localized: "flip_horizontal_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextRecordMovieLine1() -> String? {
        stringOrNull(String(localized: "record_movie_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextRecordMovieLine2() -> String? {
        stringOrNull(String(localized: "record_movie_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextResetZoomLine1() -> String? {
        stringOrNull(String(localized: "reset_zoom_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextResetZoomLine2() -> String? {
        stringOrNull(String(localized: "reset_zoom_line_2", table: "ToolInterface"))
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
    
    
    static func interfaceTextStereoscopicEnabledLine1() -> String? {
        stringOrNull(String(localized: "stereoscopic_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextStereoscopicEnabledLine2() -> String? {
        stringOrNull(String(localized: "stereoscopic_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextZoomEnabledLine1() -> String? {
        stringOrNull(String(localized: "zoom_enabled_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextZoomEnabledLine2() -> String? {
        stringOrNull(String(localized: "zoom_enabled_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextAudioEnabledLine1() -> String? {
        stringOrNull(String(localized: "audio_enabled_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextAudioEnabledLine2() -> String? {
        stringOrNull(String(localized: "audio_enabled_line_2", table: "ToolInterface"))
    }
    
    static func interfaceTextGyroscopeEnabledLine1() -> String? {
        stringOrNull(String(localized: "gyroscope_enabled_line_1", table: "ToolInterface"))
    }
    
    static func interfaceTextGyroscopeEnabledLine2() -> String? {
        stringOrNull(String(localized: "gyroscope_enabled_line_2", table: "ToolInterface"))
    }
    
    
    
    
    
    
}
