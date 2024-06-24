//
//  ToolRowView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/18/24.
//

import SwiftUI

struct ToolRowViewContent: View {
    
    enum WidthSource {
        case standard
        case graphSideMenu
    }
    
    @Environment(ToolInterfaceViewModel.self) var toolInterfaceViewModel: ToolInterfaceViewModel
    
    let toolRow: ToolRow
    let height: Int
    let widthSource: WidthSource
    let orientation: Orientation
    init(toolRow: ToolRow,
         widthSource: WidthSource,
         height: Int,
         orientation: Orientation) {
        self.toolRow = toolRow
        self.widthSource = widthSource
        self.height = height
        self.orientation = orientation
    }
    
    var body: some View {
        
        var width: Int
        switch widthSource {
        case .standard:
            width = toolInterfaceViewModel.rowWidth
        case .graphSideMenu:
            width = ToolInterfaceTheme.getGraphSideMenuWidth(orientation: orientation)
            width -= ToolInterfaceTheme.getGraphSideMenuInsetLeft(orientation: orientation)
            width -= ToolInterfaceTheme.getGraphSideMenuInsetRight(orientation: orientation)
        }
        
        return
        ZStack {
            GeometryReader { _ in
                ForEach(toolRow.nodes) { toolNode in
                    getItemForElement(toolNode, toolNode.element)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12.0).stroke(style: StrokeStyle(lineWidth: 4.0)).foregroundStyle(toolNode.isCenterPinned ? Color.red : Color.blue.opacity(0.25))
                                .offset(x: CGFloat(toolNode.layoutX)))
                }
            }
            HStack {
                Spacer()
                VStack {
                    
                }
                .frame(width: 4.0, height: 36.0)
                .overlay(Rectangle().foregroundStyle(Color.yellow))
                Spacer()
            }
        }
        .frame(width: CGFloat(width),
               height: CGFloat(height))
        .background(ToolInterfaceTheme.toolbarBackground)
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
        
        if toolNode.element.type == .slider {
            MagicalSlider()
                .environment((toolNode.magicalViewModel as! MagicalSliderViewModel))
        }
        
        if toolNode.element.type == .textIconButton {
            MagicalTextIconButton()
                .environment((toolNode.magicalViewModel as! MagicalTextIconButtonViewModel))
        }
        
        if toolNode.element.type == .iconButton {
            MagicalIconButton()
                .environment((toolNode.magicalViewModel as! MagicalIconButtonViewModel))
        }
        
        if toolNode.element.type == .checkBox {
            MagicalCheckBox()
                .environment((toolNode.magicalViewModel as! MagicalCheckBoxViewModel))
        }
        
        if toolNode.element.type == .segment {
            MagicalSegmentedPickerPrimary()
                .environment((toolNode.magicalViewModel as! MagicalSegmentedPickerViewModel))
        }
    }
}
