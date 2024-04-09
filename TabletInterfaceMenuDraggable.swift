//
//  TabletInterfaceMenuDraggable.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/17/24.
//

import UIKit

class TabletInterfaceMenuDraggable: UIView {
    
    static let grabCornerDistance = CGFloat(24.0)
    
    static func getMinimumWidth(orientation: Orientation) -> Int {
        return 404
    }
    
    static func getMaximumWidth(orientation: Orientation) -> Int {
        return 1400
    }
    
    lazy var topBar: TabletInterfaceMenuTopBar = {
        let result = TabletInterfaceMenuTopBar(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var bottomBar: TabletInterfaceMenuBottomBar = {
        let result = TabletInterfaceMenuBottomBar(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    private(set) var toolRowViews = [ToolRowView]()
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        super.init(frame: .zero)
        
        backgroundColor = UIColor.black
        layer.cornerRadius = 12.0
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(width: Int, height: Int , orientation: Orientation) {

        let topToolbarHeight = ToolInterfaceTheme.getDraggableTopToolbarHeight(orientation: orientation)
        
        addSubview(topBar)
        topBar.addConstraint(NSLayoutConstraint(item: topBar,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: CGFloat(topToolbarHeight)))
        addConstraints([
            NSLayoutConstraint(item: topBar,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .top,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: topBar,
                               attribute: .left,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .left,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: topBar,
                               attribute: .right,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .right,
                               multiplier: 1.0,
                               constant: 0.0)
        ])
        
        addSubview(bottomBar)
        let bottomToolbarHeight = ToolInterfaceTheme.getDraggableBottomToolbarHeight(orientation: orientation)
        bottomBar.addConstraint(NSLayoutConstraint(item: bottomBar,
                                                attribute: .height,
                                                relatedBy: .equal,
                                                toItem: nil,
                                                attribute: .notAnAttribute,
                                                multiplier: 1.0,
                                                constant: CGFloat(bottomToolbarHeight)))
        addConstraints([
            NSLayoutConstraint(item: bottomBar,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: bottomBar,
                               attribute: .left,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .left,
                               multiplier: 1.0,
                               constant: 0.0),
            NSLayoutConstraint(item: bottomBar,
                               attribute: .right,
                               relatedBy: .equal,
                               toItem: self,
                               attribute: .right,
                               multiplier: 1.0,
                               constant: 0.0)
        ])
        
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getDraggableRowSeparatorHeight(orientation: orientation)
        
        toolInterfaceViewModel.calculatelayoutStackingCategory(width: width,
                                                               height: rowHeight,
                                                               safeAreaLeft: 0,
                                                               safeAreaRight: 0)
        toolInterfaceViewModel.layoutAllRowsTablet(rowWidth: width,
                                                   rowHeight: rowHeight,
                                                   safeAreaLeft: 0,
                                                   safeAreaRight: 0)
        
        var toolRowY = topToolbarHeight + rowSeparatorHeight
        
        for rowIndex in 0..<toolInterfaceViewModel.rowsDraggable.count {
            let toolRow = toolInterfaceViewModel.rowsDraggable[rowIndex]
            let toolRowView = ToolRowView(toolInterfaceViewModel: toolInterfaceViewModel,
                                          toolRow: toolRow,
                                          toolRowLocation: .draggable,
                                          orientation: orientation)
            
            addSubview(toolRowView)
            
            let widthConstraint = toolRow.getWidthConstraint(toolRowView)
            widthConstraint.constant = CGFloat(width)
            
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
                                   constant: CGFloat(toolRowY)),
            ])
            
            toolRowViews.append(toolRowView)
            
            toolRowY += rowHeight
            toolRowY += rowSeparatorHeight
        }
    }
    
    func isNearCornerTopLeft(_ point: CGPoint) -> Bool {
        
        let cornerX = CGFloat(0.0)
        let cornerY = CGFloat(0.0)
        let diffX = abs(point.x - cornerX)
        let diffY = abs(point.y - cornerY)
        
        if diffX <= Self.grabCornerDistance && diffY <= Self.grabCornerDistance {
            return true
        }
        
        return false
    }
    
    func isNearCornerTopRight(_ point: CGPoint) -> Bool {
        
        let cornerX = CGFloat(bounds.width)
        let cornerY = CGFloat(0.0)
        let diffX = abs(point.x - cornerX)
        let diffY = abs(point.y - cornerY)
        if diffX <= Self.grabCornerDistance && diffY <= Self.grabCornerDistance {
            return true
        }
        
        return false
    }
    
    func isNearCornerBottomLeft(_ point: CGPoint) -> Bool {
        let cornerX = CGFloat(0.0)
        let cornerY = CGFloat(bounds.height)
        let diffX = abs(point.x - cornerX)
        let diffY = abs(point.y - cornerY)
        if diffX <= Self.grabCornerDistance && diffY <= Self.grabCornerDistance {
            return true
        }
        
        return false
    }
    
    func isNearCornerBottomRight(_ point: CGPoint) -> Bool {
        let cornerX = CGFloat(bounds.width)
        let cornerY = CGFloat(bounds.height)
        let diffX = abs(point.x - cornerX)
        let diffY = abs(point.y - cornerY)
        if diffX <= Self.grabCornerDistance && diffY <= Self.grabCornerDistance {
            return true
        }
        return false
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        if isNearCornerTopRight(point) { return nil }
        if isNearCornerTopLeft(point) { return nil }
        if isNearCornerBottomLeft(point) { return nil }
        if isNearCornerBottomRight(point) { return nil }
        
        if topBar.frame.contains(point) {
            return nil
        } else if bottomBar.frame.contains(point) {
            return nil
        } else {
            if bounds.contains(point) {
                return super.hitTest(point, with: event)
            } else {
                return nil
            }
        }
    }
    
    func getHeight(orientation: Orientation) -> Int {
        
        var result = 0
        result += ToolInterfaceTheme.getDraggableTopToolbarHeight(orientation: orientation)
        result += ToolInterfaceTheme.getDraggableTopToolbarSeparatorHeight(orientation: orientation)
        
        result += ToolInterfaceTheme.getDraggableBottomToolbarHeight(orientation: orientation)
        result += ToolInterfaceTheme.getDraggableBottomToolbarSeparatorHeight(orientation: orientation)
        
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getDraggableRowSeparatorHeight(orientation: orientation)
        
        if toolInterfaceViewModel.rowsDraggable.count > 1 {
            result += rowSeparatorHeight * (toolInterfaceViewModel.rowsDraggable.count - 1)
            result += rowHeight * (toolInterfaceViewModel.rowsDraggable.count)
        } else if toolInterfaceViewModel.rowsDraggable.count == 1 {
            result += rowHeight
        }
        
        return result
    }

}
