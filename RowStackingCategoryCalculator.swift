//
//  RowStackingCategoryCalculator.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation

class RowStackingCategoryCalculator {
    
    let orientation: Orientation
    let nodes: [ToolNode]
    let centerPinnedNode: ToolNode?
    init(orientation: Orientation,
         rowBluePrint: ToolInterfaceViewModel.RowBluePrint) {
        self.orientation = orientation
        self.nodes = rowBluePrint.nodes
        self.centerPinnedNode = rowBluePrint.getCenterPinnedNode()
    }
    
    func getStandardWidth(node: ToolNode,
                          width: Int,
                          layoutStackingCategory: ToolInterfaceLayoutStackingCategory) -> Int {
        switch node.flex {
        case .fixed(let fixedWidth):
            return fixedWidth
        case .spacer(let flexSpacerData):
            return flexSpacerData.defaultWidth
        case .divider(let flexDividerData):
            return flexDividerData.standardWidth
        case .dividerSpacerDivider(let flexDividerData):
            return flexDividerData.standardWidth
        case .iconButton(let flexIconButtonData):
            return flexIconButtonData.standardWidth
        case .textIconButton(let flexTextIconButtonData):
            if layoutStackingCategory.isTextIconButtonLong {
                return flexTextIconButtonData.standardWidthLong
            } else {
                if layoutStackingCategory.isSmall {
                    return flexTextIconButtonData.standardWidthStackedSmall
                } else if layoutStackingCategory.isMedium {
                    return flexTextIconButtonData.standardWidthStackedMedium
                } else {
                    return flexTextIconButtonData.standardWidthStackedLarge
                }
            }
        case .segment(let flexSegmentData):
            
            if layoutStackingCategory.isSegmentLong {
                return flexSegmentData.middle2WidthLong
            } else {
                if layoutStackingCategory.isSmall {
                    return flexSegmentData.middle2WidthStackedSmall
                } else if layoutStackingCategory.isMedium {
                    return flexSegmentData.middle2WidthStackedMedium
                } else {
                    return flexSegmentData.middle2WidthStackedLarge
                }
            }
        case .slider(let flexSliderData):
            switch flexSliderData.widthCategory {
            case .fullWidth:
                return width
            case .halfWidthLeft:
                return (width / 2)
            case .halfWidthRight:
                return (width - (width / 2))
            }
        case .checkBox(let flexCheckBoxData):
            
            if layoutStackingCategory.isCheckBoxLong {
                return flexCheckBoxData.standardWidthLong
            } else {
                if layoutStackingCategory.isSmall {
                    return flexCheckBoxData.standardWidthStackedSmall
                } else if layoutStackingCategory.isMedium {
                    return flexCheckBoxData.standardWidthStackedMedium
                } else {
                    return flexCheckBoxData.standardWidthStackedLarge
                }
            }
        }
    }
     
    func doesSupportLayoutStackingCategory(layoutStackingCategory: ToolInterfaceLayoutStackingCategory,
                                           width: Int,
                                           height: Int) -> Bool {
        if let centerPinnedNode = centerPinnedNode {
            
            var nodesLeft = [ToolNode]()
            var nodesRight = [ToolNode]()
            
            var nodeIndex = 0
            while nodeIndex < nodes.count {
                let node = nodes[nodeIndex]
                if node === centerPinnedNode {
                    nodeIndex += 1
                    break
                } else {
                    nodesLeft.append(node)
                    nodeIndex += 1
                }
            }
            while nodeIndex < nodes.count {
                let node = nodes[nodeIndex]
                nodesRight.append(node)
                nodeIndex += 1
            }
            
            print("nodesLeft => \(nodesLeft.count)")
            print("nodesRight => \(nodesRight.count)")
            
            let centerNodeWidth = getStandardWidth(node: centerPinnedNode,
                                                   width: width,
                                                   layoutStackingCategory: layoutStackingCategory)
            let centerItemLeft = (width >> 1) - (centerNodeWidth >> 1)
            let availableSpaceLeftSide = centerItemLeft
            let availableSpaceRightSide = (width - (centerItemLeft + centerNodeWidth))
            
            var consumedWidthLeft = 0
            for node in nodesLeft {
                consumedWidthLeft += getStandardWidth(node: node,
                                                      width: width,
                                                      layoutStackingCategory: layoutStackingCategory)
            }
            if consumedWidthLeft > availableSpaceLeftSide {
                print("left overflow on \(layoutStackingCategory)")
                return false
            }
            var consumedWidthRight = 0
            for node in nodesRight {
                consumedWidthRight += getStandardWidth(node: node,
                                                      width: width,
                                                      layoutStackingCategory: layoutStackingCategory)
            }
            if consumedWidthRight > availableSpaceRightSide {
                print("right overflow on \(layoutStackingCategory)")
                return false
            }
            print("clean on \(layoutStackingCategory)")
            return true
        } else {
            var consumedWidth = 0
            for node in nodes {
                consumedWidth += getStandardWidth(node: node,
                                                  width: width,
                                                  layoutStackingCategory: layoutStackingCategory)
            }
            if consumedWidth <= width {
                return true
            } else {
                return false
            }
        }
    }
    
