//
//  ToolRow.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/13/24.
//

import Foundation
import UIKit
import Combine

class ToolRow {
    
    
    var updatePublisher = PassthroughSubject<Void, Never>()
    
    var nodesDidChangePublisher = PassthroughSubject<Void, Never>()
    var nodesDidChangeIsAnimated = false
    var nodesDidChangeIsReversed = false
    
    var _widthConstraint: NSLayoutConstraint?
    func getWidthConstraint(_ view: UIView) -> NSLayoutConstraint {
        if let result = _widthConstraint {
            return result
        }
        let result = NSLayoutConstraint(item: view,
                                        attribute: .width,
                                        relatedBy: .equal,
                                        toItem: nil,
                                        attribute: .notAnAttribute,
                                        multiplier: 1.0,
                                        constant: 320.0)
        _widthConstraint = result
        return result
    }
    
    private(set) var previousNodes = [ToolNode]()
    private(set) var nodes = [ToolNode]()
    
    func setNodes(_ nodes: [ToolNode],
                  animated: Bool,
                  reversed: Bool,
                  width: Int,
                  height: Int,
                  safeAreaLeft: Int,
                  safeAreaRight: Int,
                  layoutStackingCategory: ToolInterfaceLayoutStackingCategory,
                  sliderLayoutSchemeFlavor: LayoutSchemeFlavor) {
        // This needs to trigger an animation... We are on view model layer...
        
        removePreviousNodes()
        
        for node in self.nodes {
            previousNodes.append(node)
        }
        
        self.nodes.removeAll(keepingCapacity: true)
        
        let nodeCount = nodes.count
        let nodeCount1 = nodeCount - 1
        
        for nodeIndex in 0..<nodeCount {
            
            let node = nodes[nodeIndex]
            
            if nodeIndex > 0 {
                node.neighborTypeLeft = nodes[nodeIndex - 1].type
            } else {
                node.neighborTypeLeft = nil
            }
            
            if nodeIndex < nodeCount1 {
                node.neighborTypeRight = nodes[nodeIndex + 1].type
            } else {
                node.neighborTypeRight = nil
            }
            
            self.nodes.append(node)
        }
        
        nodesDidChangeIsAnimated = animated
        nodesDidChangeIsReversed = reversed
        
        layout(width: width,
               height: height,
               safeAreaLeft: 0,
               safeAreaRight: 0,
               layoutStackingCategory: layoutStackingCategory,
               sliderLayoutSchemeFlavor: sliderLayoutSchemeFlavor)
        
        nodesDidChangePublisher.send(())
    }
    
    func removePreviousNodes() {
        previousNodes.removeAll(keepingCapacity: true)
    }
    
    let toolInterfaceRow: ToolInterfaceRow
    init(toolInterfaceRow: ToolInterfaceRow) {
        self.toolInterfaceRow = toolInterfaceRow
    }
    
    class LayoutNode {
        var width = 0
        var maximumWidthHigh = 0
        var maximumWidthMedium = 0
        var maximumWidthLow = 0
        var minimumWidth = 0
        var isShrinkable = false
    }
    
