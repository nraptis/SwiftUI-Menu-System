//
//  PhoneInterfaceMenuTopView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/11/23.
//

import UIKit

class PhoneInterfaceMenuTopView: UIView {
    
    lazy var containerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var shadowLayer: CAGradientLayer = {
        let result = CAGradientLayer()
        result.colors = [ToolInterfaceTheme._shadowInner.cgColor,
                         ToolInterfaceTheme._shadowMiddle.cgColor,
                         ToolInterfaceTheme._shadowOuter.cgColor]
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
    
    lazy var rowsContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.clipsToBounds = true
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var rowsContainerTopButtressView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var graphClippingView: GraphClippingView = {
        let orientation = toolInterfaceViewModel.orientation
        let insetLeft = ToolInterfaceTheme.getTopGraphInsetLeft(orientation: orientation)
        let insetRight = ToolInterfaceTheme.getTopGraphInsetRight(orientation: orientation)
        let insetTop = ToolInterfaceTheme.getTopGraphInsetTop(orientation: orientation)
        let insetBottom = ToolInterfaceTheme.getTopGraphInsetBottom(orientation: orientation)
        let cornerRadius = ToolInterfaceTheme.getTopGraphCornerRadius(orientation: orientation)
        let result = GraphClippingView(insetLeft: insetLeft, insetRight: insetRight, insetTop: insetTop,
                                       insetBottom: insetBottom, cornerRadius: cornerRadius)
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var graphClippingLeftButtressView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var graphClippingRightButtressView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var graphClippingTopButtressView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._toolbarBackground
        return result
    }()
    
    lazy var graphSideMenu: GraphSideMenu = {
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
    
    lazy var graphContainerView: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }()
    
    lazy var separatorTopMain: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorInnerEdge
        return result
    }()
    
