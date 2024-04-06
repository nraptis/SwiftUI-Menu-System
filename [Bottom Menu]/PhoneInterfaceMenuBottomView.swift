//
//  PhoneInterfaceMenuBottomView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/11/23.
//

import UIKit

class PhoneInterfaceMenuBottomView: UIView {
    
    private(set) var toolRowViews = [ToolRowView]()
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    let orientation: Orientation
    required init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        self.orientation = toolInterfaceViewModel.orientation
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        var layoutY = CGFloat(0.0)
        let spacingTop = ToolInterfaceTheme.getBottomMenuSpacingTop(orientation: orientation)
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSpacing = ToolInterfaceTheme.getBottomMenuRowSpacing(orientation: orientation)
        let rowCount = toolInterfaceViewModel.rowsBottom.count
        
        let height = ToolInterfaceTheme.getBottomMenuHeight(orientation: toolInterfaceViewModel.orientation, rowCount: rowCount)
        addConstraint(NSLayoutConstraint(item: self,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: nil,
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: CGFloat(height)))
        
        
        layoutY += CGFloat(spacingTop)
        
        var rowIndex = 0
        while rowIndex < rowCount {
            
            let toolRow = toolInterfaceViewModel.rowsBottom[rowIndex]
            let toolRowView = ToolRowView(toolInterfaceViewModel: toolInterfaceViewModel,
                                          toolRow: toolRow,
                                          toolRowLocation: .bottom,
                                          orientation: orientation)
            
            addSubview(toolRowView)
            
            let widthConstraint = toolRow.getWidthConstraint(toolRowView)
            widthConstraint.constant = 320.0
            
            toolRowView.addConstraints([
                widthConstraint,
                NSLayoutConstraint(item: toolRowView,
                                   attribute: .height,
                                   relatedBy: .equal,
                                   toItem: nil,
                                   attribute: .notAnAttribute,
                                   multiplier: 1.0,
                                   constant: CGFloat(rowHeight))
            ])
            
            addConstraints([
                NSLayoutConstraint(item: toolRowView,
                                   attribute: .left,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .left,
                                   multiplier: 1.0,
                                   constant: 0.0),
                NSLayoutConstraint(item: toolRowView,
                                   attribute: .top,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .top,
                                   multiplier: 1.0,
                                   constant: layoutY),
            ])
            
            toolRowViews.append(toolRowView)
            
            layoutY += CGFloat(rowSpacing)
            layoutY += CGFloat(rowHeight)
            
            rowIndex += 1
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
