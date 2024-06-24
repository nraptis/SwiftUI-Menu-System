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

    let slot: ToolRowSlot
    var configuration = ToolRowConfiguration.unknown
    
    

    
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
    private(set) var centerPinnedElement: ToolInterfaceElement?
    
    func setNodes(_ nodes: [ToolNode],
                  animated: Bool,
                  reversed: Bool,
                  width: Int,
                  height: Int,
                  layoutStackingCategory: ToolInterfaceLayoutStackingCategory,
                  sliderLayoutSchemeFlavor: LayoutSchemeFlavor,
                  centerPinnedElement: ToolInterfaceElement?) {
        // This needs to trigger an animation... We are on view model layer...
        
        removePreviousNodes()
        
        for node in self.nodes {
            previousNodes.append(node)
        }
        
        self.nodes.removeAll(keepingCapacity: true)
        
        let nodeCount = nodes.count
        //let nodeCount1 = nodeCount - 1
        
        for nodeIndex in 0..<nodeCount {
            let node = nodes[nodeIndex]
            self.nodes.append(node)
        }
        
        self.centerPinnedElement = centerPinnedElement
        
        for node in nodes {
            if node.element == centerPinnedElement {
                node.isCenterPinned = true
                break
            }
        }
        
        nodesDidChangeIsAnimated = animated
        nodesDidChangeIsReversed = reversed
        
        layout(width: width,
               height: height,
               layoutStackingCategory: layoutStackingCategory,
               sliderLayoutSchemeFlavor: sliderLayoutSchemeFlavor)
        
        nodesDidChangePublisher.send(())
    }
    
    func getCenterPinnedNode() -> ToolNode? {
        if let centerPinnedElement = centerPinnedElement {
            for node in nodes {
                if node.element == centerPinnedElement {
                    return node
                }
            }
        }
        return nil
    }
    
    func removePreviousNodes() {
        previousNodes.removeAll(keepingCapacity: true)
    }
    
    init(slot: ToolRowSlot) {
        self.slot = slot
    }
    
    class LayoutNode {
        
        static func getAllWidthClassesInOrder() -> [WidthClass] {
            return [.high, .medium, .low]
        }
        
        enum WidthClass {
            case high
            case medium
            case low
        }
        var x = 0
        var width = 0
        var maximumWidthHigh = 0
        var maximumWidthMedium = 0
        var maximumWidthLow = 0
        var minimumWidth = 0
        var isShrinkable = false
        func getWidth(`class`: WidthClass) -> Int {
            switch `class` {
            case .high:
                return maximumWidthHigh
            case .medium:
                return maximumWidthMedium
            case .low:
                return maximumWidthLow
            }
        }
        
    }
    
    // Grow the "width" of each node, possibly shrinking node...
    @discardableResult private func cram(layoutNodes: [LayoutNode], into space: Int) -> Int {
        var consumedWidth = 0
        for layoutNode in layoutNodes {
            consumedWidth += layoutNode.width
        }
        if consumedWidth > space {
            print("Time-Zoo")
            shrink(layoutNodes: layoutNodes, into: space)
        } else if consumedWidth < space {
            print("Time-X")
            grow(layoutNodes: layoutNodes, into: space)
            
        }
        consumedWidth = 0
        for layoutNode in layoutNodes {
            consumedWidth += layoutNode.width
        }
        print("Crammed consumedWidth (\(consumedWidth)), space was: \(space)")
        return consumedWidth
    }
    
    // In this case, we *are* over-sized, let's grow as small as we can.
    private func shrink(layoutNodes: [LayoutNode], into space: Int) {
        var consumedWidth = 0
        for layoutNode in layoutNodes {
            consumedWidth += layoutNode.width
        }
        if consumedWidth <= space {
            print("FATAL!!! Shrink ***MUST*** exceed width already... Bad usage!!!")
            print("Nodes has \(layoutNodes.count), space was \(space), consumed is \(consumedWidth)")
            return
        }
        
        var fudge = 0
        var reloop = true
        
        while fudge < 2048 && reloop == true {
            reloop = false
            if consumedWidth > space {
                for layoutNode in layoutNodes {
                    if layoutNode.isShrinkable {
                        if layoutNode.width > 0 && consumedWidth > space {
                            layoutNode.width -= 1
                            consumedWidth -= 1
                            reloop = true
                        }
                    }
                }
            }
            fudge += 1
        }
    }
    
    // In this case, we are *not* over-sized, let's grow as big as we can.
    private func grow(layoutNodes: [LayoutNode], into space: Int) {
        var consumedWidth = 0
        for layoutNode in layoutNodes {
            consumedWidth += layoutNode.width
        }
        if consumedWidth > space {
            print("FATAL!!! Grow should ***NOT*** exceed width already... Bad usage!!! (1 Flavor)")
            print("Nodes has \(layoutNodes.count), space was \(space), consumed is \(consumedWidth)")
            return
        }
        
        let widthClasses = LayoutNode.getAllWidthClassesInOrder()
        for widthClass in widthClasses {
            var fudge = 0
            var reloop = true
            while fudge < 2048 && reloop == true {
                reloop = false
                for layoutNode in layoutNodes {
                    if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidth < space {
                        layoutNode.width += 1
                        consumedWidth += 1
                        reloop = true
                    }
                }
                fudge += 1
            }
        }
    }
    
    // In this case, we are *not* over-sized, let's grow as big as we can.
    private func grow(layoutNodes1: [LayoutNode], layoutNodes2: [LayoutNode], into space: Int) {
        var consumedWidth = 0
        for layoutNode in layoutNodes1 {
            consumedWidth += layoutNode.width
        }
        for layoutNode in layoutNodes2 {
            consumedWidth += layoutNode.width
        }
        if consumedWidth > space {
            print("FATAL!!! Grow should ***NOT*** exceed width already... Bad usage!!! (2 Flavor)")
            print("Nodes 1 has \(layoutNodes1.count), Nodes 2 has \(layoutNodes2.count), space was \(space), consumed is \(consumedWidth)")
            return
        }
        
        var layoutNodes = [LayoutNode]()
        layoutNodes.append(contentsOf: layoutNodes1)
        layoutNodes.append(contentsOf: layoutNodes2)
        
        grow(layoutNodes: layoutNodes, into: space)
    }
    
    // Here the nodes should have "width" calculated (e.g. call "cram" first...)
    func place(layoutNodes: [LayoutNode], into space: Int, startingAt x: Int) {
        
        var contentWidth = 0
        for layoutNode in layoutNodes {
            contentWidth += layoutNode.width
        }
        
        var layoutX = 0
        if contentWidth < space {
            layoutX = (space >> 1) - (contentWidth / 2)
        }
        
        for index in 0..<layoutNodes.count {
            layoutNodes[index].x = x + layoutX
            layoutX += layoutNodes[index].width
        }
    }
    
    private func place(layoutNodes1: [LayoutNode], layoutNodes2: [LayoutNode], into space: Int, startingAt x: Int) {
        var layoutNodes = [LayoutNode]()
        layoutNodes.append(contentsOf: layoutNodes1)
        layoutNodes.append(contentsOf: layoutNodes2)
        place(layoutNodes: layoutNodes, into: space, startingAt: x)
    }
    
    // In this case, we are *not* over-sized, let's grow as big as we can.
    private func cramAndPlace(layoutNodesLeft: [LayoutNode],
                              layoutNodeCenter: LayoutNode,
                              layoutNodesRight: [LayoutNode],
                              totalWidth: Int) {
        
        var consumedWidth = 0
        for layoutNode in layoutNodesLeft {
            consumedWidth += layoutNode.width
        }
        consumedWidth += layoutNodeCenter.width
        for layoutNode in layoutNodesRight {
            consumedWidth += layoutNode.width
        }
        if consumedWidth > totalWidth {
            print("FATAL!!! Cram+Place should ***NOT*** exceed width already... Bad usage!!!")
            print("Nodes Left has \(layoutNodesLeft.count), Nodes Right has \(layoutNodesRight.count), totalWidth was \(totalWidth), consumed is \(consumedWidth)")
            var layoutNodes = [LayoutNode]()
            for layoutNode in layoutNodesLeft {
                layoutNodes.append(layoutNode)
            }
            layoutNodes.append(layoutNodeCenter)
            for layoutNode in layoutNodesRight {
                layoutNodes.append(layoutNode)
            }
            place(layoutNodes: layoutNodes, into: totalWidth, startingAt: 0)
            return
        }
        
        var consumedWidthLeft = 0
        for layoutNode in layoutNodesLeft {
            consumedWidthLeft += layoutNode.width
        }
        var consumedWidthRight = 0
        for layoutNode in layoutNodesRight {
            consumedWidthRight += layoutNode.width
        }
        
        var centerItemLeft = (totalWidth >> 1) - (layoutNodeCenter.width >> 1)
        var availableSpaceLeftSide = centerItemLeft
        var availableSpaceRightSide = (totalWidth - (centerItemLeft + layoutNodeCenter.width))
        
        if availableSpaceLeftSide < consumedWidthLeft {
            print("FATAL!!! Cram+Place should ***NOT*** overflow on left... Bad usage!!!")
            print("Nodes Left has \(layoutNodesLeft.count), Nodes Right has \(layoutNodesRight.count), totalWidth was \(totalWidth), consumed is \(consumedWidth)")
            print("availableSpaceLeftSide is \(availableSpaceLeftSide), consumedWidthLeft is \(consumedWidthLeft)")
            var layoutNodes = [LayoutNode]()
            for layoutNode in layoutNodesLeft {
                layoutNodes.append(layoutNode)
            }
            layoutNodes.append(layoutNodeCenter)
            for layoutNode in layoutNodesRight {
                layoutNodes.append(layoutNode)
            }
            place(layoutNodes: layoutNodes, into: totalWidth, startingAt: 0)
            return
        }
        
        if availableSpaceRightSide < consumedWidthRight {
            print("FATAL!!! Cram+Place should ***NOT*** overflow on right... Bad usage!!!")
            print("Nodes Left has \(layoutNodesLeft.count), Nodes Right has \(layoutNodesRight.count), totalWidth was \(totalWidth), consumed is \(consumedWidth)")
            print("availableSpaceLeftSide is \(availableSpaceRightSide), consumedWidthRight is \(consumedWidthRight)")
            var layoutNodes = [LayoutNode]()
            for layoutNode in layoutNodesLeft {
                layoutNodes.append(layoutNode)
            }
            layoutNodes.append(layoutNodeCenter)
            for layoutNode in layoutNodesRight {
                layoutNodes.append(layoutNode)
            }
            place(layoutNodes: layoutNodes, into: totalWidth, startingAt: 0)
            return
        }
        
        let widthClasses = LayoutNode.getAllWidthClassesInOrder()
        
        
        // The first thing we want to do is evenly distribute points to...
        //
        //  a.) everything on the left
        //  b.) everything on the right
        //  c.) the center (tricky one)
        //
        // ...But we need to make sure we don't end up in illegal state...
        
        for widthClass in widthClasses {
            var fudge = 0
            var reloop = true
            var isLeftSide = false
            while fudge < 2048 && reloop == true {
                reloop = false
                
                if isLeftSide {
                    
                    // Can we expand into the left zone?
                    if consumedWidthLeft < availableSpaceLeftSide {
                        if layoutNodeCenter.width < layoutNodeCenter.getWidth(class: widthClass) {
                            availableSpaceLeftSide -= 1
                            centerItemLeft -= 1
                            layoutNodeCenter.width += 1
                        }
                    } else {
                        // Stop
                        break
                    }
                    isLeftSide = false
                } else {
                    
                    // Can we expand into the right zone?
                    if consumedWidthRight < availableSpaceRightSide {
                        if layoutNodeCenter.width < layoutNodeCenter.getWidth(class: widthClass) {
                            availableSpaceRightSide -= 1
                            layoutNodeCenter.width += 1
                        }
                    } else {
                        // Stop
                        break
                    }
                    isLeftSide = true
                }
                
                if consumedWidthLeft < availableSpaceLeftSide {
                    for layoutNode in layoutNodesLeft {
                        if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidthLeft < availableSpaceLeftSide {
                            layoutNode.width += 1
                            consumedWidthLeft += 1
                            reloop = true
                        }
                    }
                }
                
                if consumedWidthRight < availableSpaceRightSide {
                    for layoutNode in layoutNodesRight {
                        if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidthRight < availableSpaceRightSide {
                            layoutNode.width += 1
                            consumedWidthRight += 1
                            reloop = true
                        }
                    }
                }
                
                fudge += 1
            }
        }
        
        // Grow up the left...
        for widthClass in widthClasses {
            var fudge = 0
            var reloop = true
            while fudge < 2048 && reloop == true {
                reloop = false
                for layoutNode in layoutNodesLeft {
                    if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidthLeft < availableSpaceLeftSide {
                        layoutNode.width += 1
                        consumedWidthLeft += 1
                        reloop = true
                    }
                }
                fudge += 1
            }
        }
        
        // Grow up the right...
        for widthClass in widthClasses {
            var fudge = 0
            var reloop = true
            while fudge < 2048 && reloop == true {
                reloop = false
                for layoutNode in layoutNodesRight {
                    if layoutNode.width < layoutNode.getWidth(class: widthClass) && consumedWidthRight < availableSpaceRightSide {
                        layoutNode.width += 1
                        consumedWidthRight += 1
                        reloop = true
                    }
                }
                fudge += 1
            }
        }
        
        // Place the center one...
        layoutNodeCenter.x = centerItemLeft
        
        // Place the left nodes
        place(layoutNodes: layoutNodesLeft, into: availableSpaceLeftSide, startingAt: 0)
        
        // Place the right nodes
        place(layoutNodes: layoutNodesRight, into: availableSpaceRightSide, startingAt: availableSpaceLeftSide + layoutNodeCenter.width)
    }
    
    func layout(width: Int,
                height: Int,
                //safeAreaLeft: Int,
                //safeAreaRight: Int,
                layoutStackingCategory: ToolInterfaceLayoutStackingCategory,
                sliderLayoutSchemeFlavor: LayoutSchemeFlavor) {
        
        for node in nodes {
            node.magicalViewModel.layoutStackingCategory = layoutStackingCategory
            node.magicalViewModel.layoutSchemeFlavorSliders = sliderLayoutSchemeFlavor
        }
        
        print("layout(width = \(width) height = \(height))")
        
        //self.layoutStackingCategory = layoutStackingCategory
        
        let isSmall = layoutStackingCategory.isSmall
        let isMedium = layoutStackingCategory.isMedium
        
        let isSegmentLong = layoutStackingCategory.isSegmentLong
        let isCheckBoxLong = layoutStackingCategory.isCheckBoxLong
        let isTextIconButtonLong = layoutStackingCategory.isTextIconButtonLong
        
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
            case .segment(let flexSegmentData):
                if isSegmentLong {
                    layoutNode.width = flexSegmentData.minimumWidthLong
                    layoutNode.maximumWidthHigh = flexSegmentData.middle1WidthLong
                    layoutNode.maximumWidthMedium = flexSegmentData.middle2WidthLong
                    layoutNode.maximumWidthLow = flexSegmentData.maximumWidthLong
                } else {
                    if isSmall {
                        layoutNode.width = flexSegmentData.minimumWidthStackedSmall
                        layoutNode.maximumWidthHigh = flexSegmentData.middle1WidthStackedSmall
                        layoutNode.maximumWidthMedium = flexSegmentData.middle2WidthStackedSmall
                        layoutNode.maximumWidthLow = flexSegmentData.maximumWidthStackedSmall
                    } else if isMedium {
                        layoutNode.width = flexSegmentData.minimumWidthStackedMedium
                        layoutNode.maximumWidthHigh = flexSegmentData.middle1WidthStackedMedium
                        layoutNode.maximumWidthMedium = flexSegmentData.middle2WidthStackedMedium
                        layoutNode.maximumWidthLow = flexSegmentData.maximumWidthStackedMedium
                    } else {
                        layoutNode.width = flexSegmentData.minimumWidthStackedLarge
                        layoutNode.maximumWidthHigh = flexSegmentData.middle1WidthStackedLarge
                        layoutNode.maximumWidthMedium = flexSegmentData.middle2WidthStackedLarge
                        layoutNode.maximumWidthLow = flexSegmentData.maximumWidthStackedLarge
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
        
        
        // Let's figure out if we need to center one of the elements...
        
        var layoutNodesLeft = [LayoutNode]()
        var layoutNodeCenterPinnedElement: LayoutNode?
        var layoutNodesRight = [LayoutNode]()
        if let centerPinnedElement = centerPinnedElement {
            var centerIndex = -1
            for index in 0..<nodes.count {
                let node = nodes[index]
                if node.element == centerPinnedElement {
                    centerIndex = index
                    //toolNodeCenterPinnedElement = nodes[index]
                    layoutNodeCenterPinnedElement = layoutNodes[index]
                    break
                }
            }
            if centerIndex != -1 {
                var index = 0
                while index < centerIndex {
                    layoutNodesLeft.append(layoutNodes[index])
                    //toolNodesLeft.append(nodes[index])
                    index += 1
                }
                index = centerIndex + 1
                while index < nodes.count {
                    layoutNodesRight.append(layoutNodes[index])
                    //toolNodesRight.append(nodes[index])
                    index += 1
                }
            }
        }
        
        if let layoutNodeCenterPinnedElement = layoutNodeCenterPinnedElement {
            
            // 1.) Let's put this layout into 1 of 4 categories.
            //   a.) It will work fine with the center element exactly centered.
            //   b.) It will work fine, but the content on the left will need to nudge the center content.
            //   c.) It will work fine, but the content on the right will need to nudge the center content.
            //   d.) The layout will not work;
            
            var consumedWidthLeft = 0
            for index in 0..<layoutNodesLeft.count {
                consumedWidthLeft += layoutNodesLeft[index].width
            }
            
            var consumedWidthRight = 0
            for index in 0..<layoutNodesRight.count {
                consumedWidthRight += layoutNodesRight[index].width
            }
            
            if (consumedWidthLeft + layoutNodeCenterPinnedElement.width + consumedWidthRight) > totalWidth {
                print("Case D: None of this sh** will fit... ")
                cram(layoutNodes: layoutNodes, into: width)
                place(layoutNodes: layoutNodes, into: width, startingAt: 0)
            } else {
                let centerItemLeft = (totalWidth >> 1) - (layoutNodeCenterPinnedElement.width >> 1)
                let availableSpaceLeftSide = centerItemLeft
                let availableSpaceRightSide = (totalWidth - (centerItemLeft + layoutNodeCenterPinnedElement.width))
                if consumedWidthLeft > availableSpaceLeftSide {
                    print("Case B: This will fit, but the left is too big... ")
                    
                    layoutNodesLeft.append(layoutNodeCenterPinnedElement)
                    let leftPackingWidth = consumedWidthLeft + layoutNodeCenterPinnedElement.width
                    let rightPackingWidth = totalWidth - leftPackingWidth
                    
                    cram(layoutNodes: layoutNodesLeft, into: leftPackingWidth)
                    place(layoutNodes: layoutNodesLeft, into: leftPackingWidth, startingAt: 0)
                    
                    cram(layoutNodes: layoutNodesRight, into: rightPackingWidth)
                    place(layoutNodes: layoutNodesRight, into: rightPackingWidth, startingAt: leftPackingWidth)
                    
                } else if consumedWidthRight > availableSpaceRightSide {
                    print("Case C: This will fit, but the right is too big... ")
                    
                    layoutNodesRight.insert(layoutNodeCenterPinnedElement, at: 0)
                    let rightPackingWidth = consumedWidthRight + layoutNodeCenterPinnedElement.width
                    let leftPackingWidth = totalWidth - rightPackingWidth
                    
                    cram(layoutNodes: layoutNodesLeft, into: leftPackingWidth)
                    place(layoutNodes: layoutNodesLeft, into: leftPackingWidth, startingAt: 0)
                    
                    cram(layoutNodes: layoutNodesRight, into: rightPackingWidth)
                    place(layoutNodes: layoutNodesRight, into: rightPackingWidth, startingAt: leftPackingWidth)
                    
                } else {
                    print("Case A: This will fit, and we can keep centered... ")
                    cramAndPlace(layoutNodesLeft: layoutNodesLeft,
                                 layoutNodeCenter: layoutNodeCenterPinnedElement,
                                 layoutNodesRight: layoutNodesRight,
                                 totalWidth: totalWidth)
                }
            }
        } else {
            cram(layoutNodes: layoutNodes, into: totalWidth)
            place(layoutNodes: layoutNodes, into: totalWidth, startingAt: 0)
        }
        
        for index in 0..<nodes.count {
            let layoutNode = layoutNodes[index]
            let node = nodes[index]
            node.layoutX = layoutNode.x
            node.layoutY = 0
            node.layoutWidth = layoutNode.width
            node.layoutHeight = height
        }
        
        for index in 0..<nodes.count {
            let node = nodes[index]
            node.magicalViewModel.refreshLayoutFrame()
        }
        
        _widthConstraint?.constant = CGFloat(width)
    }
}