    func layout(width: Int,
                height: Int,
                safeAreaLeft: Int,
                safeAreaRight: Int,
                layoutStackingCategory: ToolInterfaceLayoutStackingCategory,
                sliderLayoutSchemeFlavor: LayoutSchemeFlavor) {
        //self.width = width
        //self.height = height
        
        print("layout(width = \(width) height = \(height) safeAreaLeft = \(safeAreaLeft) safeAreaRight = \(safeAreaRight))")
        
        //self.layoutStackingCategory = layoutStackingCategory
        
        let isSmall = layoutStackingCategory.isSmall
        let isMedium = layoutStackingCategory.isMedium
        
        let isSegmentLong = layoutStackingCategory.isSegmentLong
        let isCheckBoxLong = layoutStackingCategory.isCheckBoxLong
        let isTextIconButtonLong = layoutStackingCategory.isTextIconButtonLong
        
        // Note: This SHOULD work... It creates a time differential race condition...
        /*
        for node in nodes {
            node.layoutSchemeFlavor = layoutStackingCategory.getLayoutSchemeFlavor(toolInterfaceElementType: node.element.type)
        }
        */
        
        var layoutNodes = [LayoutNode]()
        
        let totalWidth = width
        
        for node in nodes {
            let layoutNode = LayoutNode()
            switch node.flex {
                
            case .slider(let flexSliderData):
                let width: Int
                switch flexSliderData.widthCategory {
                case .fullWidth:
                    width = totalWidth
                case .halfWidthLeft:
                    width = totalWidth / 2
                case .halfWidthRight:
                    width = totalWidth - (totalWidth / 2)
                }
                layoutNode.width = width
                layoutNode.maximumWidthHigh = width
                layoutNode.maximumWidthMedium = width
                layoutNode.maximumWidthLow = width
                layoutNode.minimumWidth = width
                layoutNode.isShrinkable = false
            case .dividerSpacerDivider(let flexDividerData):
                layoutNode.width = flexDividerData.minimumWidth
                layoutNode.maximumWidthHigh = flexDividerData.minimumWidth
                layoutNode.maximumWidthMedium = flexDividerData.standardWidth
                layoutNode.maximumWidthLow = 100_000_000
            case .divider(let flexDividerData):
                layoutNode.width = flexDividerData.minimumWidth
                layoutNode.maximumWidthHigh = flexDividerData.minimumWidth
                layoutNode.maximumWidthMedium = flexDividerData.standardWidth
                layoutNode.maximumWidthLow = flexDividerData.standardWidth
            case .iconButton(let flexIconButtonData):
                layoutNode.width = flexIconButtonData.minimumWidth
                layoutNode.maximumWidthHigh = flexIconButtonData.standardWidth
                layoutNode.maximumWidthMedium = flexIconButtonData.standardWidth
                layoutNode.maximumWidthLow = flexIconButtonData.maximumWidth
            case .textIconButton(let flexTextIconButtonData):
                if isTextIconButtonLong {
                    layoutNode.width = flexTextIconButtonData.minimumWidthLong
                    layoutNode.maximumWidthHigh = flexTextIconButtonData.standardWidthLong
                    layoutNode.maximumWidthMedium = flexTextIconButtonData.standardWidthLong
                    layoutNode.maximumWidthLow = flexTextIconButtonData.maximumWidthLong
                } else {
                    if isSmall {
                        layoutNode.width = flexTextIconButtonData.minimumWidthStackedSmall
                        layoutNode.maximumWidthHigh = flexTextIconButtonData.standardWidthStackedSmall
                        layoutNode.maximumWidthMedium = flexTextIconButtonData.standardWidthStackedSmall
                        layoutNode.maximumWidthLow = flexTextIconButtonData.maximumWidthStackedSmall
                    } else if isMedium {
                        layoutNode.width = flexTextIconButtonData.minimumWidthStackedMedium
                        layoutNode.maximumWidthHigh = flexTextIconButtonData.standardWidthStackedMedium
                        layoutNode.maximumWidthMedium = flexTextIconButtonData.standardWidthStackedMedium
                        layoutNode.maximumWidthLow = flexTextIconButtonData.maximumWidthStackedMedium
                    } else {
                        layoutNode.width = flexTextIconButtonData.minimumWidthStackedLarge
                        layoutNode.maximumWidthHigh = flexTextIconButtonData.standardWidthStackedLarge
                        layoutNode.maximumWidthMedium = flexTextIconButtonData.standardWidthStackedLarge
                        layoutNode.maximumWidthLow = flexTextIconButtonData.maximumWidthStackedLarge
                    }
                }
                layoutNode.isShrinkable = false
            case .checkBox(let flexCheckBoxData):
                if isCheckBoxLong {
                    layoutNode.width = flexCheckBoxData.minimumWidthLong
                    layoutNode.maximumWidthHigh = flexCheckBoxData.standardWidthLong
                    layoutNode.maximumWidthMedium = flexCheckBoxData.standardWidthLong
                    layoutNode.maximumWidthLow = flexCheckBoxData.maximumWidthLong
                } else {
                    if isSmall {
                        layoutNode.width = flexCheckBoxData.minimumWidthStackedSmall
                        layoutNode.maximumWidthHigh = flexCheckBoxData.standardWidthStackedSmall
                        layoutNode.maximumWidthMedium = flexCheckBoxData.standardWidthStackedSmall
                        layoutNode.maximumWidthLow = flexCheckBoxData.maximumWidthStackedSmall
                    } else if isMedium {
                        layoutNode.width = flexCheckBoxData.minimumWidthStackedMedium
                        layoutNode.maximumWidthHigh = flexCheckBoxData.standardWidthStackedMedium
                        layoutNode.maximumWidthMedium = flexCheckBoxData.standardWidthStackedMedium
                        layoutNode.maximumWidthLow = flexCheckBoxData.maximumWidthStackedMedium
                    } else {
                        layoutNode.width = flexCheckBoxData.minimumWidthStackedLarge
                        layoutNode.maximumWidthHigh = flexCheckBoxData.standardWidthStackedLarge
                        layoutNode.maximumWidthMedium = flexCheckBoxData.standardWidthStackedLarge
                        layoutNode.maximumWidthLow = flexCheckBoxData.maximumWidthStackedLarge
                    }
                }
                
                layoutNode.isShrinkable = false
            case .segment(let flexSegmentedPickerData):
                if isSegmentLong {
                    layoutNode.width = flexSegmentedPickerData.minimumWidthLong
                    layoutNode.maximumWidthHigh = flexSegmentedPickerData.middle1WidthLong
                    layoutNode.maximumWidthMedium = flexSegmentedPickerData.middle2WidthLong
                    layoutNode.maximumWidthLow = flexSegmentedPickerData.maximumWidthLong
                } else {
                    if isSmall {
                        layoutNode.width = flexSegmentedPickerData.minimumWidthStackedSmall
                        layoutNode.maximumWidthHigh = flexSegmentedPickerData.middle1WidthStackedSmall
                        layoutNode.maximumWidthMedium = flexSegmentedPickerData.middle2WidthStackedSmall
                        layoutNode.maximumWidthLow = flexSegmentedPickerData.maximumWidthStackedSmall
                    } else if isMedium {
                        layoutNode.width = flexSegmentedPickerData.minimumWidthStackedMedium
                        layoutNode.maximumWidthHigh = flexSegmentedPickerData.middle1WidthStackedMedium
                        layoutNode.maximumWidthMedium = flexSegmentedPickerData.middle2WidthStackedMedium
                        layoutNode.maximumWidthLow = flexSegmentedPickerData.maximumWidthStackedMedium
                    } else {
                        layoutNode.width = flexSegmentedPickerData.minimumWidthStackedLarge
                        layoutNode.maximumWidthHigh = flexSegmentedPickerData.middle1WidthStackedLarge
                        layoutNode.maximumWidthMedium = flexSegmentedPickerData.middle2WidthStackedLarge
                        layoutNode.maximumWidthLow = flexSegmentedPickerData.maximumWidthStackedLarge
                    }
                }
                layoutNode.isShrinkable = false
            case .fixed(let fixedWidth):
                layoutNode.width = fixedWidth
                layoutNode.maximumWidthHigh = fixedWidth
                layoutNode.maximumWidthMedium = fixedWidth
                layoutNode.maximumWidthLow = fixedWidth
                layoutNode.isShrinkable = false
            case .spacer(let flexSpacerData):
                layoutNode.width = flexSpacerData.defaultWidth
                layoutNode.maximumWidthHigh = flexSpacerData.defaultWidth
                layoutNode.maximumWidthMedium = flexSpacerData.defaultWidth
                layoutNode.maximumWidthLow = 100_000_000
                layoutNode.isShrinkable = true
            }
            layoutNodes.append(layoutNode)
        }
        
        var loops = 0
        while true {
            
            loops += 1
            
            var consumedWidth = 0
            for layoutNode in layoutNodes {
                consumedWidth += layoutNode.width
            }
            
            if consumedWidth == totalWidth {
                break
            } else if consumedWidth < totalWidth {
                
                var didSpendWidth = false
                
                if didSpendWidth == false {
                    var reloop = true
                    while reloop == true {
                        reloop = false
                        for layoutNode in layoutNodes {
                            if layoutNode.width < layoutNode.maximumWidthHigh && consumedWidth < totalWidth {
                                layoutNode.width += 1
                                consumedWidth += 1
                                didSpendWidth = true
                                reloop = true
                            }
                        }
                    }
                }
                if didSpendWidth == false {
                    var reloop = true
                    while reloop == true {
                        reloop = false
                        for layoutNode in layoutNodes {
                            if layoutNode.width < layoutNode.maximumWidthMedium && consumedWidth < totalWidth {
                                layoutNode.width += 1
                                consumedWidth += 1
                                didSpendWidth = true
                                reloop = true
                            }
                        }
                    }
                }
                if didSpendWidth == false {
                    var reloop = true
                    while reloop == true {
                        reloop = false
                        for layoutNode in layoutNodes {
                            if layoutNode.width < layoutNode.maximumWidthLow && consumedWidth < totalWidth {
                                layoutNode.width += 1
                                consumedWidth += 1
                                didSpendWidth = true
                                reloop = true
                            }
                        }
                        
                    }
                }
                
                if didSpendWidth == false {
                    break
                }
            } else {
                
                print("In This Case, We Should *** SHRINK *** What We Can...")
                
                var reloop = true
                while reloop == true {
                    reloop = false
                    for layoutNode in layoutNodes {
                        if layoutNode.isShrinkable {
                            if layoutNode.width > 0 && consumedWidth > totalWidth {
                                layoutNode.width -= 1
                                consumedWidth -= 1
                                reloop = true
                            }
                        }
                    }
                }
                break
            }
        }
        
        var contentWidth = 0
        for layoutNode in layoutNodes {
            contentWidth += layoutNode.width
        }
        
        var layoutX = 0
        let centerX = (width >> 1)
        
        if contentWidth != totalWidth {
            layoutX = centerX - (contentWidth / 2)
            if layoutX < 0 { layoutX = 0 }
        }
        
        for index in 0..<nodes.count {
            let layoutNode = layoutNodes[index]
            let node = nodes[index]
            
            node.layoutX = layoutX
            node.layoutY = 0
            node.layoutWidth = layoutNode.width
            node.layoutHeight = height
            
            layoutX += layoutNode.width
        }
        
        for index in 0..<nodes.count {
            let node = nodes[index]
            node.magicalViewModel.refreshLayoutFrame()
        }
        
        _widthConstraint?.constant = CGFloat(width)
    }
}
