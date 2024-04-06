//
//  PhoneInterfaceMenuTopBackingView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/11/23.
//

import UIKit

class PhoneInterfaceMenuTopBackingView: UIView {

    let toolInterfaceViewModel: ToolInterfaceViewModel
    let orientation: Orientation
    required init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        self.orientation = toolInterfaceViewModel.orientation
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = UIColor.red
        
        let shadowView = UIImageView(image: ToolInterfaceTheme.shadowImageDown)
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        let shadowHeight = ToolInterfaceTheme.getTopMenuShadowHeight(orientation: orientation)
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
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .bottom,
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
        
        
        var layoutY = CGFloat(0.0)
        let spacingTop = ToolInterfaceTheme.getTopMenuSpacingTop(orientation: orientation)
        let spacingBottom = ToolInterfaceTheme.getTopMenuSpacingBottom(orientation: orientation)
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSpacing = ToolInterfaceTheme.getTopMenuRowSpacing(orientation: orientation)
        let rowCount = toolInterfaceViewModel.rowsTop.count
        let rowCount1 = rowCount - 1
        
        
        let bottomSpacerView = UIView(frame: .zero)
        bottomSpacerView.translatesAutoresizingMaskIntoConstraints = false
        bottomSpacerView.backgroundColor = UIColor(red: 0.76, green: 1.0, blue: 0.25, alpha: 1.0)
        
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
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0.0),
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
        
        layoutY -= CGFloat(spacingBottom)
        
        var rowIndex = 0
        while rowIndex < rowCount {
            
            if rowIndex < rowCount1 {
                
                layoutY -= CGFloat(rowHeight)
                
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
                                       attribute: .bottom,
                                       relatedBy: .equal,
                                       toItem: self,
                                       attribute: .bottom,
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
                
                layoutY -= CGFloat(rowSpacing)
            } else {
                layoutY -= CGFloat(rowHeight)
            }
            
            rowIndex += 1
        }
        
        
        
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
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: layoutY),
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
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
