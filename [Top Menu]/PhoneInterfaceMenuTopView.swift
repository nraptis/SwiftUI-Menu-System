//
//  PhoneInterfaceMenuTopView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/11/23.
//

import UIKit

class PhoneInterfaceMenuTopView: UIView {
    
    private(set) var toolRowViews = [ToolRowView]()
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    let orientation: Orientation
    required init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        self.orientation = toolInterfaceViewModel.orientation
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        var layoutY = CGFloat(0.0)
        
        let spacingBottom = ToolInterfaceTheme.getTopMenuSpacingBottom(orientation: orientation)
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSpacing = ToolInterfaceTheme.getTopMenuRowSpacing(orientation: orientation)
        let rowCount = toolInterfaceViewModel.rowsTop.count
        
        let height = ToolInterfaceTheme.getTopMenuHeight(orientation: toolInterfaceViewModel.orientation, rowCount: rowCount)
        addConstraint(NSLayoutConstraint(item: self,
                                         attribute: .height,
                                         relatedBy: .equal,
                                         toItem: nil, 
                                         attribute: .notAnAttribute,
                                         multiplier: 1.0,
                                         constant: CGFloat(height)))
        
        layoutY -= CGFloat(spacingBottom)
        
        var rowIndex = rowCount - 1
        while rowIndex >= 0 {
            
            let toolRow = toolInterfaceViewModel.rowsTop[rowIndex]
            let toolRowView = ToolRowView(toolInterfaceViewModel: toolInterfaceViewModel,
                                          toolRow: toolRow,
                                          toolRowLocation: .top,
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
                                   attribute: .bottom,
                                   relatedBy: .equal,
                                   toItem: self,
                                   attribute: .bottom,
                                   multiplier: 1.0,
                                   constant: layoutY),
            ])
            
            toolRowViews.append(toolRowView)
            
            layoutY -= CGFloat(rowSpacing)
            layoutY -= CGFloat(rowHeight)
            
            rowIndex -= 1
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