    lazy var separatorTopGraph: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorInnerEdge
        return result
    }()
    
    lazy var separatorBottomMain: UIView = {
        let result = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = ToolInterfaceTheme._separatorOuterEdge
        return result
    }()
    
    lazy var separatorBottomGraph: UIView = {
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
    
    var graphAreaHeight = CGFloat(512.0)
    
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
        
        let shadowHeight = ToolInterfaceTheme.getTopMenuShadowHeight(orientation: orientation)
        addSubview(shadowView)
        addConstraints([
            NSLayoutConstraint(item: shadowView, attribute: .left, relatedBy: .equal, toItem: self,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: shadowView, attribute: .right, relatedBy: .equal, toItem: self,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: shadowView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(shadowHeight)),
            NSLayoutConstraint(item: shadowView, attribute: .top, relatedBy: .equal, toItem: self,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        let rowCount = ToolInterfaceTheme.getTopMenuRowCount(orientation: orientation)
        let rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        let rowSeparatorHeight = ToolInterfaceTheme.getStationaryRowSeparatorHeight(orientation: orientation)
        let rowSeparatorHeightTop = ToolInterfaceTheme.getTopRowSeparatorHeightTop(orientation: orientation)
        let rowSeparatorHeightBottom = ToolInterfaceTheme.getTopRowSeparatorHeightBottom(orientation: orientation)
        let graphSideMenuWidth = ToolInterfaceTheme.getGraphSideMenuWidth(orientation: orientation)
        graphAreaHeight = CGFloat(ToolInterfaceTheme.getTopMenuGraphAreaHeight(orientation: orientation))
        containerView.addSubview(rowsContainerView)
        addConstraints([
            NSLayoutConstraint(item: rowsContainerView, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: rowsContainerView, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: rowsContainerView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 512.0),
            NSLayoutConstraint(item: rowsContainerView, attribute: .bottom, relatedBy: .equal, toItem: containerView,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        containerView.addSubview(graphContainerView)
        addConstraints([
            NSLayoutConstraint(item: graphContainerView, attribute: .left, relatedBy: .equal, toItem: containerView,
                               attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphContainerView, attribute: .right, relatedBy: .equal, toItem: containerView,
                               attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphContainerView, attribute: .height, relatedBy: .equal, toItem: nil,
                               attribute: .notAnAttribute, multiplier: 1.0, constant: 512.0),
            NSLayoutConstraint(item: graphContainerView, attribute: .bottom, relatedBy: .equal, toItem: containerView,
                               attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        
        graphContainerView.addSubview(graphClippingLeftButtressView)
        graphContainerView.addConstraints([
            graphClippingLeftButtressView.rightAnchor.constraint(equalTo: graphContainerView.safeAreaLayoutGuide.leftAnchor),
            NSLayoutConstraint(item: graphClippingLeftButtressView, attribute: .left, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphClippingLeftButtressView, attribute: .bottom, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .bottom, multiplier: 1.0,
                               constant: CGFloat(-rowSeparatorHeightBottom)),
            NSLayoutConstraint(item: graphClippingLeftButtressView, attribute: .top, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .top, multiplier: 1.0, 
                               constant: CGFloat(rowSeparatorHeightTop)),
        ])
        
        graphContainerView.addSubview(graphClippingRightButtressView)
        graphContainerView.addConstraints([
            graphClippingRightButtressView.leftAnchor.constraint(equalTo: graphContainerView.safeAreaLayoutGuide.rightAnchor),
            NSLayoutConstraint(item: graphClippingRightButtressView, attribute: .right, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphClippingRightButtressView, attribute: .bottom, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .bottom, multiplier: 1.0,
                               constant: CGFloat(-rowSeparatorHeightBottom)),
            NSLayoutConstraint(item: graphClippingRightButtressView, attribute: .top, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .top, multiplier: 1.0,
                               constant: CGFloat(rowSeparatorHeightTop)),
        ])
        
        graphContainerView.addSubview(separatorBottomGraph)
        graphContainerView.addConstraints([
            NSLayoutConstraint(item: separatorBottomGraph, attribute: .left, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottomGraph, attribute: .right, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottomGraph, attribute: .bottom, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        separatorBottomGraph.addConstraint(NSLayoutConstraint(item: separatorBottomGraph, attribute: .height, relatedBy: .equal,
                                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                              constant: CGFloat(rowSeparatorHeightBottom)))
        
        graphContainerView.addSubview(separatorTopGraph)
        graphContainerView.addConstraints([
            NSLayoutConstraint(item: separatorTopGraph, attribute: .left, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTopGraph, attribute: .right, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTopGraph, attribute: .bottom, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .bottom, multiplier: 1.0,
                               constant: -(CGFloat(rowSeparatorHeightBottom) + graphAreaHeight)),
        ])
        separatorTopGraph.addConstraint(NSLayoutConstraint(item: separatorTopGraph, attribute: .height, relatedBy: .equal,
                                                              toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                              constant: CGFloat(rowSeparatorHeightTop)))
        
        graphContainerView.addSubview(graphClippingTopButtressView)
        graphContainerView.addConstraints([
            graphClippingTopButtressView.leftAnchor.constraint(equalTo: graphContainerView.safeAreaLayoutGuide.leftAnchor),
            graphClippingTopButtressView.rightAnchor.constraint(equalTo: graphContainerView.safeAreaLayoutGuide.rightAnchor),
            NSLayoutConstraint(item: graphClippingTopButtressView, attribute: .bottom, relatedBy: .equal,
                               toItem: separatorTopGraph, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: graphClippingTopButtressView, attribute: .top, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .top, multiplier: 1.0, constant: 0.0),
        ])
        
        graphContainerView.addSubview(graphClippingView)
        graphContainerView.addConstraints([
            graphClippingView.leftAnchor.constraint(equalTo: graphContainerView.safeAreaLayoutGuide.leftAnchor),
            graphClippingView.rightAnchor.constraint(equalTo: graphContainerView.safeAreaLayoutGuide.rightAnchor),
            NSLayoutConstraint(item: graphClippingView, attribute: .bottom, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .bottom, multiplier: 1.0,
                               constant: CGFloat(-rowSeparatorHeightBottom)),
            NSLayoutConstraint(item: graphClippingView, attribute: .height, relatedBy: .equal,
                               toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: graphAreaHeight),
        ])
        
        graphContainerView.addSubview(graphSideMenu)
        graphContainerView.addConstraints([
            graphSideMenu.leftAnchor.constraint(equalTo: graphContainerView.safeAreaLayoutGuide.leftAnchor),
            NSLayoutConstraint(item: graphSideMenu, attribute: .bottom, relatedBy: .equal,
                               toItem: graphContainerView, attribute: .bottom, multiplier: 1.0,
                               constant: CGFloat(-rowSeparatorHeightBottom)),
            NSLayoutConstraint(item: graphSideMenu, attribute: .width, relatedBy: .equal,
                               toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(graphSideMenuWidth)),
            NSLayoutConstraint(item: graphSideMenu, attribute: .height, relatedBy: .equal,
                               toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: CGFloat(graphAreaHeight)),
        ])
        graphSideMenu.clipsToBounds = true
        
        graphContainerView.isUserInteractionEnabled = false
        graphContainerView.isHidden = true
        rowsContainerView.addSubview(separatorBottomMain)
        rowsContainerView.addConstraints([
            NSLayoutConstraint(item: separatorBottomMain, attribute: .left, relatedBy: .equal,
                               toItem: rowsContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottomMain, attribute: .right, relatedBy: .equal,
                               toItem: rowsContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorBottomMain, attribute: .bottom, relatedBy: .equal,
                               toItem: rowsContainerView, attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ])
        separatorBottomMain.addConstraint(NSLayoutConstraint(item: separatorBottomMain, attribute: .height, relatedBy: .equal,
                                                           toItem: nil, attribute: .notAnAttribute, multiplier: 1.0,
                                                           constant: CGFloat(rowSeparatorHeightBottom)))
        
        var layoutY = -rowSeparatorHeightBottom
        var rowIndex = rowCount - 1
        while rowIndex >= 0 {
            
            if rowIndex < toolInterfaceViewModel.rowsTop.count {
                let toolRow = toolInterfaceViewModel.rowsTop[rowIndex]
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
                                       attribute: .bottom,
                                       relatedBy: .equal,
                                       toItem: rowsContainerView,
                                       attribute: .bottom,
                                       multiplier: 1.0,
                                       constant: CGFloat(layoutY)),
                ])
                
                toolRowViews.append(toolRowView)
                
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
        
        rowsContainerView.addSubview(separatorTopMain)
        rowsContainerView.addConstraints([
            NSLayoutConstraint(item: separatorTopMain, attribute: .left, relatedBy: .equal,
                               toItem: rowsContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTopMain, attribute: .right, relatedBy: .equal,
                               toItem: rowsContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: separatorTopMain, attribute: .bottom, relatedBy: .equal,
                               toItem: rowsContainerView, attribute: .bottom, multiplier: 1.0, constant: CGFloat(layoutY)),
        ])
        separatorTopMain.addConstraint(NSLayoutConstraint(item: separatorTopMain, attribute: .height, relatedBy: .equal, toItem: nil,
                                                          attribute: .notAnAttribute, multiplier: 1.0,
                                                          constant: CGFloat(rowSeparatorHeightTop)))
        
        rowsContainerView.addSubview(rowsContainerTopButtressView)
        rowsContainerView.addConstraints([
            NSLayoutConstraint(item: rowsContainerTopButtressView, attribute: .left, relatedBy: .equal,
                               toItem: rowsContainerView, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: rowsContainerTopButtressView, attribute: .right, relatedBy: .equal,
                               toItem: rowsContainerView, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: rowsContainerTopButtressView, attribute: .top, relatedBy: .equal,
                               toItem: rowsContainerView, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: rowsContainerTopButtressView, attribute: .bottom, relatedBy: .equal,
                               toItem: separatorTopMain, attribute: .top, multiplier: 1.0, constant: 0.0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let jiggleViewModel = toolInterfaceViewModel.jiggleViewModel {
            if jiggleViewModel.isWeightCurveGraphEnabled {
                let adjustedPoint = CGPoint(x: point.x, y: point.y + frame.origin.y)
                let frames = getGraphFrames(isTopMenuExpanded: true, isGraphEnabled: true)
                let weightCurveFrame = CGRect(x: CGFloat(frames.contentFrameX),
                                              y: CGFloat(frames.contentFrameY),
                                              width: CGFloat(frames.contentFrameWidth),
                                              height: CGFloat(frames.contentFrameHeight))
                if weightCurveFrame.contains(adjustedPoint) {
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
    
    func getSeparator(at index: Int) -> UIView? {
        if index == 1 { return separator1 }
        if index == 2 { return separator2 }
        if index == 3 { return separator3 }
        if index == 4 { return separator4 }
        if index == 5 { return separator5 }
        return nil
    }
    
    func animateWeightCurveGraphIn_Pre() {
        let viewWidth = bounds.size.width
        let transformCenter = CGAffineTransform.identity
        let transformRight = CGAffineTransform(translationX: viewWidth, y: 0.0)
        graphContainerView.isHidden = false
        graphContainerView.isUserInteractionEnabled = true
        graphContainerView.transform = transformRight
        rowsContainerView.isHidden = false
        rowsContainerView.isUserInteractionEnabled = true
        rowsContainerView.transform = transformCenter
    }
    
    func animateWeightCurveGraphIn_Mid() {
        let viewWidth = bounds.size.width
        let transformLeft = CGAffineTransform(translationX: -viewWidth, y: 0.0)
        let transformCenter = CGAffineTransform.identity
        graphContainerView.transform = transformCenter
        rowsContainerView.transform = transformLeft
    }
    
    func animateWeightCurveGraphIn_Post() {
        rowsContainerView.isHidden = true
        rowsContainerView.isUserInteractionEnabled = false
    }
    
    func animateWeightCurveGraphOut_Pre() {
        let viewWidth = bounds.size.width
        let transformLeft = CGAffineTransform(translationX: -viewWidth, y: 0.0)
        let transformCenter = CGAffineTransform.identity
        graphContainerView.isHidden = false
        graphContainerView.isUserInteractionEnabled = true
        graphContainerView.transform = transformCenter
        rowsContainerView.isHidden = false
        rowsContainerView.isUserInteractionEnabled = true
        rowsContainerView.transform = transformLeft
    }
    
    func animateWeightCurveGraphOut_Mid() {
        let viewWidth = bounds.size.width
        let transformCenter = CGAffineTransform.identity
        let transformRight = CGAffineTransform(translationX: viewWidth, y: 0.0)
        graphContainerView.transform = transformRight
        rowsContainerView.transform = transformCenter
    }
    
    func animateWeightCurveGraphOut_Post() {
        graphContainerView.isHidden = true
        graphContainerView.isUserInteractionEnabled = false
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
    
    func getGraphFrames(isTopMenuExpanded: Bool,
                        isGraphEnabled: Bool) -> GraphFrame {
        
        
        let appWidth: Int
        if orientation.isLandscape {
            appWidth = Int(ApplicationController.device.widthLandscape + 0.5)
        } else {
            appWidth = Int(ApplicationController.device.widthPortrait + 0.5)
        }
        
        let safeAreaLeft = Int(ApplicationController.rootViewController.view.safeAreaInsets.left + 0.5)
        let safeAreaRight = Int(ApplicationController.rootViewController.view.safeAreaInsets.right + 0.5)
        let safeAreaTop = Int(ApplicationController.rootViewController.view.safeAreaInsets.top + 0.5)
        
        let topMenuHeight = ToolInterfaceTheme.getTopMenuHeight(orientation: orientation, withGraph: isGraphEnabled)
        let phoneMenuCollapseOffset = JiggleViewController.phoneMenuCollapseOffset
        
        let rowSeparatorHeightTop = ToolInterfaceTheme.getTopRowSeparatorHeightTop(orientation: orientation)
        
        let clipFrameX = isGraphEnabled ? 0 : appWidth
        var clipFrameY: Int
        let clipFrameWidth = appWidth
        let clipFrameHeight = ToolInterfaceTheme.getTopMenuGraphAreaHeight(orientation: orientation)
        
        if isTopMenuExpanded {
            clipFrameY = safeAreaTop + rowSeparatorHeightTop
            if isGraphEnabled == false {
                let topMenuHeightWithGraph = ToolInterfaceTheme.getTopMenuHeight(orientation: orientation, withGraph: true)
                clipFrameY -= (topMenuHeightWithGraph - topMenuHeight)
            }
        } else {
            clipFrameY = -topMenuHeight - phoneMenuCollapseOffset + rowSeparatorHeightTop
        }
        
        let insetLeft = ToolInterfaceTheme.getTopGraphInsetLeft(orientation: orientation)
        let insetRight = ToolInterfaceTheme.getTopGraphInsetRight(orientation: orientation)
        let insetTop = ToolInterfaceTheme.getTopGraphInsetTop(orientation: orientation)
        let insetBottom = ToolInterfaceTheme.getTopGraphInsetBottom(orientation: orientation)
        let contentFrameX = clipFrameX + insetLeft + safeAreaLeft
        let contentFrameY = clipFrameY + insetTop
        let contentFrameWidth = clipFrameWidth - (insetLeft + insetRight) - (safeAreaLeft + safeAreaRight)
        let contentFrameHeight = clipFrameHeight - (insetTop + insetBottom)
        return GraphFrame(clipFrameX: clipFrameX, clipFrameY: clipFrameY,
                          clipFrameWidth: clipFrameWidth, clipFrameHeight: clipFrameHeight,
                          contentFrameX: contentFrameX, contentFrameY: contentFrameY,
                          contentFrameWidth: contentFrameWidth, contentFrameHeight: contentFrameHeight)
    }
}