    func computeSliderLayoutSchemeFlavor(width: Int,
                                         height: Int,
                                         safeAreaLeft: Int,
                                         safeAreaRight: Int) -> LayoutSchemeFlavor {
        var result = LayoutSchemeFlavor.getMax()
        for node in nodes {
            if node.type == .slider {
                if let magicalSliderViewModel = node.magicalViewModel as? MagicalSliderViewModel {
                    let sliderConfiguration = magicalSliderViewModel.sliderConfiguration
                    let layoutSchemeFlavor = computeSliderLayoutSchemeFlavor(node: node,
                                                                             sliderConfiguration: sliderConfiguration,
                                                                             width: width,
                                                                             height: height,
                                                                             safeAreaLeft: safeAreaLeft,
                                                                             safeAreaRight: safeAreaRight)
                    if layoutSchemeFlavor < result {
                        result = layoutSchemeFlavor
                    }
                }
            }
        }
        return result
    }
    
    func computeSliderLayoutSchemeFlavor(node: ToolNode,
                                         sliderConfiguration: ToolInterfaceElementSliderConfiguration,
                                         width: Int,
                                         height: Int,
                                         safeAreaLeft: Int,
                                         safeAreaRight: Int) -> LayoutSchemeFlavor {
        
        let neighborTypeLeft = node.neighborTypeLeft
        let neighborTypeRight = node.neighborTypeRight
        

        let universalPaddingLeftStandard = SliderLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                flavor: .stackedLarge,
                                                                                squeeze: .standard,
                                                                                neighborTypeLeft: neighborTypeLeft,
                                                                                neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStandard = SliderLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                  flavor: .stackedLarge,
                                                                                  squeeze: .standard,
                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                  neighborTypeRight: neighborTypeRight)
        let nameLabelPaddingLeftStandard = SliderLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                flavor: .stackedLarge,
                                                                                squeeze: .standard)
        let nameLabelPaddingRightStandard = SliderLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                  flavor: .stackedLarge,
                                                                                  squeeze: .standard)
        let valueLabelPaddingLeftStandard = SliderLayout.getValueLabelPaddingLeft(orientation: orientation,
                                                                                  flavor: .stackedLarge,
                                                                                  squeeze: .standard)
        let valueLabelPaddingRightStandard = SliderLayout.getValueLabelPaddingRight(orientation: orientation,
                                                                                    flavor: .stackedLarge,
                                                                                    squeeze: .standard)
        
        let nameLabelWidthLarge = sliderConfiguration.layoutNameLabelWidthLarge
        let valueLabelWidthLarge = sliderConfiguration.valueLabelWidthLarge
        let nameLabelWidthMedium = sliderConfiguration.layoutNameLabelWidthMedium
        let valueLabelWidthMedium = sliderConfiguration.valueLabelWidthMedium
        let nameLabelWidthSmall = sliderConfiguration.layoutNameLabelWidthSmall
        let valueLabelWidthSmall = sliderConfiguration.valueLabelWidthSmall
        
        let nameLabelSpaceLarge = nameLabelWidthLarge + nameLabelPaddingLeftStandard + nameLabelPaddingRightStandard
        let nameLabelSpaceMedium = nameLabelWidthMedium + nameLabelPaddingLeftStandard + nameLabelPaddingRightStandard
        let nameLabelSpaceSmall = nameLabelWidthSmall + nameLabelPaddingLeftStandard + nameLabelPaddingRightStandard
        
        let valueLabelSpaceLarge = valueLabelWidthLarge + valueLabelPaddingLeftStandard + valueLabelPaddingRightStandard
        let valueLabelSpaceMedium = valueLabelWidthMedium + valueLabelPaddingLeftStandard + valueLabelPaddingRightStandard
        let valueLabelSpaceSmall = valueLabelWidthSmall + valueLabelPaddingLeftStandard + valueLabelPaddingRightStandard
        
        let preferredMinimumBarWidth = SliderLayout.getPreferredMinimumBarWidth(orientation: orientation,
                                                                                widthCategory: sliderConfiguration.widthCategory)
        
        var proposedLargeWidth = 0
        proposedLargeWidth += universalPaddingLeftStandard
        proposedLargeWidth += nameLabelSpaceLarge
        proposedLargeWidth += preferredMinimumBarWidth
        proposedLargeWidth += valueLabelSpaceLarge
        proposedLargeWidth += universalPaddingRightStandard
        
        var proposedMediumWidth = 0
        proposedMediumWidth += universalPaddingLeftStandard
        proposedMediumWidth += nameLabelSpaceMedium
        proposedMediumWidth += preferredMinimumBarWidth
        proposedMediumWidth += valueLabelSpaceMedium
        proposedMediumWidth += universalPaddingRightStandard
        
        var proposedSmallWidth = 0
        proposedSmallWidth += universalPaddingLeftStandard
        proposedSmallWidth += nameLabelSpaceSmall
        proposedSmallWidth += preferredMinimumBarWidth
        proposedSmallWidth += valueLabelSpaceSmall
        proposedSmallWidth += universalPaddingRightStandard
        
        let totalWidth = width
        let availableSpace: Int
        switch sliderConfiguration.widthCategory {
        case .fullWidth:
            availableSpace = totalWidth
        case .halfWidthLeft:
            availableSpace = totalWidth / 2
        case .halfWidthRight:
            availableSpace = totalWidth - (totalWidth / 2)
        }
        
        if availableSpace >= proposedLargeWidth {
            return .stackedLarge
        } else if availableSpace >= proposedMediumWidth {
            return .stackedMedium
        } else {
            return .stackedSmall
        }
    }
}
