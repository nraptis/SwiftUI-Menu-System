//
//  ToolInterfaceImageLibrary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/22/24.
//

import Foundation
import UIKit

struct ToolInterfaceImageLibrary {
    
    static var buttonMainMenuUp: UIImage {
        UIImage(named: "size_58") ?? UIImage()
    }
    
    static var buttonMainMenuDown: UIImage {
        UIImage(named: "tb_btn_menu_down") ?? UIImage()
    }
    
    
    static var buttonCreateJiggleUp: UIImage {
        UIImage(named: "size_64") ?? UIImage()
    }

    static var buttonCreateJiggleDown: UIImage {
        UIImage(named: "tb_btn_add_blob_down") ?? UIImage()
    }
    
    
    
    static var buttonRemoveJiggleUp: UIImage {
        UIImage(named: "tb_btn_delete_blob") ?? UIImage()
    }

    static var buttonRemoveJiggleDown: UIImage {
        UIImage(named: "tb_btn_delete_blob_down") ?? UIImage()
    }
    
    static var buttonRemovePointUp: UIImage {
        UIImage(named: "tb_btn_delete_point") ?? UIImage()
    }

    static var buttonRemovePointDown: UIImage {
        UIImage(named: "tb_btn_delete_point_down") ?? UIImage()
    }
    
    static var buttonUndoUp: UIImage {
        UIImage(named: "tb_btn_undo") ?? UIImage()
    }

    static var buttonUndoDown: UIImage {
        UIImage(named: "tb_btn_undo_down") ?? UIImage()
    }
    
    static var buttonRedoUp: UIImage {
        UIImage(named: "tb_btn_redo") ?? UIImage()
    }

    static var buttonRedoDown: UIImage {
        UIImage(named: "tb_btn_redo_down") ?? UIImage()
    }
    
    static var buttonCloneJiggleUp: UIImage {
        UIImage(named: "tb_btn_add_blob") ?? UIImage()
    }

    static var buttonCloneJiggleDown: UIImage {
        UIImage(named: "tb_btn_add_blob_down") ?? UIImage()
    }
    
    static var buttonResetZoomUp: UIImage {
        UIImage(named: "tb_btn_reset_zoom") ?? UIImage()
    }

    static var buttonResetZoomDown: UIImage {
        UIImage(named: "tb_btn_reset_zoom_down") ?? UIImage()
    }
    
    static var buttonZoomSelectedUp: UIImage {
        UIImage(named: "tb_btn_unfreeze_all") ?? UIImage()
    }

    static var buttonZoomSelectedDown: UIImage {
        UIImage(named: "tb_btn_unfreeze_all") ?? UIImage()
    }
    
    static var segmentDocumentModeViewUnselectedUp: UIImage {
        UIImage(named: "tb_seg_view_free") ?? UIImage()
    }
    
    static var segmentDocumentModeViewUnselectedDown: UIImage {
        UIImage(named: "tb_btn_clone_blob") ?? UIImage()
    }
    
    static var segmentDocumentModeViewSelectedUp: UIImage {
        UIImage(named: "tb_seg_view_free_selected") ?? UIImage()
    }
    
    static var segmentDocumentModeViewSelectedDown: UIImage {
        UIImage(named: "tb_btn_clone_blob_down") ?? UIImage()
    }
    
    
    
    
    static var segmentDocumentModeEditUnselectedUp: UIImage {
        UIImage(named: "tb_seg_edit") ?? UIImage()
    }
    
    static var segmentDocumentModeEditUnselectedDown: UIImage {
        UIImage(named: "tb_seg_anim_bulge_bouncer_selected") ?? UIImage()
    }
    
    static var segmentDocumentModeEditSelectedUp: UIImage {
        UIImage(named: "tb_seg_edit_selected") ?? UIImage()
    }
    
    static var segmentDocumentModeEditSelectedDown: UIImage {
        UIImage(named: "tb_seg_anim_bulge_bouncer_selected") ?? UIImage()
    }
    
    
    
    
    static var segmentEditModeAffineUnselectedUp: UIImage {
        UIImage(named: "tb_seg_edit_affine") ?? UIImage()
    }
    
    static var segmentEditModeAffineUnselectedDown: UIImage {
        UIImage(named: "tb_seg_anim_bulge_bouncer_selected") ?? UIImage()
    }
    
    static var segmentEditModeAffineSelectedUp: UIImage {
        UIImage(named: "tb_seg_edit_affine_selected") ?? UIImage()
    }
    
    static var segmentEditModeAffineSelectedDown: UIImage {
        UIImage(named: "tb_seg_anim_bulge_bouncer_selected") ?? UIImage()
    }
    
    
    
    
    static var segmentEditModeDragPointsUnselectedUp: UIImage {
        UIImage(named: "tb_seg_edit_shape") ?? UIImage()
    }
    
    static var segmentEditModeDragPointsUnselectedDown: UIImage {
        UIImage(named: "tb_seg_anim_bulge_bouncer_selected") ?? UIImage()
    }
    
    static var segmentEditModeDragPointsSelectedUp: UIImage {
        UIImage(named: "tb_seg_edit_shape_selected") ?? UIImage()
    }
    
    static var segmentEditModeDragPointsSelectedDown: UIImage {
        UIImage(named: "tb_seg_anim_bulge_bouncer_selected") ?? UIImage()
    }
    
    
    
    
    static var segmentEditModeDragTangentsUnselectedUp: UIImage {
        UIImage(named: "tb_seg_anim_crazy") ?? UIImage()
    }
    
    static var segmentEditModeDragTangentsUnselectedDown: UIImage {
        UIImage(named: "tb_seg_anim_bulge_bouncer_selected") ?? UIImage()
    }
    
    static var segmentEditModeDragTangentsSelectedUp: UIImage {
        UIImage(named: "tb_seg_anim_crazy_selected") ?? UIImage()
    }
    
    static var segmentEditModeDragTangentsSelectedDown: UIImage {
        UIImage(named: "tb_seg_anim_bulge_bouncer_selected") ?? UIImage()
    }
    
    
    
    
    
    static var segmentEditModeWeightUnselectedUp: UIImage {
        UIImage(named: "tb_seg_edit_weight") ?? UIImage()
    }
    
    static var segmentEditModeWeightUnselectedDown: UIImage {
        UIImage(named: "tb_seg_anim_bulge_bouncer_selected") ?? UIImage()
    }
    
    static var segmentEditModeWeightSelectedUp: UIImage {
        UIImage(named: "tb_seg_edit_weight_selected") ?? UIImage()
    }
    
    static var segmentEditModeWeightSelectedDown: UIImage {
        UIImage(named: "tb_seg_anim_bulge_bouncer_selected") ?? UIImage()
    }
    
}
