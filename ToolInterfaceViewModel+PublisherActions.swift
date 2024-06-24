//
//  ToolInterfaceViewModel+PublisherActions.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/27/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func handleSelectedJiggleDidChange() {
        if Device.isPad {
            for row in rowsDraggable { handleSelectedJiggleDidChange(row: row) }
        } else {
            for row in rowsTop { handleSelectedJiggleDidChange(row: row) }
            for row in rowsBottom { handleSelectedJiggleDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleSelectedJiggleDidChange(row: row) }
    }
    
    func handleSelectedJiggleDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .sliderJigglePower {
                node.magicalViewModel.refresh()
            }
            if node.element == .sliderJiggleSpeed {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handleZoomEnabledDidChange() {
        adaptAllRows()
        if Device.isPad {
            for row in rowsDraggable { handleZoomEnabledDidChange(row: row) }
        } else {
            for row in rowsTop { handleZoomEnabledDidChange(row: row) }
            for row in rowsBottom { handleZoomEnabledDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleZoomEnabledDidChange(row: row) }
    }
    
    func handleZoomEnabledDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .checkBoxZoomEnabled {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handleResetZoomActiveDidChange() {
        if Device.isPad {
            for row in rowsDraggable { handleResetZoomActiveDidChange(row: row) }
        } else {
            for row in rowsTop { handleResetZoomActiveDidChange(row: row) }
            for row in rowsBottom { handleResetZoomActiveDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleResetZoomActiveDidChange(row: row) }
    }
    
    func handleResetZoomActiveDidChange(row: ToolRow) {
        for node in row.nodes {
            //if node.element == .OLDcheckBoxZoomEnabled {
            //    node.magicalViewModel.refresh()
            //}
        }
    }
    
    func handleWeightCurveGraphEnabledDidChange() {
        if Device.isPad {
            for row in rowsDraggable { handleWeightCurveGraphEnabledDidChange(row: row) }
        } else {
            for row in rowsTop { handleWeightCurveGraphEnabledDidChange(row: row) }
            for row in rowsBottom { handleWeightCurveGraphEnabledDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleWeightCurveGraphEnabledDidChange(row: row) }
    }
    
    func handleWeightCurveGraphEnabledDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .checkBoxWeightCurveGraphEnabled {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handleCreateJiggleStandardDidChange() {
        print("handleCreateJiggleStandardDidChange")
        if Device.isPad {
            for row in rowsDraggable { handleCreateJiggleStandardDidChange(row: row) }
        } else {
            for row in rowsTop { handleCreateJiggleStandardDidChange(row: row) }
            for row in rowsBottom { handleCreateJiggleStandardDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleCreateJiggleStandardDidChange(row: row) }
    }
    
    func handleCreateJiggleStandardDidChange(row: ToolRow) {
        for node in row.nodes {
            node.magicalViewModel.refresh()
        }
    }
    
    func handleJigglesDidChange() {
        print("handleCreateJiggleDrawingDidChange")
        if Device.isPad {
            for row in rowsDraggable { handleJigglesDidChange(row: row) }
        } else {
            for row in rowsTop { handleJigglesDidChange(row: row) }
            for row in rowsBottom { handleJigglesDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleJigglesDidChange(row: row) }
    }
    
    func handleJigglesDidChange(row: ToolRow) {
        for node in row.nodes {
            node.magicalViewModel.refresh()
        }
    }
    
    func handleCreateJiggleDrawingDidChange() {
        print("handleCreateJiggleDrawingDidChange")
        if Device.isPad {
            for row in rowsDraggable { handleCreateJiggleDrawingDidChange(row: row) }
        } else {
            for row in rowsTop { handleCreateJiggleDrawingDidChange(row: row) }
            for row in rowsBottom { handleCreateJiggleDrawingDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleCreateJiggleDrawingDidChange(row: row) }
    }
    
    func handleCreateJiggleDrawingDidChange(row: ToolRow) {
        for node in row.nodes {
            node.magicalViewModel.refresh()
        }
    }
    
    func handleCreatePointsDidChange() {
        print("handleCreatePointsDidChange")
        if Device.isPad {
            for row in rowsDraggable { handleCreatePointsDidChange(row: row) }
        } else {
            for row in rowsTop { handleCreatePointsDidChange(row: row) }
            for row in rowsBottom { handleCreatePointsDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleCreatePointsDidChange(row: row) }
    }
        
    func handleCreatePointsDidChange(row: ToolRow) {
        for node in row.nodes {
            node.magicalViewModel.refresh()
        }
    }
    
    func handleRemovePointsDidChange() {
        print("handleRemovePointsDidChange")
        if Device.isPad {
            for row in rowsDraggable { handleRemovePointsDidChange(row: row) }
        } else {
            for row in rowsTop { handleRemovePointsDidChange(row: row) }
            for row in rowsBottom { handleRemovePointsDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleRemovePointsDidChange(row: row) }
    }

    func handleRemovePointsDidChange(row: ToolRow) {
        for node in row.nodes {
            node.magicalViewModel.refresh()
        }
    }
    
    func handleCreateWeightRingsStandardDidChange() {
        print("handleCreateWeightRingsStandardDidChange")
        if Device.isPad {
            for row in rowsDraggable { handleCreateWeightRingsStandardDidChange(row: row) }
        } else {
            for row in rowsTop { handleCreateWeightRingsStandardDidChange(row: row) }
            for row in rowsBottom { handleCreateWeightRingsStandardDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleCreateWeightRingsStandardDidChange(row: row) }
    }
            
    func handleCreateWeightRingsStandardDidChange(row: ToolRow) {
        for node in row.nodes {
            node.magicalViewModel.refresh()
        }
    }
    
    func handleCreateWeightRingsDrawingDidChange() {
        print("handleCreateWeightRingsDrawingDidChange")
        if Device.isPad {
            for row in rowsDraggable { handleCreateWeightRingsDrawingDidChange(row: row) }
        } else {
            for row in rowsTop { handleCreateWeightRingsDrawingDidChange(row: row) }
            for row in rowsBottom { handleCreateWeightRingsDrawingDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleCreateWeightRingsDrawingDidChange(row: row) }
    }
            
    func handleCreateWeightRingsDrawingDidChange(row: ToolRow) {
        for node in row.nodes {
            node.magicalViewModel.refresh()
        }
    }
    
    func handleCreateWeightRingPointsDidChange() {
        print("handleCreateWeightRingPointsDidChange")
        if Device.isPad {
            for row in rowsDraggable { handleCreateWeightRingPointsDidChange(row: row) }
        } else {
            for row in rowsTop { handleCreateWeightRingPointsDidChange(row: row) }
            for row in rowsBottom { handleCreateWeightRingPointsDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleCreateWeightRingPointsDidChange(row: row) }
    }
            
    func handleCreateWeightRingPointsDidChange(row: ToolRow) {
        for node in row.nodes {
            node.magicalViewModel.refresh()
        }
    }
    
    func handleRemoveWeightRingPointsDidChange() {
        print("handleRemoveWeightRingPointsDidChange")
        if Device.isPad {
            for row in rowsDraggable { handleRemoveWeightRingPointsDidChange(row: row) }
        } else {
            for row in rowsTop { handleRemoveWeightRingPointsDidChange(row: row) }
            for row in rowsBottom { handleRemoveWeightRingPointsDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleRemoveWeightRingPointsDidChange(row: row) }
    }
            
    func handleRemoveWeightRingPointsDidChange(row: ToolRow) {
        for node in row.nodes {
            node.magicalViewModel.refresh()
        }
    }
    
    func handleDocumentModeDidChange() {
        if Device.isPad {
            for row in rowsDraggable { handleDocumentModeDidChange(row: row) }
        } else {
            for row in rowsTop { handleDocumentModeDidChange(row: row) }
            for row in rowsBottom { handleDocumentModeDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleDocumentModeDidChange(row: row) }
    }
    
    func handleDocumentModeDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .segmentDocumentMode {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handleWeightDisplayModeDidChange() {
        adaptAllRows()
        if Device.isPad {
            for row in rowsDraggable { handleWeightDisplayModeDidChange(row: row) }
        } else {
            for row in rowsTop { handleWeightDisplayModeDidChange(row: row) }
            for row in rowsBottom { handleWeightDisplayModeDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleWeightDisplayModeDidChange(row: row) }
    }
    
    func handleWeightDisplayModeDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .segmentDisplayMode {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handlePointCreateModeDidChange() {
        if Device.isPad {
            for row in rowsDraggable { handlePointCreateModeDidChange(row: row) }
        } else {
            for row in rowsTop { handlePointCreateModeDidChange(row: row) }
            for row in rowsBottom { handlePointCreateModeDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handlePointCreateModeDidChange(row: row) }
    }
    
    func handlePointCreateModeDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .segmentPointCreateMode {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handleAnimationModeDidChange() {
        adaptAllRows()
        if Device.isPad {
            for row in rowsDraggable { handleAnimationModeDidChange(row: row) }
        } else {
            for row in rowsTop { handleAnimationModeDidChange(row: row) }
            for row in rowsBottom { handleAnimationModeDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleAnimationModeDidChange(row: row) }
    }
    
    func handleAnimationModeDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .segmentAnimationMode {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handleWeightPointCreateModeDidChange() {
        if Device.isPad {
            for row in rowsDraggable { handleWeightPointCreateModeDidChange(row: row) }
        } else {
            for row in rowsTop { handleWeightPointCreateModeDidChange(row: row) }
            for row in rowsBottom { handleWeightPointCreateModeDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleWeightPointCreateModeDidChange(row: row) }
    }
    
    func handleWeightPointCreateModeDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .segmentWeightPointCreateMode {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handlePointModeDidChange() {
        if Device.isPad {
            for row in rowsDraggable { handlePointModeDidChange(row: row) }
        } else {
            for row in rowsTop { handlePointModeDidChange(row: row) }
            for row in rowsBottom { handlePointModeDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handlePointModeDidChange(row: row) }
    }
    
    func handlePointModeDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .segmentPointMode {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handleWeightPointModeDidChange() {
        if Device.isPad {
            for row in rowsDraggable { handleWeightPointModeDidChange(row: row) }
        } else {
            for row in rowsTop { handleWeightPointModeDidChange(row: row) }
            for row in rowsBottom { handleWeightPointModeDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleWeightPointModeDidChange(row: row) }
    }
    
    func handleWeightPointModeDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .segmentWeightPointMode {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handleWeightModeDidChange() {
        adaptAllRows()
        if Device.isPad {
            for row in rowsDraggable { handleWeightModeDidChange(row: row) }
        } else {
            for row in rowsTop { handleWeightModeDidChange(row: row) }
            for row in rowsBottom { handleWeightModeDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleWeightModeDidChange(row: row) }
    }
    
    func handleWeightModeDidChange(row: ToolRow) {
        
        for node in row.nodes {
            if node.element == .segmentWeightMode {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    
    func handleUndoRedoDidChange() {
        if Device.isPad {
            for row in rowsDraggable { handleUndoRedoDidChange(row: row) }
        } else {
            for row in rowsTop { handleUndoRedoDidChange(row: row) }
            for row in rowsBottom { handleUndoRedoDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleUndoRedoDidChange(row: row) }
    }
    
    func handleUndoRedoDidChange(row: ToolRow) {
        for node in row.nodes {
            if (node.element == .textIconButtonUndo) || (node.element == .textIconButtonRedo) {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handleDarkModeDidChange() {
        print("handleDarkModeDidChange")
        if Device.isPad {
            for row in rowsDraggable { handleDarkModeDidChange(row: row) }
        } else {
            for row in rowsTop { handleDarkModeDidChange(row: row) }
            for row in rowsBottom { handleDarkModeDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleDarkModeDidChange(row: row) }
    }
    
    func handleDarkModeDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .checkBoxDarkModeEnabled {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handleSwivelOrbitDidChange() {
        print("handleSwivelOrbitDidChange")
        if Device.isPad {
            for row in rowsDraggable { handleSwivelOrbitDidChange(row: row) }
        } else {
            for row in rowsTop { handleSwivelOrbitDidChange(row: row) }
            for row in rowsBottom { handleSwivelOrbitDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleSwivelOrbitDidChange(row: row) }
    }
    
    func handleSwivelOrbitDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .checkBoxSwivelOrbitEnabled {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    
    func handleStereoscopicDidChange() {
        print("handleStereoscopicDidChange")
        if Device.isPad {
            for row in rowsDraggable { handleStereoscopicDidChange(row: row) }
        } else {
            for row in rowsTop { handleStereoscopicDidChange(row: row) }
            for row in rowsBottom { handleStereoscopicDidChange(row: row) }
        }
        for row in rowsGraphSideMenu { handleStereoscopicDidChange(row: row) }
    }
    
    func handleStereoscopicDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .checkBoxStereoscopicEnabled {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handleExecuteStoredTransitions() {
        print("handleStereoscopicDidChange")
        
        adaptAllRows()
    }
}
