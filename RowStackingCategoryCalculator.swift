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
    init(orientation: Orientation, nodes: [ToolNode]) {
        self.orientation = orientation
        self.nodes = nodes
    }
    
    var spaceTextIconButtonsLongSqueezed = 0
    var spaceTextIconButtonsLongStandard = 0
    var spaceTextIconButtonsStackedLargeSqueezed = 0
    var spaceTextIconButtonsStackedLargeStandard = 0
    var spaceTextIconButtonsStackedMediumSqueezed = 0
    var spaceTextIconButtonsStackedMediumStandard = 0
    var spaceTextIconButtonsStackedSmallSqueezed = 0
    var spaceTextIconButtonsStackedSmallStandard = 0
    
    var spaceSegmentsLongSqueezed = 0
    var spaceSegmentsLongStandard = 0
    var spaceSegmentsStackedLargeSqueezed = 0
    var spaceSegmentsStackedLargeStandard = 0
    var spaceSegmentsStackedMediumSqueezed = 0
    var spaceSegmentsStackedMediumStandard = 0
    var spaceSegmentsStackedSmallSqueezed = 0
    var spaceSegmentsStackedSmallStandard = 0
    
    var spaceCheckBoxesLongSqueezed = 0
    var spaceCheckBoxesLongStandard = 0
    var spaceCheckBoxesStackedLargeSqueezed = 0
    var spaceCheckBoxesStackedLargeStandard = 0
    var spaceCheckBoxesStackedMediumSqueezed = 0
    var spaceCheckBoxesStackedMediumStandard = 0
    var spaceCheckBoxesStackedSmallSqueezed = 0
    var spaceCheckBoxesStackedSmallStandard = 0
    
    var spaceIconButtonsSqueezed = 0
    var spaceIconButtonsStandard = 0
    
    var spaceDividerSpacerDividersSqueezed = 0
    var spaceDividerSpacerDividersStandard = 0
    
    var spaceDividersSqueezed = 0
    var spaceDividersStandard = 0
    
    var spaceSliders = 0
    
    var spaceSpacers = 0
    
    var spaceFixed = 0
    
    func measure(width: Int,
                 height: Int,
                 safeAreaLeft: Int,
                 safeAreaRight: Int) {
        
        spaceSliders = 0
        
        spaceFixed = 0
        
        spaceSpacers = 0
        
        spaceDividersSqueezed = 0
        spaceDividersStandard = 0
        
        spaceDividerSpacerDividersSqueezed = 0
        spaceDividerSpacerDividersStandard = 0
        
        spaceIconButtonsSqueezed = 0
        spaceIconButtonsStandard = 0
        
        spaceTextIconButtonsLongSqueezed = 0
        spaceTextIconButtonsLongStandard = 0
        spaceTextIconButtonsStackedLargeSqueezed = 0
        spaceTextIconButtonsStackedLargeStandard = 0
        spaceTextIconButtonsStackedMediumSqueezed = 0
        spaceTextIconButtonsStackedMediumStandard = 0
        spaceTextIconButtonsStackedSmallSqueezed = 0
        spaceTextIconButtonsStackedSmallStandard = 0
        
        spaceSegmentsLongSqueezed = 0
        spaceSegmentsLongStandard = 0
        spaceSegmentsStackedLargeSqueezed = 0
        spaceSegmentsStackedLargeStandard = 0
        spaceSegmentsStackedMediumSqueezed = 0
        spaceSegmentsStackedMediumStandard = 0
        spaceSegmentsStackedSmallSqueezed = 0
        spaceSegmentsStackedSmallStandard = 0
        
        spaceCheckBoxesLongSqueezed = 0
        spaceCheckBoxesLongStandard = 0
        spaceCheckBoxesStackedLargeSqueezed = 0
        spaceCheckBoxesStackedLargeStandard = 0
        spaceCheckBoxesStackedMediumSqueezed = 0
        spaceCheckBoxesStackedMediumStandard = 0
        spaceCheckBoxesStackedSmallSqueezed = 0
        spaceCheckBoxesStackedSmallStandard = 0
        
        for node in nodes {
            
            switch node.flex {
            case .fixed(let fixedWidth):
                spaceFixed += fixedWidth
            case .spacer(let flexSpacerData):
                spaceSpacers += flexSpacerData.defaultWidth
            case .divider(let flexDividerData):
                spaceDividersSqueezed += flexDividerData.minimumWidth
                spaceDividersStandard += flexDividerData.standardWidth
            case .dividerSpacerDivider(let flexDividerData):
                spaceDividerSpacerDividersSqueezed += flexDividerData.minimumWidth
                spaceDividerSpacerDividersStandard += flexDividerData.standardWidth
            case .iconButton(let flexIconButtonData):
                spaceIconButtonsSqueezed += flexIconButtonData.minimumWidth
                spaceIconButtonsStandard += flexIconButtonData.standardWidth
            case .textIconButton(let flexTextIconButtonData):
                
                spaceTextIconButtonsLongSqueezed += flexTextIconButtonData.minimumWidthLong
                spaceTextIconButtonsLongStandard += flexTextIconButtonData.standardWidthLong
                
                spaceTextIconButtonsStackedLargeSqueezed += flexTextIconButtonData.minimumWidthStackedLarge
                spaceTextIconButtonsStackedLargeStandard += flexTextIconButtonData.standardWidthStackedLarge
                
                spaceTextIconButtonsStackedMediumSqueezed += flexTextIconButtonData.minimumWidthStackedMedium
                spaceTextIconButtonsStackedMediumStandard += flexTextIconButtonData.standardWidthStackedMedium
                
                spaceTextIconButtonsStackedSmallSqueezed += flexTextIconButtonData.minimumWidthStackedSmall
                spaceTextIconButtonsStackedSmallStandard += flexTextIconButtonData.standardWidthStackedSmall
                
            case .segment(let flexSegmentData):
                spaceSegmentsLongSqueezed += flexSegmentData.minimumWidthLong
                spaceSegmentsLongStandard += flexSegmentData.middle2WidthLong
                
                spaceSegmentsStackedLargeSqueezed += flexSegmentData.minimumWidthStackedLarge
                spaceSegmentsStackedLargeStandard += flexSegmentData.middle2WidthStackedLarge
                
                spaceSegmentsStackedMediumSqueezed += flexSegmentData.minimumWidthStackedMedium
                spaceSegmentsStackedMediumStandard += flexSegmentData.middle2WidthStackedMedium
                
                spaceSegmentsStackedSmallSqueezed += flexSegmentData.minimumWidthStackedSmall
                spaceSegmentsStackedSmallStandard += flexSegmentData.middle2WidthStackedMedium
            case .slider(let flexSliderData):
                switch flexSliderData.widthCategory {
                case .fullWidth:
                    spaceSliders += width
                case .halfWidthLeft:
                    spaceSliders += (width / 2)
                case .halfWidthRight:
                    spaceSliders += (width - (width / 2))
                }
            case .checkBox(let flexCheckBoxData):
                spaceCheckBoxesLongSqueezed += flexCheckBoxData.minimumWidthLong
                spaceCheckBoxesLongStandard += flexCheckBoxData.standardWidthLong
                
                spaceCheckBoxesStackedLargeSqueezed += flexCheckBoxData.minimumWidthStackedLarge
                spaceCheckBoxesStackedLargeStandard += flexCheckBoxData.standardWidthStackedLarge
                
                spaceCheckBoxesStackedMediumSqueezed += flexCheckBoxData.minimumWidthStackedMedium
                spaceCheckBoxesStackedMediumStandard += flexCheckBoxData.standardWidthStackedMedium
                
                spaceCheckBoxesStackedSmallSqueezed += flexCheckBoxData.minimumWidthStackedSmall
                spaceCheckBoxesStackedSmallStandard += flexCheckBoxData.standardWidthStackedSmall
            }
        }
        
        /*
        print("spaceTextIconButtonsLongSqueezed = \(spaceTextIconButtonsLongStandard)!")
        print("spaceTextIconButtonsLongStandard = \(spaceTextIconButtonsLongStandard)!")
        print("spaceTextIconButtonsStackedLargeSqueezed = \(spaceTextIconButtonsStackedLargeSqueezed)!")
        print("spaceTextIconButtonsStackedLargeStandard = \(spaceTextIconButtonsStackedLargeStandard)!")
        print("spaceTextIconButtonsStackedMediumSqueezed = \(spaceTextIconButtonsStackedMediumSqueezed)!")
        print("spaceTextIconButtonsStackedMediumStandard = \(spaceTextIconButtonsStackedMediumStandard)!")
        print("spaceTextIconButtonsStackedSmallSqueezed = \(spaceTextIconButtonsStackedSmallSqueezed)!")
        print("spaceTextIconButtonsStackedSmallStandard = \(spaceTextIconButtonsStackedSmallStandard)!")
        
        print("spaceSegmentsLongSqueezed = \(spaceSegmentsLongSqueezed)!")
        print("spaceSegmentsLongStandard = \(spaceSegmentsLongStandard)!")
        print("spaceSegmentsStackedLargeSqueezed = \(spaceSegmentsStackedLargeSqueezed)!")
        print("spaceSegmentsStackedLargeStandard = \(spaceSegmentsStackedLargeStandard)!")
        print("spaceSegmentsStackedMediumSqueezed = \(spaceSegmentsStackedMediumSqueezed)!")
        print("spaceSegmentsStackedMediumStandard = \(spaceSegmentsStackedMediumStandard)!")
        print("spaceSegmentsStackedSmallSqueezed = \(spaceSegmentsStackedSmallSqueezed)!")
        print("spaceSegmentsStackedSmallStandard = \(spaceSegmentsStackedSmallStandard)!")
        
        print("spaceCheckBoxesLongSqueezed = \(spaceCheckBoxesLongSqueezed)!")
        print("spaceCheckBoxesLongStandard = \(spaceCheckBoxesLongStandard)!")
        print("spaceCheckBoxesStackedLargeSqueezed = \(spaceCheckBoxesStackedLargeSqueezed)!")
        print("spaceCheckBoxesStackedLargeStandard = \(spaceCheckBoxesStackedLargeStandard)!")
        print("spaceCheckBoxesStackedMediumSqueezed = \(spaceCheckBoxesStackedMediumSqueezed)!")
        print("spaceCheckBoxesStackedMediumStandard = \(spaceCheckBoxesStackedMediumStandard)!")
        print("spaceCheckBoxesStackedSmallSqueezed = \(spaceCheckBoxesStackedSmallSqueezed)!")
        print("spaceCheckBoxesStackedSmallStandard = \(spaceCheckBoxesStackedSmallStandard)!")
        
        print("spaceIconButtonsSqueezed = \(spaceIconButtonsSqueezed)!")
        print("spaceIconButtonsStandard = \(spaceIconButtonsStandard)!")
        
        print("spaceDividerSpacerDividersSqueezed = \(spaceDividerSpacerDividersSqueezed)!")
        print("spaceDividerSpacerDividersStandard = \(spaceDividerSpacerDividersStandard)!")
        
        print("spaceDividersSqueezed = \(spaceDividersSqueezed)!")
        print("spaceDividersStandard = \(spaceDividersStandard)!")
        
        print("spaceSliders = \(spaceSliders)!")
        
        print("spaceSpacers = \(spaceSpacers)!")
        
        print("spaceFixed = \(spaceFixed)!")
        */
        
    }
    
    func doesSupportLayoutStackingCategory(layoutStackingCategory: ToolInterfaceLayoutStackingCategory,
                                           width: Int,
                                           height: Int,
                                           safeAreaLeft: Int,
                                           safeAreaRight: Int) -> Bool {
        
        var consumedWidth = 0
        
        consumedWidth += spaceFixed
        consumedWidth += spaceSpacers
        
        consumedWidth += spaceDividersStandard
        
        consumedWidth += spaceDividerSpacerDividersStandard
        
        consumedWidth += spaceSliders
        consumedWidth += spaceIconButtonsStandard
        
        switch layoutStackingCategory {
        case .allVerticalSmall:
            
            consumedWidth += spaceTextIconButtonsStackedSmallStandard
            consumedWidth += spaceSegmentsStackedSmallStandard
            consumedWidth += spaceCheckBoxesStackedSmallStandard
            
        case .allVerticalMedium:
            
            consumedWidth += spaceTextIconButtonsStackedMediumStandard
            consumedWidth += spaceSegmentsStackedMediumStandard
            consumedWidth += spaceCheckBoxesStackedMediumStandard
            
        case .large(let toolInterfaceLayoutStackingLargeData):
            if toolInterfaceLayoutStackingLargeData.isTextIconButtonLong {
                consumedWidth += spaceTextIconButtonsLongStandard
            } else {
                consumedWidth += spaceTextIconButtonsStackedLargeStandard
            }
            
            if toolInterfaceLayoutStackingLargeData.isSegmentLong {
                consumedWidth += spaceSegmentsLongStandard
            } else {
                consumedWidth += spaceSegmentsStackedLargeStandard
            }
            
            if toolInterfaceLayoutStackingLargeData.isCheckBoxLong {
                consumedWidth += spaceCheckBoxesLongStandard
            } else {
                consumedWidth += spaceCheckBoxesStackedLargeStandard
            }
            
        }
        
        if consumedWidth <= width {
            return true
        } else {
            return false
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
        
        let universalPaddingLeftStandardLong = SliderLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                    flavor: .long,
                                                                                    squeeze: .standard,
                                                                                    neighborType: neighborTypeLeft)
        let universalPaddingRightStandardLong = SliderLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .standard,
                                                                                      neighborType: neighborTypeRight)
        let universalPaddingLeftStandardStacked = SliderLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                       flavor: .stackedLarge,
                                                                                       squeeze: .standard,
                                                                                       neighborType: neighborTypeLeft)
        let universalPaddingRightStandardStacked = SliderLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                         flavor: .stackedLarge,
                                                                                         squeeze: .standard,
                                                                                         neighborType: neighborTypeRight)
        let iconPaddingLeftStandardLong = SliderLayout.getIconPaddingLeft(orientation: orientation,
                                                                          flavor: .long,
                                                                          squeeze: .standard)
        let iconPaddingRightStandardLong = SliderLayout.getIconPaddingRight(orientation: orientation,
                                                                            flavor: .long,
                                                                            squeeze: .standard)
        let nameLabelPaddingLeftStandardLong = SliderLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                    flavor: .long,
                                                                                    squeeze: .standard)
        let nameLabelPaddingRightStandardLong = SliderLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .standard)
        let valueLabelPaddingLeftStandardLong = SliderLayout.getValueLabelPaddingLeft(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .standard)
        let valueLabelPaddingRightStandardLong = SliderLayout.getValueLabelPaddingRight(orientation: orientation,
                                                                                        flavor: .long,
                                                                                        squeeze: .standard)
        let iconPaddingLeftStandardStacked = SliderLayout.getIconPaddingLeft(orientation: orientation,
                                                                             flavor: .stackedLarge,
                                                                             squeeze: .standard)
        let iconPaddingRightStandardStacked = SliderLayout.getIconPaddingRight(orientation: orientation,
                                                                               flavor: .stackedLarge,
                                                                               squeeze: .standard)
        let nameLabelPaddingLeftStandardStacked = SliderLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                       flavor: .stackedLarge,
                                                                                       squeeze: .standard)
        let nameLabelPaddingRightStandardStacked = SliderLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                         flavor: .stackedLarge,
                                                                                         squeeze: .standard)
        let valueLabelPaddingLeftStandardStacked = SliderLayout.getValueLabelPaddingLeft(orientation: orientation,
                                                                                         flavor: .stackedLarge,
                                                                                         squeeze: .standard)
        let valueLabelPaddingRightStandardStacked = SliderLayout.getValueLabelPaddingRight(orientation: orientation,
                                                                                           flavor: .stackedLarge,
                                                                                           squeeze: .standard)
        
        let nameLabelWidthLong = sliderConfiguration.layoutNameLabelWidthLong
        let valueLabelWidthLong = sliderConfiguration.valueLabelWidthLong
        let nameLabelWidthStackedLarge = sliderConfiguration.layoutNameLabelWidthStackedLarge
        let valueLabelWidthStackedLarge = sliderConfiguration.valueLabelWidthStackedLarge
        let nameLabelWidthStackedMedium = sliderConfiguration.layoutNameLabelWidthStackedMedium
        let valueLabelWidthStackedMedium = sliderConfiguration.valueLabelWidthStackedMedium
        let nameLabelWidthStackedSmall = sliderConfiguration.layoutNameLabelWidthStackedSmall
        let valueLabelWidthStackedSmall = sliderConfiguration.valueLabelWidthStackedSmall
        
        let nameLabelSpaceLong = nameLabelWidthLong + nameLabelPaddingLeftStandardLong + nameLabelPaddingRightStandardLong
        let nameLabelSpaceStackedLarge = nameLabelWidthStackedLarge + nameLabelPaddingLeftStandardStacked + nameLabelPaddingRightStandardStacked
        let nameLabelSpaceStackedMedium = nameLabelWidthStackedMedium + nameLabelPaddingLeftStandardStacked + nameLabelPaddingRightStandardStacked
        let nameLabelSpaceStackedSmall = nameLabelWidthStackedSmall + nameLabelPaddingLeftStandardStacked + nameLabelPaddingRightStandardStacked
        
        let valueLabelSpaceLong = valueLabelWidthLong + valueLabelPaddingLeftStandardLong + valueLabelPaddingRightStandardLong
        let valueLabelSpaceStackedLarge = valueLabelWidthStackedLarge + valueLabelPaddingLeftStandardStacked + valueLabelPaddingRightStandardStacked
        let valueLabelSpaceStackedMedium = valueLabelWidthStackedMedium + valueLabelPaddingLeftStandardStacked + valueLabelPaddingRightStandardStacked
        let valueLabelSpaceStackedSmall = valueLabelWidthStackedSmall + valueLabelPaddingLeftStandardStacked + valueLabelPaddingRightStandardStacked
        
        let iconWidthLong = sliderConfiguration.iconWidthLong + iconPaddingLeftStandardLong + iconPaddingRightStandardLong
        let iconWidthStacked = sliderConfiguration.iconWidthStacked + iconPaddingLeftStandardStacked + iconPaddingRightStandardStacked
        
        let textAndIconSpaceLong = nameLabelSpaceLong + iconWidthLong
        let textAndIconSpaceStackedLarge = max(nameLabelSpaceStackedLarge, iconWidthStacked)
        let textAndIconSpaceStackedMedium = max(nameLabelSpaceStackedMedium, iconWidthStacked)
        let textAndIconSpaceStackedSmall = max(nameLabelSpaceStackedSmall, iconWidthStacked)
        
        let preferredMinimumBarWidth = SliderLayout.getPreferredMinimumBarWidth(orientation: orientation,
                                                                                widthCategory: sliderConfiguration.widthCategory)
        
        var proposedLongWidth = 0
        proposedLongWidth += universalPaddingLeftStandardLong
        proposedLongWidth += textAndIconSpaceLong
        proposedLongWidth += preferredMinimumBarWidth
        proposedLongWidth += valueLabelSpaceLong
        proposedLongWidth += universalPaddingRightStandardLong
        
        var proposedStackedLargeWidth = 0
        proposedStackedLargeWidth += universalPaddingLeftStandardStacked
        proposedStackedLargeWidth += textAndIconSpaceStackedLarge
        proposedStackedLargeWidth += preferredMinimumBarWidth
        proposedStackedLargeWidth += valueLabelSpaceStackedLarge
        proposedStackedLargeWidth += universalPaddingRightStandardStacked
        
        var proposedStackedMediumWidth = 0
        proposedStackedMediumWidth += universalPaddingLeftStandardStacked
        proposedStackedMediumWidth += textAndIconSpaceStackedMedium
        proposedStackedMediumWidth += preferredMinimumBarWidth
        proposedStackedMediumWidth += valueLabelSpaceStackedMedium
        proposedStackedMediumWidth += universalPaddingRightStandardStacked
        
        var proposedStackedSmallWidth = 0
        proposedStackedSmallWidth += universalPaddingLeftStandardStacked
        proposedStackedSmallWidth += textAndIconSpaceStackedSmall
        proposedStackedSmallWidth += preferredMinimumBarWidth
        proposedStackedSmallWidth += valueLabelSpaceStackedSmall
        proposedStackedSmallWidth += universalPaddingRightStandardStacked
        
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
        
        if availableSpace >= proposedLongWidth {
            return .long
        } else if availableSpace >= proposedStackedLargeWidth {
            return .stackedLarge
        } else if availableSpace >= proposedStackedMediumWidth {
            return .stackedMedium
        } else {
            return .stackedSmall
        }
    }
}
