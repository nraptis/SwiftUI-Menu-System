//
//  PhoneInterfaceMenuBottomBackingView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/11/23.
//

import UIKit

class PhoneInterfaceMenuBottomBackingView: UIView {

    let toolInterfaceViewModel: ToolInterfaceViewModel
    let orientation: Orientation
    required init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        self.orientation = toolInterfaceViewModel.orientation
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        var layoutY = CGFloat(0.0)
        let spacingTop = ToolInterfaceTheme.getBottomMenuSpacingTop(orientation: orientation)
        let spacingBottom = ToolInterfaceTheme.getBottomMenuSpacingBottom(orientation: orientation)
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSpacing = ToolInterfaceTheme.getBottomMenuRowSpacing(orientation: orientation)
        let rowCount = toolInterfaceViewModel.rowsBottom.count
        let rowCount1 = rowCount - 1
        
        backgroundColor = UIColor.red
        
        let shadowView = UIImageView(image: ToolInterfaceTheme.shadowImageUp)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        
        let shadowHeight = ToolInterfaceTheme.getBottomMenuShadowHeight(orientation: orientation)
        shadowView.addConstraints([
            NSLayoutConstraint(item: shadowView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: CGFloat(shadowHeight))
        ])
        
        addSubview(shadowView)
        addConstraints([
            NSLayoutConstraint(item: shadowView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: shadowView,
                               attribute: .left,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .left,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: shadowView,
                               attribute: .right,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .right,
                               multiplier: 1.0,
                               constant: 0.0)
        ])
        
        let topSpacerView = UIView(frame: .zero)
        topSpacerView.translatesAutoresizingMaskIntoConstraints = false
        topSpacerView.backgroundColor = UIColor.yellow
        topSpacerView.addConstraints([
            NSLayoutConstraint(item: topSpacerView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: CGFloat(spacingTop))
        ])
        addSubview(topSpacerView)
        addConstraints([
            NSLayoutConstraint(item: topSpacerView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: topSpacerView,
                               attribute: .left,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .left,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: topSpacerView,
                               attribute: .right,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .right,
                               multiplier: 1.0,
                               constant: 0.0)
        ])
        
        layoutY += CGFloat(spacingTop)
        
        
        
        var rowIndex = 0
        while rowIndex < rowCount {
            
            if rowIndex < rowCount1 {
                
                layoutY += CGFloat(rowHeight)
                
                let rowSpacerView = UIView(frame: .zero)
                rowSpacerView.translatesAutoresizingMaskIntoConstraints = false
                rowSpacerView.backgroundColor = UIColor.green
                
                rowSpacerView.addConstraints([
                    NSLayoutConstraint(item: rowSpacerView,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1.0,
                                       constant: CGFloat(rowSpacing))
                ])
                addSubview(rowSpacerView)
                addConstraints([
                    NSLayoutConstraint(item: rowSpacerView,
                                       attribute: .top,
                                       relatedBy: .equal,
                                       toItem: self,
                                       attribute: .top,
                                       multiplier: 1.0,
                                       constant: layoutY),
                    NSLayoutConstraint(item: rowSpacerView,
                                       attribute: .left,
                                       relatedBy: .equal,
                                       toItem: self,
                                       attribute: .left,
                                       multiplier: 1.0,
                                       constant: 0.0),
                    NSLayoutConstraint(item: rowSpacerView,
                                       attribute: .right,
                                       relatedBy: .equal,
                                       toItem: self,
                                       attribute: .right,
                                       multiplier: 1.0,
                                       constant: 0.0)
                ])
                
                layoutY += CGFloat(rowSpacing)
            } else {
                layoutY += CGFloat(rowHeight)
            }
            
            rowIndex += 1
        }

        let bottomSpacerView = UIView(frame: .zero)
        bottomSpacerView.translatesAutoresizingMaskIntoConstraints = false
        bottomSpacerView.backgroundColor = UIColor.blue
        
        bottomSpacerView.addConstraints([
            NSLayoutConstraint(item: bottomSpacerView,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .notAnAttribute,
                               multiplier: 1.0,
                               constant: CGFloat(spacingBottom))
        ])
        addSubview(bottomSpacerView)
        addConstraints([
            NSLayoutConstraint(item: bottomSpacerView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: layoutY),
            NSLayoutConstraint(item: bottomSpacerView,
                               attribute: .left,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .left,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: bottomSpacerView,
                               attribute: .right,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .right,
                               multiplier: 1.0,
                               constant: 0.0)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
