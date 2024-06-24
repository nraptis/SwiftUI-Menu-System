//
//  ToolRowView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/19/24.
//

import UIKit
import SwiftUI
import Combine

class ToolRowView: UIView {
    
    enum ToolRowLocation {
        case top
        case bottom
        case draggable
    }
    
    var hostingControllerCurrent: UIViewController?
    var hostingControllerPrevious: UIViewController?
    
    var nodesDidChangeNotAnimatedCancellable: AnyCancellable?
    var nodesDidChangeAnimatedCancellable: AnyCancellable?
    
    let toolInterfaceViewModel: ToolInterfaceViewModel
    let toolRow: ToolRow
    let toolRowLocation: ToolRowLocation
    let orientation: Orientation
    let widthSource: ToolRowViewContent.WidthSource
    init(toolInterfaceViewModel: ToolInterfaceViewModel,
         toolRow: ToolRow,
         toolRowLocation: ToolRowLocation,
         widthSource: ToolRowViewContent.WidthSource,
         orientation: Orientation) {
        self.toolInterfaceViewModel = toolInterfaceViewModel
        self.toolRow = toolRow
        self.toolRowLocation = toolRowLocation
        self.widthSource = widthSource
        self.orientation = orientation
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = ToolInterfaceTheme._toolbarBackground
        
        let height = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        hostingControllerCurrent = UIHostingController(rootView: ToolRowViewContent(toolRow: toolRow,
                                                                                    widthSource: widthSource,
                                                                                    height: height,
                                                                                    orientation: orientation).environment(toolInterfaceViewModel))
        if let hostingControllerCurrent = hostingControllerCurrent {
            if let hostingView = hostingControllerCurrent.view {
                hostingView.backgroundColor = .clear
                addSubview(hostingView)
                hostingView.translatesAutoresizingMaskIntoConstraints = false
                addConstraints([
                    hostingView.leftAnchor.constraint(equalTo: self.leftAnchor),
                    hostingView.rightAnchor.constraint(equalTo: self.rightAnchor),
                    hostingView.topAnchor.constraint(equalTo: self.topAnchor),
                    hostingView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                ])
            }
        }
        
        nodesDidChangeNotAnimatedCancellable =
        toolRow.nodesDidChangePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleNodesDidChange(animated: self.toolRow.nodesDidChangeIsAnimated,
                                              reversed: self.toolRow.nodesDidChangeIsReversed,
                                              toolRowLocation: self.toolRowLocation,
                                              orientation: self.orientation)
                }
            }
    }
    
    func handleNodesDidChange(animated: Bool,
                              reversed: Bool,
                              toolRowLocation: ToolRowLocation,
                              orientation: Orientation) {
        print("handleNodesDidChange ani: \(animated) rev: \(reversed)")
        
        let safeAreaLeft = toolInterfaceViewModel.safeAreaLeft
        let safeAreaRight = toolInterfaceViewModel.safeAreaRight
        
        killPreviousHostingController()
        
        if animated {
            hostingControllerPrevious = hostingControllerCurrent
        } else {
            killCurrentHostingController()
        }
        
        let height = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        hostingControllerCurrent = UIHostingController(rootView: ToolRowViewContent(toolRow: toolRow,
                                                                                    widthSource: widthSource,
                                                                                    height: height, 
                                                                                    orientation: orientation).environment(toolInterfaceViewModel))
        
        if let hostingControllerCurrent = hostingControllerCurrent {
            
            addSubview(hostingControllerCurrent.view)
            hostingControllerCurrent.view.translatesAutoresizingMaskIntoConstraints = false
            
            if let hostingView = hostingControllerCurrent.view {
                hostingView.backgroundColor = ToolInterfaceTheme._gray025
                addConstraints([
                    hostingView.leftAnchor.constraint(equalTo: self.leftAnchor),
                    hostingView.rightAnchor.constraint(equalTo: self.rightAnchor),
                    hostingView.topAnchor.constraint(equalTo: self.topAnchor),
                    hostingView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
                ])
            }
            
            if animated {
                if let hostingControllerPrevious = hostingControllerPrevious {
                    
                    let transformLeft = CGAffineTransformMakeTranslation(-(bounds.width + CGFloat(safeAreaLeft)), 0.0)
                    let transformCenter = CGAffineTransform.identity
                    let transformRight = CGAffineTransformMakeTranslation(bounds.width + CGFloat(safeAreaRight), 0.0)
                    
                    let transformCurrentStart: CGAffineTransform
                    let transformCurrentFinish = transformCenter
                    
                    let transformPreviousStart = transformCenter
                    let transformPreviousFinish: CGAffineTransform
                    
                    if reversed {
                        transformCurrentStart = transformLeft
                        transformPreviousFinish = transformRight
                    } else {
                        transformCurrentStart = transformRight
                        transformPreviousFinish = transformLeft
                    }
                    
                    hostingControllerPrevious.view.transform = transformPreviousStart
                    hostingControllerCurrent.view.transform = transformCurrentStart
                    
                    UIView.animate(withDuration: 0.36) {
                        hostingControllerPrevious.view.transform = transformPreviousFinish
                        hostingControllerCurrent.view.transform = transformCurrentFinish
                    } completion: { _ in
                        self.killPreviousHostingController()
                        self.toolRow.removePreviousNodes()
                    }
                }
            }
        }
    }
    
    func killCurrentHostingController() {
        if let hostingControllerCurrent = hostingControllerCurrent {
            hostingControllerCurrent.view.layer.removeAllAnimations()
            hostingControllerCurrent.view.removeFromSuperview()
        }
        hostingControllerCurrent = nil
    }
    
    func killPreviousHostingController() {
        if let hostingControllerPrevious = hostingControllerPrevious {
            hostingControllerPrevious.view.layer.removeAllAnimations()
            hostingControllerPrevious.view.removeFromSuperview()
        }
        hostingControllerPrevious = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
