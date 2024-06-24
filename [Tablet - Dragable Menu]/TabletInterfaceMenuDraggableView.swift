//
//  TabletInterfaceMenuDraggableView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/17/24.
//

import UIKit

class TabletInterfaceMenuDraggableView: UIView {
    
    static let borderSize = 2
    
    static let grabCornerDistance = CGFloat(24.0)
    
    static func getMinimumWidth(orientation: Orientation) -> Int {
        return 404
    }
    
    static func getMaximumWidth(orientation: Orientation) -> Int {
        return 1400
    }
    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        //result.backgroundColor = ToolInterfaceTheme._gray500
        return result
    }()
    
    lazy var topRowsContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.clipsToBounds = true
        return result
    }()
    
    lazy var graphContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.clipsToBounds = true
        return result
    }()
    
    lazy var graphClippingView: GraphClippingView = {
        let orientation = toolInterfaceViewModel.orientation
        let insetLeft = ToolInterfaceTheme.getDraggableGraphInsetLeft(orientation: orientation)
        let insetRight = ToolInterfaceTheme.getDraggableGraphInsetRight(orientation: orientation)
        let insetTop = ToolInterfaceTheme.getDraggableGraphInsetTop(orientation: orientation)
        let insetBottom = ToolInterfaceTheme.getDraggableGraphInsetBottom(orientation: orientation)
        let cornerRadius = ToolInterfaceTheme.getDraggableGraphCornerRadius(orientation: orientation)
        let result = GraphClippingView(insetLeft: insetLeft, insetRight: insetRight, insetTop: insetTop,
                                       insetBottom: insetBottom, cornerRadius: cornerRadius)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var graphSideMenu: GraphSideMenu = {
        let orientation = toolInterfaceViewModel.orientation
        let width = ToolInterfaceTheme.getGraphSideMenuWidth(orientation: orientation)
        let insetLeft = ToolInterfaceTheme.getGraphSideMenuInsetLeft(orientation: orientation)
        let insetRight = ToolInterfaceTheme.getGraphSideMenuInsetRight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getStationaryRowSeparatorHeight(orientation: orientation)
        let rowSeparatorHeightTop = ToolInterfaceTheme.getTopRowSeparatorHeightTop(orientation: orientation)
        let rowSeparatorHeightBottom = ToolInterfaceTheme.getTopRowSeparatorHeightBottom(orientation: orientation)
        
       let result = GraphSideMenu(toolInterfaceViewModel: toolInterfaceViewModel,
                                  width: width, insetLeft: insetLeft, insetRight: insetRight,
                                  rowSeparatorHeight: rowSeparatorHeight, rowSeparatorHeightTop: rowSeparatorHeightTop,
                                  rowSeparatorHeightBottom: rowSeparatorHeightBottom)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var topBar: TabletInterfaceMenuTopBar = {
        let orientation = toolInterfaceViewModel.orientation
        let result = TabletInterfaceMenuTopBar(toolInterfaceViewModel: toolInterfaceViewModel, orientation: orientation)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var bottomBar: TabletInterfaceMenuBottomBar = {
        let result = TabletInterfaceMenuBottomBar(toolInterfaceViewModel: toolInterfaceViewModel)
        result.translatesAutoresizingMaskIntoConstraints = false
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
        result.backgroundColor = ToolInterfaceTheme._separatorOuterEdge
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
    
    lazy var separator6: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorMiddle
        return result
    }()
    
    lazy var separator7: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorMiddle
        return result
    }()
    
    lazy var separator8: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorMiddle
        return result
    }()
    
    lazy var separator9: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorMiddle
        return result
    }()
    
    lazy var separator10: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorMiddle
        return result
    }()
    
    func getSeparator(at index: Int) -> UIView? {
        if index == 1 { return separator1 }
        if index == 2 { return separator2 }
        if index == 3 { return separator3 }
        if index == 4 { return separator4 }
        if index == 5 { return separator5 }
        if index == 6 { return separator6 }
        if index == 7 { return separator7 }
        if index == 8 { return separator8 }
        if index == 9 { return separator9 }
        if index == 10 { return separator10 }
        return nil
    }
    
    
    private(set) var toolRowViews = [ToolRowView]()
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    init(toolInterfaceViewModel: ToolInterfaceViewModel) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        super.init(frame: .zero)
        
        //backgroundColor = ToolInterfaceTheme._gray950
        layer.cornerRadius = 18.0
        clipsToBounds = true
        
        //
        // This is too extreme since we use alpha...
        //
        //layer.shadowOffset = CGSize(width: -2.0, height: 4.0)
        //layer.shadowRadius = 6.0
        //layer.shadowOpacity = 1.0
        //layer.shadowColor = ToolInterfaceTheme._gray020.withAlphaComponent(0.6).cgColor
        
        
        layer.borderColor = ToolInterfaceTheme._gray975.cgColor
        layer.borderWidth = CGFloat(Self.borderSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(width: Int, height: Int , orientation: Orientation) {

        let topToolbarHeight = ToolInterfaceTheme.getDraggableTopToolbarHeight(orientation: orientation)
        
        addSubview(containerView)
        
        addConstraints([
            NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: self,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .right, relatedBy: .equal, toItem: self,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: self,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal, toItem: self,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        containerView.addSubview(topBar)
        topBar.addConstraint(NSLayoutConstraint(item: topBar, attribute: .height, relatedBy: .equal,
                                                toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                constant: CGFloat(topToolbarHeight)))
        containerView.addConstraints([
            NSLayoutConstraint(item: topBar, attribute: .top, relatedBy: .equal, toItem: containerView,
                               attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: topBar, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: topBar, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: 0.0)
        ])
        
        containerView.addSubview(bottomBar)
        let bottomToolbarHeight = ToolInterfaceTheme.getDraggableBottomToolbarHeight(orientation: orientation)
        bottomBar.addConstraint(NSLayoutConstraint(item: bottomBar, attribute: .height, relatedBy: .equal,
                                                   toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                   constant: CGFloat(bottomToolbarHeight)))
        containerView.addConstraints([
            NSLayoutConstraint(item: bottomBar, attribute: .bottom, relatedBy: .equal, toItem: containerView,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: bottomBar, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: bottomBar, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: 0.0)
        ])
        
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getDraggableRowSeparatorHeight(orientation: orientation)
        let rowSeparatorHeightTop = ToolInterfaceTheme.getDraggableRowSeparatorHeightTop(orientation: orientation)
        let rowSeparatorHeightBottom = ToolInterfaceTheme.getDraggableRowSeparatorHeightBottom(orientation: orientation)
        
        var toolRowY = topToolbarHeight
        
        containerView.addSubview(separatorTop)
        containerView.addConstraints([
            NSLayoutConstraint(item: separatorTop, attribute: .left, relatedBy: .equal,
                               toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTop, attribute: .right, relatedBy: .equal,
                               toItem: containerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTop, attribute: .top, relatedBy: .equal,
                               toItem: containerView, attribute: .top, multiplier: 1.0, constant: CGFloat(toolRowY)),
        ])
        separatorTop.addConstraint(NSLayoutConstraint(item: separatorTop, attribute: .height, relatedBy: .equal, toItem: nil,
                                                      attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(rowSeparatorHeightTop)))
        
        toolRowY += rowSeparatorHeightTop
        
        containerView.addSubview(separatorBottom)
        containerView.addConstraints([
            NSLayoutConstraint(item: separatorBottom, attribute: .left, relatedBy: .equal,
                               toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottom, attribute: .right, relatedBy: .equal,
                               toItem: containerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottom, attribute: .bottom, relatedBy: .equal,
                               toItem: containerView, attribute: .bottom, multiplier: 1.0, constant: CGFloat(-bottomToolbarHeight)),
        ])
        separatorBottom.addConstraint(NSLayoutConstraint(item: separatorBottom, attribute: .height, relatedBy: .equal, toItem: nil,
                                                         attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(rowSeparatorHeightBottom)))
        
        let graphAreaRowCount = ToolInterfaceTheme.getDraggableGraphAreaRowCount()
        
        var topContainerHeight = (graphAreaRowCount * rowHeight)
        if graphAreaRowCount > 1 {
            topContainerHeight += rowSeparatorHeight * (graphAreaRowCount - 1)
        }
        
        containerView.addSubview(topRowsContainerView)
        containerView.addConstraints([
            NSLayoutConstraint(item: topRowsContainerView, attribute: .left, relatedBy: .equal,
                               toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: topRowsContainerView, attribute: .right, relatedBy: .equal,
                               toItem: containerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: topRowsContainerView, attribute: .top, relatedBy: .equal,
                               toItem: containerView, attribute: .top, multiplier: 1.0, constant: CGFloat(toolRowY)),
        ])
        topRowsContainerView.addConstraint(NSLayoutConstraint(item: topRowsContainerView, attribute: .height, relatedBy: .equal, toItem: nil,
                                                              attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(topContainerHeight)))
        
        containerView.addSubview(graphContainerView)
        addConstraints([
            NSLayoutConstraint(item: graphContainerView, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphContainerView, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphContainerView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(topContainerHeight)),
            NSLayoutConstraint(item: graphContainerView, attribute: .top, relatedBy: .equal, toItem: containerView,
                               attribute: .top, multiplier: 1.0, constant: CGFloat(topToolbarHeight + rowSeparatorHeightTop)),
        ])
        graphContainerView.addSubview(graphClippingView)
        graphContainerView.addConstraints([
            NSLayoutConstraint(item: graphClippingView, attribute: .left, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphClippingView, attribute: .right, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphClippingView, attribute: .top, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphClippingView, attribute: .bottom, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        let graphSideMenuWidth = ToolInterfaceTheme.getGraphSideMenuWidth(orientation: orientation)
        graphContainerView.addSubview(graphSideMenu)
        graphContainerView.addConstraints([
            graphSideMenu.leftAnchor.constraint(equalTo: graphContainerView.safeAreaLayoutGuide.leftAnchor),
            NSLayoutConstraint(item: graphClippingView, attribute: .bottom, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphSideMenu, attribute: .width, relatedBy: .equal,
                               toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(graphSideMenuWidth)),
            NSLayoutConstraint(item: graphSideMenu, attribute: .height, relatedBy: .equal,
                               toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(topContainerHeight)),
        ])
        
        graphContainerView.isHidden = true
        graphContainerView.isUserInteractionEnabled = false
        
        toolInterfaceViewModel.calculatelayoutStackingCategory(width: width,
                                                               height: rowHeight)
        toolInterfaceViewModel.layoutAllRowsTablet(rowWidth: width, rowHeight: rowHeight,
                                                   safeAreaLeft: 0, safeAreaRight: 0)
        
        var relativeTopY = 0
        var rowIndex = 0
        let graphAreaRowCount1 = (graphAreaRowCount - 1)
        
        while rowIndex < graphAreaRowCount {
            
            if rowIndex < toolInterfaceViewModel.rowsDraggable.count {
                
                let toolRow = toolInterfaceViewModel.rowsDraggable[rowIndex]
                let toolRowView = ToolRowView(toolInterfaceViewModel: toolInterfaceViewModel,
                                              toolRow: toolRow,
                                              toolRowLocation: .draggable,
                                              widthSource: .standard,
                                              orientation: orientation)
                
                topRowsContainerView.addSubview(toolRowView)
                
                let widthConstraint = toolRow.getWidthConstraint(toolRowView)
                widthConstraint.constant = CGFloat(width)
                
                toolRowView.addConstraints([
                    widthConstraint,
                    NSLayoutConstraint(item: toolRowView, attribute: .height, relatedBy: .equal, toItem: nil,
                                       attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(rowHeight))
                ])
                
                topRowsContainerView.addConstraints([
                    NSLayoutConstraint(item: toolRowView, attribute: .left, relatedBy: .equal,
                                       toItem: topRowsContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: toolRowView, attribute: .top, relatedBy: .equal,
                                       toItem: topRowsContainerView, attribute: .top, multiplier: 1.0, constant: CGFloat(relativeTopY)),
                ])
                
                toolRowViews.append(toolRowView)
                
                
            }
            
            toolRowY += rowHeight
            relativeTopY += rowHeight
            
            if rowIndex != graphAreaRowCount1 {
                
                if let separatorView = getSeparator(at: rowIndex + 1) {
                    topRowsContainerView.addSubview(separatorView)
                    topRowsContainerView.addConstraints([
                        NSLayoutConstraint(item: separatorView, attribute: .left, relatedBy: .equal,
                                           toItem: topRowsContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: separatorView, attribute: .right, relatedBy: .equal,
                                           toItem: topRowsContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: separatorView, attribute: .top, relatedBy: .equal,
                                           toItem: topRowsContainerView, attribute: .top, multiplier: 1.0, constant: CGFloat(relativeTopY)),
                    ])
                    separatorView.addConstraint(NSLayoutConstraint(item: separatorView, attribute: .height, relatedBy: .equal, toItem: nil,
                                                                   attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(rowSeparatorHeight)))
                }
                toolRowY += rowSeparatorHeight
                relativeTopY += rowSeparatorHeight
            }
            
            rowIndex += 1
        }
        
        
        if let separatorView = getSeparator(at: rowIndex + 1) {
            containerView.addSubview(separatorView)
            containerView.addConstraints([
                NSLayoutConstraint(item: separatorView, attribute: .left, relatedBy: .equal,
                                   toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: separatorView, attribute: .right, relatedBy: .equal,
                                   toItem: containerView, attribute: .right, multiplier: 1.0, constant: 0.0),
                NSLayoutConstraint(item: separatorView, attribute: .top, relatedBy: .equal,
                                   toItem: containerView, attribute: .top, multiplier: 1.0, constant: CGFloat(toolRowY)),
            ])
            separatorView.addConstraint(NSLayoutConstraint(item: separatorView, attribute: .height, relatedBy: .equal, toItem: nil,
                                                           attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(rowSeparatorHeight)))
        }
        
        toolRowY += rowSeparatorHeight
        
        let rowsCount1 = (toolInterfaceViewModel.rowsDraggable.count - 1)
        while rowIndex < toolInterfaceViewModel.rowsDraggable.count {
            
            if rowIndex < toolInterfaceViewModel.rowsDraggable.count {
                
                let toolRow = toolInterfaceViewModel.rowsDraggable[rowIndex]
                let toolRowView = ToolRowView(toolInterfaceViewModel: toolInterfaceViewModel,
                                              toolRow: toolRow,
                                              toolRowLocation: .draggable,
                                              widthSource: .standard,
                                              orientation: orientation)
                
                containerView.addSubview(toolRowView)
                
                let widthConstraint = toolRow.getWidthConstraint(toolRowView)
                widthConstraint.constant = CGFloat(width)
                
                toolRowView.addConstraints([
                    widthConstraint,
                    NSLayoutConstraint(item: toolRowView, attribute: .height, relatedBy: .equal, toItem: nil,
                                       attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(rowHeight))
                ])
                
                containerView.addConstraints([
                    NSLayoutConstraint(item: toolRowView, attribute: .left, relatedBy: .equal,
                                       toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0),
                    NSLayoutConstraint(item: toolRowView, attribute: .top, relatedBy: .equal,
                                       toItem: containerView, attribute: .top, multiplier: 1.0, constant: CGFloat(toolRowY)),
                ])
                
                toolRowViews.append(toolRowView)
            }
            
            toolRowY += rowHeight
            if rowIndex != rowsCount1 {
                
                if let separatorView = getSeparator(at: rowIndex + 2) {
                    containerView.addSubview(separatorView)
                    containerView.addConstraints([
                        NSLayoutConstraint(item: separatorView, attribute: .left, relatedBy: .equal,
                                           toItem: containerView, attribute: .left, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: separatorView, attribute: .right, relatedBy: .equal,
                                           toItem: containerView, attribute: .right, multiplier: 1.0, constant: 0.0),
                        NSLayoutConstraint(item: separatorView, attribute: .top, relatedBy: .equal,
                                           toItem: containerView, attribute: .top, multiplier: 1.0, constant: CGFloat(toolRowY)),
                    ])
                    separatorView.addConstraint(NSLayoutConstraint(item: separatorView, attribute: .height, relatedBy: .equal, toItem: nil,
                                                                   attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(rowSeparatorHeight)))
                    
                }
                toolRowY += rowSeparatorHeight
            }
            rowIndex += 1
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
        
        if topBar.frame.contains(point) {
            if topBar.expandCollapseButton.frame.contains(point) {
                print("It's in the button...")
                return super.hitTest(point, with: event)
            }
        }
        
        //topBar
        //expandCollapseButton
        
        
        if isNearCornerTopRight(point) { return nil }
        if isNearCornerTopLeft(point) { return nil }
        if isNearCornerBottomLeft(point) { return nil }
        if isNearCornerBottomRight(point) { return nil }
        
        if topBar.frame.contains(point) {
            return nil
        } else if bottomBar.frame.contains(point) {
            return nil
        } else {
            if let jiggleViewModel = toolInterfaceViewModel.jiggleViewModel {
                if jiggleViewModel.isWeightCurveGraphEnabled {
                    
                    let frames = getGraphFrames(isRelativeToWorld: false, isGraphEnabled: true)
                    
                    let weightCurveFrame = CGRect(x: CGFloat(frames.contentFrameX),
                                                  y: CGFloat(frames.contentFrameY),
                                                  width: CGFloat(frames.contentFrameWidth),
                                                  height: CGFloat(frames.contentFrameHeight))
                    if weightCurveFrame.contains(point) {
                        return nil
                    }
                }
            }
            
            if bounds.contains(point) {
                return super.hitTest(point, with: event)
            } else {
                return nil
            }
        }
    }
    
    func getHeight(orientation: Orientation, isExpanded: Bool) -> Int {
        
        if isExpanded {
            var result = 0
            result += ToolInterfaceTheme.getDraggableTopToolbarHeight(orientation: orientation)
            result += ToolInterfaceTheme.getDraggableRowSeparatorHeightTop(orientation: orientation)
            
            let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
            let rowSeparatorHeight = ToolInterfaceTheme.getDraggableRowSeparatorHeight(orientation: orientation)
            
            if toolInterfaceViewModel.rowsDraggable.count > 1 {
                result += rowSeparatorHeight * (toolInterfaceViewModel.rowsDraggable.count - 1)
                result += rowHeight * (toolInterfaceViewModel.rowsDraggable.count)
            } else if toolInterfaceViewModel.rowsDraggable.count == 1 {
                result += rowHeight
            }
            
            result += ToolInterfaceTheme.getDraggableRowSeparatorHeightBottom(orientation: orientation)
            result += ToolInterfaceTheme.getDraggableBottomToolbarHeight(orientation: orientation)
            return result
        } else {
            let result = ToolInterfaceTheme.getDraggableTopToolbarHeight(orientation: orientation)
            return result
        }
    }
    
    func animateGraphIn(time: Float, _ completion: @escaping () -> Void) {
        let viewWidth = bounds.size.width
        
        let transformLeft = CGAffineTransform(translationX: -(viewWidth), y: 0.0)
        let transformCenter = CGAffineTransform.identity
        let transformRight = CGAffineTransform(translationX: viewWidth, y: 0.0)
        
        graphContainerView.isHidden = false
        graphContainerView.isUserInteractionEnabled = true
        graphContainerView.transform = transformRight
        
        topRowsContainerView.isHidden = false
        topRowsContainerView.isUserInteractionEnabled = true
        topRowsContainerView.transform = transformCenter
        
        UIView.animate(withDuration: TimeInterval(time), delay: 0.0, options: .curveLinear, animations: { [weak self] in
            if let self = self {
                self.graphContainerView.transform = transformCenter
                self.topRowsContainerView.transform = transformLeft
            }
        }) { [weak self] _ in
            if let self = self {
                self.topRowsContainerView.isHidden = true
                self.topRowsContainerView.isUserInteractionEnabled = false
            }
            completion()
        }
    }
    
    func animateGraphOut(time: Float, _ completion: @escaping () -> Void) {
        
        let viewWidth = bounds.size.width
        
        let transformLeft = CGAffineTransform(translationX: -viewWidth, y: 0.0)
        let transformCenter = CGAffineTransform.identity
        let transformRight = CGAffineTransform(translationX: viewWidth, y: 0.0)
        
        graphContainerView.isHidden = false
        graphContainerView.isUserInteractionEnabled = true
        graphContainerView.transform = transformCenter
        
        topRowsContainerView.isHidden = false
        topRowsContainerView.isUserInteractionEnabled = true
        topRowsContainerView.transform = transformLeft
        
        UIView.animate(withDuration: TimeInterval(time), delay: 0.0, options: .curveLinear, animations: { [weak self] in
            if let self = self {
                self.graphContainerView.transform = transformRight
                self.topRowsContainerView.transform = transformCenter
            }
        }) { [weak self] _ in
            if let self = self {
                self.graphContainerView.isHidden = true
                self.graphContainerView.isUserInteractionEnabled = false
            }
            completion()
        }
    }
    
    struct GraphFrame {
        var clipFrameX: Int
        var clipFrameY: Int
        var clipFrameWidth: Int
        var clipFrameHeight: Int
                
        var contentFrameX: Int
        var contentFrameY: Int
        var contentFrameWidth: Int
        var contentFrameHeight: Int
    }
    
    func getGraphFrames(isRelativeToWorld: Bool,
                        isGraphEnabled: Bool) -> GraphFrame {
        
        let menuX = isRelativeToWorld ? Int(frame.origin.x + 0.5) : 0
        let menuY = isRelativeToWorld ? Int(frame.origin.y + 0.5) : 0
        let menuWidth = Int(bounds.size.width + 0.5)
        
        let orientation = toolInterfaceViewModel.orientation
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getDraggableRowSeparatorHeight(orientation: orientation)
        let rowSeparatorHeightTop = ToolInterfaceTheme.getDraggableRowSeparatorHeightTop(orientation: orientation)
        
        let topToolbarHeight = ToolInterfaceTheme.getDraggableTopToolbarHeight(orientation: orientation)
        let graphAreaRowCount = ToolInterfaceTheme.getDraggableGraphAreaRowCount()
        var graphContainerHeight = (graphAreaRowCount * rowHeight)
        if graphAreaRowCount > 1 {
            graphContainerHeight += rowSeparatorHeight * (graphAreaRowCount - 1)
        }
        
        let clipFrameX = menuX//isGraphEnabled ? (menuX) : (menuX + menuWidth)
        let clipFrameY = menuY + rowSeparatorHeightTop + topToolbarHeight
        let clipFrameWidth = menuWidth
        let clipFrameHeight = graphContainerHeight
        let insetLeft = ToolInterfaceTheme.getDraggableGraphInsetLeft(orientation: orientation)
        let insetRight = ToolInterfaceTheme.getDraggableGraphInsetRight(orientation: orientation)
        let insetTop = ToolInterfaceTheme.getDraggableGraphInsetTop(orientation: orientation)
        let insetBottom = ToolInterfaceTheme.getDraggableGraphInsetBottom(orientation: orientation)
        let contentFrameX = clipFrameX + insetLeft + (isGraphEnabled ? 0 : menuWidth)
        let contentFrameY = clipFrameY + insetTop
        let contentFrameWidth = clipFrameWidth - (insetLeft + insetRight)
        let contentFrameHeight = clipFrameHeight - (insetTop + insetBottom)
        return GraphFrame(clipFrameX: clipFrameX, clipFrameY: clipFrameY,
                          clipFrameWidth: clipFrameWidth, clipFrameHeight: clipFrameHeight,
                          contentFrameX: contentFrameX, contentFrameY: contentFrameY,
                          contentFrameWidth: contentFrameWidth, contentFrameHeight: contentFrameHeight)
    }
    
    
    func expand() {
        
        bottomBar.isUserInteractionEnabled = true
        bottomBar.isHidden = false
        
        separatorTop.isUserInteractionEnabled = true
        separatorTop.isHidden = false
        
        separatorBottom.isUserInteractionEnabled = true
        separatorBottom.isHidden = false
        
        separator1.isUserInteractionEnabled = true
        separator1.isHidden = false
        
        separator2.isUserInteractionEnabled = true
        separator2.isHidden = false
        
        separator3.isUserInteractionEnabled = true
        separator3.isHidden = false
        
        separator4.isUserInteractionEnabled = true
        separator4.isHidden = false
        
        separator5.isUserInteractionEnabled = true
        separator5.isHidden = false
        
        separator6.isUserInteractionEnabled = true
        separator6.isHidden = false
        
        separator7.isUserInteractionEnabled = true
        separator7.isHidden = false
        
        separator8.isUserInteractionEnabled = true
        separator8.isHidden = false
        
        separator9.isUserInteractionEnabled = true
        separator9.isHidden = false
        
        separator10.isUserInteractionEnabled = true
        separator10.isHidden = false
        
        for toolRowView in toolRowViews {
            toolRowView.isUserInteractionEnabled = true
            toolRowView.isHidden = false
        }
        
        if let jiggleViewModel = toolInterfaceViewModel.jiggleViewModel {
            if jiggleViewModel.isWeightCurveGraphEnabled {
                graphContainerView.isHidden = false
                graphContainerView.isUserInteractionEnabled = true
            } else {
                topRowsContainerView.isHidden = false
                topRowsContainerView.isUserInteractionEnabled = true
            }
        }
    }
    
    func collapse() {
        bottomBar.isUserInteractionEnabled = false
        bottomBar.isHidden = true
        
        separatorTop.isUserInteractionEnabled = false
        separatorTop.isHidden = true
        
        separatorBottom.isUserInteractionEnabled = false
        separatorBottom.isHidden = true
        
        separator1.isUserInteractionEnabled = false
        separator1.isHidden = true
        
        separator2.isUserInteractionEnabled = false
        separator2.isHidden = true
        
        separator3.isUserInteractionEnabled = false
        separator3.isHidden = true
        
        separator4.isUserInteractionEnabled = false
        separator4.isHidden = true
        
        separator5.isUserInteractionEnabled = false
        separator5.isHidden = true
        
        separator6.isUserInteractionEnabled = false
        separator6.isHidden = true
        
        separator7.isUserInteractionEnabled = false
        separator7.isHidden = true
        
        separator8.isUserInteractionEnabled = false
        separator8.isHidden = true
        
        separator9.isUserInteractionEnabled = false
        separator9.isHidden = true
        
        separator10.isUserInteractionEnabled = false
        separator10.isHidden = true
        
        for toolRowView in toolRowViews {
            toolRowView.isUserInteractionEnabled = false
            toolRowView.isHidden = true
        }
        
        graphContainerView.isHidden = true
        graphContainerView.isUserInteractionEnabled = false
        
        topRowsContainerView.isHidden = true
        topRowsContainerView.isUserInteractionEnabled = false
    }
    
}
