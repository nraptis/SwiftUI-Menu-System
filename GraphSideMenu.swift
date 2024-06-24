//
//  GraphSideMenu.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/4/24.
//

import UIKit

class GraphSideMenu: UIView {
    
    lazy var rowsContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.clipsToBounds = true
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var leftButtressView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var rightButtressView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var separatorBottomGraph: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorInnerEdge
        return result
    }()
    
    lazy var separator1: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorMiddle
        return result
    }()
    
    lazy var separator2: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorMiddle
        return result
    }()
    
    lazy var separator3: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorMiddle
        return result
    }()
    
    lazy var separator4: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorMiddle
        return result
    }()
    
    lazy var separator5: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorMiddle
        return result
    }()
    
    let width: Int
    let insetLeft: Int
    let insetRight: Int
    
    let rowSeparatorHeight: Int
    let rowSeparatorHeightTop: Int
    let rowSeparatorHeightBottom: Int
    
    private(set) var toolRowViews = [ToolRowView]()
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    let orientation: Orientation
    required init(toolInterfaceViewModel: ToolInterfaceViewModel,
                  width: Int, insetLeft: Int, insetRight: Int,
                  rowSeparatorHeight: Int,
                  rowSeparatorHeightTop: Int,
                  rowSeparatorHeightBottom: Int) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        self.orientation = toolInterfaceViewModel.orientation
        self.width = width
        self.insetLeft = insetLeft
        self.insetRight = insetRight
        self.rowSeparatorHeight = rowSeparatorHeight
        self.rowSeparatorHeightTop = rowSeparatorHeightTop
        self.rowSeparatorHeightBottom = rowSeparatorHeightBottom
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        
        let rowCount: Int
        
        if Device.isPhone {
            rowCount = ToolInterfaceTheme.getTopMenuGraphAreaRowCount(orientation: orientation)
        } else {
            rowCount = ToolInterfaceTheme.getDraggableGraphAreaRowCount()
        }
        
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight: Int
        if Device.isPad {
            rowSeparatorHeight = ToolInterfaceTheme.getDraggableRowSeparatorHeight(orientation: orientation)
        } else {
            rowSeparatorHeight = ToolInterfaceTheme.getStationaryRowSeparatorHeight(orientation: orientation)
        }
        
        //let rowSeparatorHeightTop = ToolInterfaceTheme.getTopRowSeparatorHeightTop(orientation: orientation)
        //let rowSeparatorHeightBottom = ToolInterfaceTheme.getTopRowSeparatorHeightBottom(orientation: orientation)
        
        addSubview(leftButtressView)
        addConstraints([
            NSLayoutConstraint(item: leftButtressView, attribute: .left, relatedBy: .equal, toItem: self,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: leftButtressView, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(insetLeft)),
            NSLayoutConstraint(item: leftButtressView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 512.0),
            NSLayoutConstraint(item: leftButtressView, attribute: .bottom, relatedBy: .equal, toItem: self,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        addSubview(rightButtressView)
        addConstraints([
            NSLayoutConstraint(item: rightButtressView, attribute: .right, relatedBy: .equal, toItem: self,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: rightButtressView, attribute: .width, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(insetRight)),
            NSLayoutConstraint(item: rightButtressView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 512.0),
            NSLayoutConstraint(item: rightButtressView, attribute: .bottom, relatedBy: .equal, toItem: self,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        addSubview(rowsContainerView)
        addConstraints([
            NSLayoutConstraint(item: rowsContainerView, attribute: .left, relatedBy: .equal, toItem: self,
                               attribute: .left, multiplier: 1.0, constant: CGFloat(insetLeft)),
            NSLayoutConstraint(item: rowsContainerView, attribute: .right, relatedBy: .equal, toItem: self,
                               attribute: .right, multiplier: 1.0, constant: CGFloat(-insetRight)),
            NSLayoutConstraint(item: rowsContainerView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 512.0),
            NSLayoutConstraint(item: rowsContainerView, attribute: .bottom, relatedBy: .equal, toItem: self,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        let sideMenuWidth = ToolInterfaceTheme.getGraphSideMenuWidth(orientation: orientation) - (insetLeft + insetRight)
        
        var layoutY = 0
        var rowIndex = rowCount - 1
        while rowIndex >= 0 {
            
            if rowIndex < toolInterfaceViewModel.rowsGraphSideMenu.count {
                let toolRow = toolInterfaceViewModel.rowsGraphSideMenu[rowIndex]
                let toolRowView = ToolRowView(toolInterfaceViewModel: toolInterfaceViewModel,
                                              toolRow: toolRow,
                                              toolRowLocation: .draggable,
                                              widthSource: .graphSideMenu,
                                              orientation: orientation)
                
                rowsContainerView.addSubview(toolRowView)
                
                
                 
                let widthConstraint = toolRow.getWidthConstraint(toolRowView)
                widthConstraint.constant = CGFloat(sideMenuWidth)
                
                toolRowView.addConstraints([
                    widthConstraint,
                    
                    NSLayoutConstraint(item: toolRowView, attribute: .height, relatedBy: .equal,
                                       toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                       constant: CGFloat(rowHeight))
                ])
                
                rowsContainerView.addConstraints([
                    NSLayoutConstraint(item: toolRowView, attribute: .left, relatedBy: .equal,
                                       toItem: rowsContainerView, attribute: .left, multiplier: 1.0,
                                       constant: 0.0),
                    NSLayoutConstraint(item: toolRowView, attribute: .bottom, relatedBy: .equal,
                                       toItem: rowsContainerView, attribute: .bottom, multiplier: 1.0,
                                       constant: CGFloat(layoutY)),
                ])
                
                toolRowViews.append(toolRowView)
                
                toolRow.layout(width: sideMenuWidth, height: rowHeight,
                               layoutStackingCategory: .large(.init(isSegmentLong: false,
                                                                    isCheckBoxLong: false,
                                                                    isTextIconButtonLong: false)), sliderLayoutSchemeFlavor: .long)
            }
            
            layoutY -= rowHeight
            
            if rowIndex != 0 {
                if let separatorView = getSeparator(at: rowIndex + 1) {
                    rowsContainerView.addSubview(separatorView)
                    rowsContainerView.addConstraints([
                        NSLayoutConstraint(item: separatorView, attribute: .left, relatedBy: .equal,
                                           toItem: rowsContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: separatorView, attribute: .right, relatedBy: .equal,
                                           toItem: rowsContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: separatorView, attribute: .bottom, relatedBy: .equal,
                                           toItem: rowsContainerView, attribute: .bottom, multiplier: 1.0,
                                           constant: CGFloat(layoutY)),
                    ])
                    separatorView.addConstraint(NSLayoutConstraint(item: separatorView, attribute: .height, relatedBy: .equal,
                                                                   toItem: nil, attribute: .notAnAttribute,
                                                                   multiplier: 1.0, constant: CGFloat(rowSeparatorHeight)))
                }
                
                layoutY -= rowSeparatorHeight
            }
            rowIndex -= 1
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func getSeparator(at index: Int) -> UIView? {
        if index == 1 { return separator1 }
        if index == 2 { return separator2 }
        if index == 3 { return separator3 }
        if index == 4 { return separator4 }
        if index == 5 { return separator5 }
        return nil
    }
}

