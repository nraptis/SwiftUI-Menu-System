//
//  ToolRowView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/18/24.
//

import SwiftUI

struct ToolRowViewContent: View {
    
    @Environment(ToolInterfaceViewModel.self) var toolInterfaceViewModel: ToolInterfaceViewModel
    
    let toolRow: ToolRow
    let height: Int
    
    init(toolRow: ToolRow, 
         height: Int) {
        self.toolRow = toolRow
        self.height = height
    }
    
    var body: some View {
        return GeometryReader { _ in
            ForEach(toolRow.nodes) { toolNode in
                getItemForElement(toolNode, toolNode.element)
            }
        }
        .frame(width: CGFloat(toolInterfaceViewModel.rowWidth),
               height: CGFloat(height))
        .background(Color("toolbar_primary_back"))
    }
    
    @ViewBuilder
    func getItemForElement(_ toolNode: ToolNode, _ toolInterfaceElement: ToolInterfaceElement) -> some View {
        
        if toolInterfaceElement == .divider {
            MagicalDivider()
                .environment((toolNode.magicalViewModel as! MagicalDividerViewModel))
        }
        
        if toolNode.element == .dividerSpacerDivider {
            MagicalDividerSpacerDivider()
                .environment((toolNode.magicalViewModel as! MagicalDividerSpacerDividerViewModel))
        }
        
        if toolNode.element == .sliderJiggleSpeedAmount {
            MagicalSlider()
                .environment((toolNode.magicalViewModel as! MagicalSliderViewModel))
        }
        
        if toolNode.element == .sliderJigglePowerAmount {
            MagicalSlider()
                .environment((toolNode.magicalViewModel as! MagicalSliderViewModel))
        }
        
        if toolNode.element == .buttonMainMenu {
            MagicalTextIconButton()
                .environment((toolNode.magicalViewModel as! MagicalTextIconButtonViewModel))
        }
        
        if toolNode.element == .buttonPointBreakTangent {
            MagicalTextIconButton()
                .environment((toolNode.magicalViewModel as! MagicalTextIconButtonViewModel))
        }
        
        if toolNode.element == .buttonZoomReset {
            MagicalTextIconButton()
                .environment((toolNode.magicalViewModel as! MagicalTextIconButtonViewModel))
        }
        
        if toolNode.element == .segmentDocumentMode {
            MagicalSegmentedPickerPrimary()
                .environment((toolNode.magicalViewModel as! MagicalSegmentedPickerViewModel))
        }
        
        if toolNode.element == .segmentEditMode {
            MagicalSegmentedPickerPrimary()
                .environment((toolNode.magicalViewModel as! MagicalSegmentedPickerViewModel))
        }
        
        if toolNode.element == .checkBoxStereoscopic3DEnabled {
            MagicalCheckBox()
                .environment((toolNode.magicalViewModel as! MagicalCheckBoxViewModel))
        }
        
        if toolNode.element == .checkBoxZoomEnabled {
            MagicalCheckBox()
                .environment((toolNode.magicalViewModel as! MagicalCheckBoxViewModel))
        }
        
        if toolNode.element == .buttonPhoneCollapseTop {
            MagicalIconButton()
                .environment((toolNode.magicalViewModel as! MagicalIconButtonViewModel))
        }
        
        if toolNode.element == .buttonPhoneCollapseBottom {
            MagicalIconButton()
                .environment((toolNode.magicalViewModel as! MagicalIconButtonViewModel))
        }
    }
}
