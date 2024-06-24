//
//  PhoneInterfaceMenuBottomView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/11/23.
//

import UIKit

class PhoneInterfaceMenuBottomView: UIView {
    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var rowsContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var separatorTop: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorOuterEdge
        return result
    }()
    
    lazy var separatorBottom: UIView = {
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
    
    lazy var shadowLayer: CAGradientLayer = {
        let result = CAGradientLayer()
        result.colors = [ToolInterfaceTheme._shadowOuter.cgColor,
                         ToolInterfaceTheme._shadowMiddle.cgColor,
                         ToolInterfaceTheme._shadowInner.cgColor]
        result.startPoint = CGPointMake(0.5, 0.0)
        result.endPoint = CGPointMake(0.5, 1.0)
        return result
    }()
    
    lazy var shadowView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.layer.addSublayer(shadowLayer)
        return result
    }()
    
    func layoutShadow() {
        shadowLayer.frame = shadowView.bounds
    }
    
    private(set) var toolRowViews = [ToolRowView]()
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    let orientation: Orientation
    required init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        self.orientation = toolInterfaceViewModel.orientation
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerView)
        addConstraints([
            NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: self,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .right, relatedBy: .equal, toItem: self,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 512.0),
            NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal, toItem: self,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        let shadowHeight = ToolInterfaceTheme.getBottomMenuShadowHeight(orientation: orientation)
        
        addSubview(shadowView)
        addConstraints([
            NSLayoutConstraint(item: shadowView, attribute: .left, relatedBy: .equal, toItem: self,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: shadowView, attribute: .right, relatedBy: .equal, toItem: self,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: shadowView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(shadowHeight)),
            NSLayoutConstraint(item: shadowView, attribute: .bottom, relatedBy: .equal, toItem: self,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
        ])
        
        let rowCount = ToolInterfaceTheme.getBottomMenuRowCount(orientation: orientation)
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getStationaryRowSeparatorHeight(orientation: orientation)
        let rowSeparatorHeightTop = ToolInterfaceTheme.getBottomRowSeparatorHeightTop(orientation: orientation)
        let rowSeparatorHeightBottom = ToolInterfaceTheme.getBottomRowSeparatorHeightBottom(orientation: orientation)
        
        containerView.addSubview(separatorTop)
        containerView.addConstraints([
            NSLayoutConstraint(item: separatorTop, attribute: .left, relatedBy: .equal,
                               toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTop, attribute: .right, relatedBy: .equal,
                               toItem: containerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTop, attribute: .top, relatedBy: .equal,
                               toItem: containerView, attribute: .top, multiplier: 1.0, constant: CGFloat(0.0)),
        ])
        separatorTop.addConstraint(NSLayoutConstraint(item: separatorTop, attribute: .height, relatedBy: .equal, toItem: nil,
                                                         attribute: .notAnAttribute, multiplier: 1.0,
                                                         constant: CGFloat(rowSeparatorHeightTop)))
        
        var layoutY = rowSeparatorHeightTop
        containerView.addSubview(rowsContainerView)
        addConstraints([
            NSLayoutConstraint(item: rowsContainerView, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: rowsContainerView, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: rowsContainerView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 512.0),
            NSLayoutConstraint(item: rowsContainerView, attribute: .top, relatedBy: .equal, toItem: containerView,
                               attribute: .top, multiplier: 1.0, constant: CGFloat(layoutY)),
        ])
        
        var relativeTopY = 0
        
        let rowCount1 = (rowCount - 1)
        var rowIndex = 0
        while rowIndex < rowCount {
            
            if rowIndex < toolInterfaceViewModel.rowsBottom.count {
                let toolRow = toolInterfaceViewModel.rowsBottom[rowIndex]
                let toolRowView = ToolRowView(toolInterfaceViewModel: toolInterfaceViewModel,
                                              toolRow: toolRow,
                                              toolRowLocation: .top,
                                              widthSource: .standard,
                                              orientation: orientation)
                
                rowsContainerView.addSubview(toolRowView)
                
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
                
                rowsContainerView.addConstraints([
                    toolRowView.leftAnchor.constraint(equalTo: rowsContainerView.safeAreaLayoutGuide.leftAnchor, constant: 0.0),
                    NSLayoutConstraint(item: toolRowView,
                                       attribute: .top,
                                       relatedBy: .equal,
                                       toItem: rowsContainerView,
                                       attribute: .top,
                                       multiplier: 1.0,
                                       constant: CGFloat(relativeTopY)),
                ])
                
                toolRowViews.append(toolRowView)
                
            }
            
            layoutY += rowHeight
            relativeTopY += rowHeight
            
            if rowIndex != rowCount1 {
                if let separatorView = getSeparator(at: rowIndex + 1) {
                    rowsContainerView.addSubview(separatorView)
                    rowsContainerView.addConstraints([
                        NSLayoutConstraint(item: separatorView, attribute: .left, relatedBy: .equal,
                                           toItem: rowsContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: separatorView, attribute: .right, relatedBy: .equal,
                                           toItem: rowsContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: separatorView, attribute: .top, relatedBy: .equal,
                                           toItem: rowsContainerView, attribute: .top, multiplier: 1.0,
                                           constant: CGFloat(relativeTopY)),
                    ])
                    separatorView.addConstraint(NSLayoutConstraint(item: separatorView, attribute: .height, relatedBy: .equal,
                                                                   toItem: nil, attribute: .notAnAttribute,
                                                                   multiplier: 1.0, constant: CGFloat(rowSeparatorHeight)))
                }
                
                layoutY += rowSeparatorHeight
                relativeTopY += rowSeparatorHeight
            }
            
            rowIndex += 1
        }
        
        containerView.addSubview(separatorBottom)
        containerView.addConstraints([
            NSLayoutConstraint(item: separatorBottom, attribute: .left, relatedBy: .equal,
                               toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottom, attribute: .right, relatedBy: .equal,
                               toItem: containerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottom, attribute: .top, relatedBy: .equal,
                               toItem: containerView, attribute: .top, multiplier: 1.0, constant: CGFloat(layoutY)),
        ])
        separatorBottom.addConstraint(NSLayoutConstraint(item: separatorBottom, attribute: .height, relatedBy: .equal, toItem: nil,
                                                         attribute: .notAnAttribute, multiplier: 1.0,
                                                         constant: CGFloat(rowSeparatorHeightBottom)))
        
        
        
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
