//
//  MagicalSegmentedPickerViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/22/24.
//

import Foundation
import SwiftUI

@Observable class MagicalSegmentedPickerViewModel: MagicalViewModel {
    
    deinit {
        print("MagicalSegmentedPickerViewModel - Dealloc")
    }
    
    var selectedSegmentIndex = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    let segmentedPickerConfiguration: ToolInterfaceElementSegmentedPickerConfiguration
    
    let buttonViewModels: [MagicalSegmentedPickerButtonViewModel]
    let layoutNodes: [MagicalSegmentedPickerButtonLayoutNode]
    init(jiggleViewModel: JiggleViewModel,
         toolInterfaceViewModel: ToolInterfaceViewModel,
         segmentedPickerConfiguration: ToolInterfaceElementSegmentedPickerConfiguration) {
        
        self.segmentedPickerConfiguration = segmentedPickerConfiguration
        
        var _buttonViewModels = [MagicalSegmentedPickerButtonViewModel]()
        var _layoutNodes = [MagicalSegmentedPickerButtonLayoutNode]()
        let orientation = toolInterfaceViewModel.orientation
        for buttonConfiguration in segmentedPickerConfiguration.buttonConfigurations {
            let buttonViewModel = MagicalSegmentedPickerButtonViewModel(orientation: orientation,
                                                                        segmentedPickerButtonConfiguration: buttonConfiguration)
            _buttonViewModels.append(buttonViewModel)
            let layoutNode = MagicalSegmentedPickerButtonLayoutNode(segmentedPickerButtonConfiguration: buttonConfiguration)
            _layoutNodes.append(layoutNode)
        }
        
        self.buttonViewModels = _buttonViewModels
        
        self.layoutNodes = _layoutNodes
        
        super.init(jiggleViewModel: jiggleViewModel, toolInterfaceViewModel: toolInterfaceViewModel)
    }
    
    override func refresh() {
        
    }
    
    override func refreshDisabled() {
        super.refreshDisabled()
    }
    
    override func refreshEnabled() {
        super.refreshEnabled()
    }
    
    override func refreshLayoutFrame() {

        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        let isStacked = layoutSchemeFlavor.isStacked
        
        let universalPaddingLeftSqueezed = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .squeezed,
                                                                                        neighborType: neighborTypeLeft)
        let universalPaddingLeftStandard = SegmentedPickerLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .standard,
                                                                                        neighborType: neighborTypeLeft)
        let universalPaddingRightSqueezed = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .squeezed,
                                                                                          neighborType: neighborTypeLeft)
        let universalPaddingRightStandard = SegmentedPickerLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .standard,
                                                                                          neighborType: neighborTypeRight)

        
        let buttonUniversalPaddingLeftSqueezed = SegmentedPickerLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                     flavor: layoutSchemeFlavor,
                                                                                                     squeeze: .squeezed)
        let buttonUniversalPaddingLeftStandard = SegmentedPickerLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                     flavor: layoutSchemeFlavor,
                                                                                                     squeeze: .standard)
        let buttonUniversalPaddingRightSqueezed = SegmentedPickerLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                       flavor: layoutSchemeFlavor,
                                                                                                       squeeze: .squeezed)
        let buttonUniversalPaddingRightStandard = SegmentedPickerLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                       flavor: layoutSchemeFlavor,
                                                                                                       squeeze: .standard)
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        let nameLabelPaddingLeftSqueezed = SegmentedPickerLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                squeeze: .squeezed)
        let nameLabelPaddingLeftStandard = SegmentedPickerLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                squeeze: .standard)
        let nameLabelPaddingRightSqueezed = SegmentedPickerLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .squeezed)
        let nameLabelPaddingRightStandard = SegmentedPickerLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .standard)
        
        let iconPaddingLeftSqueezed = SegmentedPickerLayout.getIconPaddingLeft(orientation: orientation,
                                                                               flavor: layoutSchemeFlavor,
                                                                               squeeze: .squeezed)
        let iconPaddingLeftStandard = SegmentedPickerLayout.getIconPaddingLeft(orientation: orientation,
                                                                               flavor: layoutSchemeFlavor,
                                                                               squeeze: .standard)
        let iconPaddingRightSqueezed = SegmentedPickerLayout.getIconPaddingRight(orientation: orientation,
                                                                                 flavor: layoutSchemeFlavor,
                                                                                 squeeze: .squeezed)
        let iconPaddingRightStandard = SegmentedPickerLayout.getIconPaddingRight(orientation: orientation,
                                                                                 flavor: layoutSchemeFlavor,
                                                                                 squeeze: .standard)
        
        let totalWidth = layoutWidth
        
        for layoutIndex in 0..<layoutNodes.count {
            let layoutNode = layoutNodes[layoutIndex]
            let buttonViewModel = buttonViewModels[layoutIndex]
            
            let textIcon = buttonViewModel.getTextIcon(layoutSchemeFlavor: layoutSchemeFlavor)
            
            layoutNode.universalPaddingLeft = buttonUniversalPaddingLeftSqueezed
            layoutNode.universalPaddingRight = buttonUniversalPaddingRightSqueezed
            
            layoutNode.iconPaddingLeft = iconPaddingLeftSqueezed
            layoutNode.iconPaddingRight = iconPaddingRightSqueezed
            
            layoutNode.nameLabelPaddingLeft = nameLabelPaddingLeftSqueezed
            layoutNode.nameLabelPaddingRight = nameLabelPaddingRightSqueezed
            
            layoutNode.prepareForLayout(layoutSchemeFlavor: layoutSchemeFlavor,
                                        textIcon: textIcon)
        }
        
        if isStacked {
            var consumedBaseWidth = Int(0)
            consumedBaseWidth += universalPaddingRightSqueezed
            consumedBaseWidth += universalPaddingLeftSqueezed
            for _ in layoutNodes {
                consumedBaseWidth += buttonUniversalPaddingLeftSqueezed
                consumedBaseWidth += buttonUniversalPaddingRightSqueezed
                
            }
            
            
            var consumedWidth = 0
            
            while true {
                
                var areAllButtonsFullyGrown = true
                
                for layoutNode in layoutNodes {
                    if layoutNode.universalPaddingLeft < buttonUniversalPaddingLeftStandard { areAllButtonsFullyGrown = false }
                    if layoutNode.universalPaddingRight < buttonUniversalPaddingRightStandard { areAllButtonsFullyGrown = false }
                    
                    if layoutNode.nameLabelPaddingLeft < nameLabelPaddingLeftStandard { areAllButtonsFullyGrown = false }
                    if layoutNode.nameLabelPaddingRight < nameLabelPaddingRightStandard { areAllButtonsFullyGrown = false }
                    
                    if layoutNode.iconPaddingLeft < iconPaddingLeftStandard { areAllButtonsFullyGrown = false }
                    if layoutNode.iconPaddingRight < iconPaddingRightStandard { areAllButtonsFullyGrown = false }
                }
                
                
                if _universalPaddingLeft >= universalPaddingLeftStandard &&
                    _universalPaddingRight >= universalPaddingRightStandard &&
                    areAllButtonsFullyGrown {
                    break
                }
                
                var didModify = false
                
                for layoutNode in layoutNodes {
                    consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth()
                    if consumedWidth < totalWidth {
                        if layoutNode.iconPaddingLeft < iconPaddingLeftStandard {
                            layoutNode.iconPaddingLeft += 1
                            didModify = true
                        }
                    }
                    
                    consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth()
                    if consumedWidth < totalWidth {
                        if layoutNode.iconPaddingRight < iconPaddingRightStandard {
                            layoutNode.iconPaddingRight += 1
                            didModify = true
                        }
                    }
                    
                    consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth()
                    if consumedWidth < totalWidth {
                        if layoutNode.nameLabelPaddingLeft < nameLabelPaddingLeftStandard {
                            layoutNode.nameLabelPaddingLeft += 1
                            didModify = true
                        }
                    }
                    
                    consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth()
                    if consumedWidth < totalWidth {
                        if layoutNode.nameLabelPaddingRight < nameLabelPaddingRightStandard {
                            layoutNode.nameLabelPaddingRight += 1
                            didModify = true
                        }
                    }
                    
                    consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth()
                    if consumedWidth < totalWidth {
                        if layoutNode.universalPaddingLeft < buttonUniversalPaddingLeftStandard {
                            layoutNode.universalPaddingLeft += 1
                            consumedBaseWidth += 1
                            didModify = true
                        }
                    }
                    
                    consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth()
                    if consumedWidth < totalWidth {
                        if layoutNode.universalPaddingRight < buttonUniversalPaddingRightStandard {
                            layoutNode.universalPaddingRight += 1
                            consumedBaseWidth += 1
                            didModify = true
                        }
                    }
                } // end of nodes loop
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth()
                if consumedWidth < totalWidth {
                    if _universalPaddingLeft < universalPaddingLeftStandard {
                        _universalPaddingLeft += 1
                        consumedBaseWidth += 1
                        didModify = true
                    }
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth()
                if consumedWidth < totalWidth {
                    if _universalPaddingRight < universalPaddingRightStandard {
                        _universalPaddingRight += 1
                        consumedBaseWidth += 1
                        didModify = true
                    }
                }
                
                if didModify == false {
                    break
                }
                
            }
        } else {
            
            var consumedWidth = Int(0)
            consumedWidth += universalPaddingRightSqueezed
            consumedWidth += universalPaddingLeftSqueezed
            
            for layoutNode in layoutNodes {
                consumedWidth += layoutNode.universalPaddingLeft
                consumedWidth += layoutNode.universalPaddingRight
                
                consumedWidth += layoutNode.nameLabelWidth
                consumedWidth += layoutNode.nameLabelPaddingLeft
                consumedWidth += layoutNode.nameLabelPaddingRight
                
                consumedWidth += layoutNode.iconWidth
                consumedWidth += layoutNode.iconPaddingLeft
                consumedWidth += layoutNode.iconPaddingRight
                
            }
            
            while consumedWidth < totalWidth {
                
                var didModify = false
                
                for layoutNode in layoutNodes {
                    if layoutNode.iconPaddingLeft < iconPaddingLeftStandard {
                        layoutNode.iconPaddingLeft += 1
                        consumedWidth += 1
                        didModify = true
                    }
                    if layoutNode.iconPaddingRight < iconPaddingRightStandard {
                        layoutNode.iconPaddingRight += 1
                        consumedWidth += 1
                        didModify = true
                    }
                    
                    if layoutNode.nameLabelPaddingLeft < nameLabelPaddingLeftStandard {
                        layoutNode.nameLabelPaddingLeft += 1
                        consumedWidth += 1
                        didModify = true
                    }
                    
                    if layoutNode.nameLabelPaddingRight < nameLabelPaddingRightStandard {
                        layoutNode.nameLabelPaddingRight += 1
                        consumedWidth += 1
                        didModify = true
                    }
                    
                    if layoutNode.universalPaddingLeft < buttonUniversalPaddingLeftStandard {
                        layoutNode.universalPaddingLeft += 1
                        consumedWidth += 1
                        didModify = true
                    }
                    
                    if layoutNode.universalPaddingRight < buttonUniversalPaddingRightStandard {
                        layoutNode.universalPaddingRight += 1
                        consumedWidth += 1
                        didModify = true
                    }
                }
                
                if _universalPaddingLeft < universalPaddingLeftStandard && consumedWidth < totalWidth {
                    _universalPaddingLeft += 1
                    consumedWidth += 1
                    didModify = true
                }
                
                if _universalPaddingRight < universalPaddingRightStandard && consumedWidth < totalWidth {
                    _universalPaddingRight += 1
                    consumedWidth += 1
                    didModify = true
                }
                
                if didModify == false {
                    break
                }
            }
        }
        
        // Now there may be some space left over, distribute first to the smallest, then ubiquitously
        
        
        if isStacked {
            for layoutNode in layoutNodes {
                let width1 = layoutNode.nameLabelWidth + layoutNode.nameLabelPaddingLeft + layoutNode.nameLabelPaddingRight
                let width2 = layoutNode.iconWidth + layoutNode.iconPaddingLeft + layoutNode.iconPaddingRight
                layoutNode.width = max(width1, width2) + layoutNode.universalPaddingLeft + layoutNode.universalPaddingRight
            }
        } else {
            for layoutNode in layoutNodes {
                let width1 = layoutNode.nameLabelWidth + layoutNode.nameLabelPaddingLeft + layoutNode.nameLabelPaddingRight
                let width2 = layoutNode.iconWidth + layoutNode.iconPaddingLeft + layoutNode.iconPaddingRight
                layoutNode.width = width1 + width2 + layoutNode.universalPaddingLeft + layoutNode.universalPaddingRight
            }
        }
        
        
        var howMuchSpaceWeAreUsingSoFar = 0
        howMuchSpaceWeAreUsingSoFar += _universalPaddingLeft
        howMuchSpaceWeAreUsingSoFar += _universalPaddingRight
        for layoutNode in layoutNodes {
            howMuchSpaceWeAreUsingSoFar += layoutNode.width
            
        }
        
        if layoutNodes.count > 0 {
            while howMuchSpaceWeAreUsingSoFar < totalWidth {
                
                var largestWidth = layoutNodes[0].width
                var smallestWidth = largestWidth
                var smallestIndex = 0
                
                for layoutIndex in 0..<layoutNodes.count {
                    let layoutNode = layoutNodes[layoutIndex]
                    let width = layoutNode.width
                    if width > largestWidth {
                        largestWidth = width
                    }
                    if width < smallestWidth {
                        smallestWidth = width
                        smallestIndex = layoutIndex
                    }
                    largestWidth = max(largestWidth, layoutNode.width)
                }
                
                if smallestWidth == largestWidth {
                    break
                }
                
                //print("boosting[\(smallestIndex)], @ \(layoutNodes[smallestIndex].width) target \(largestWidth)")
                layoutNodes[smallestIndex].width += 1
                howMuchSpaceWeAreUsingSoFar += 1
            }
            
            while howMuchSpaceWeAreUsingSoFar < totalWidth {
                for layoutIndex in 0..<layoutNodes.count {
                    let layoutNode = layoutNodes[layoutIndex]
                    if howMuchSpaceWeAreUsingSoFar < totalWidth {
                        layoutNode.width += 1
                        howMuchSpaceWeAreUsingSoFar += 1
                    }
                }
            }
        }
        
        
        var x = 0
        for layoutNode in layoutNodes {
            layoutNode.x = x
            x += layoutNode.width
        }
        
        for layoutIndex in 0..<layoutNodes.count {
            let layoutNode = layoutNodes[layoutIndex]
            let buttonViewModel = buttonViewModels[layoutIndex]
            
            buttonViewModel.x = layoutNode.x
            buttonViewModel.y = layoutNode.y
            buttonViewModel.width = layoutNode.width
            
            buttonViewModel.universalPaddingLeft = layoutNode.universalPaddingLeft
            buttonViewModel.universalPaddingRight = layoutNode.universalPaddingRight
            
            buttonViewModel.nameLabelPaddingLeft = layoutNode.nameLabelPaddingLeft
            buttonViewModel.nameLabelPaddingRight = layoutNode.nameLabelPaddingRight
            
            buttonViewModel.iconPaddingLeft = layoutNode.iconPaddingLeft
            buttonViewModel.iconPaddingRight = layoutNode.iconPaddingRight
        }
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
    }
    
    func calculateStackedConsumedWidth() -> Int {
        var result = 0
        for layoutIndex in 0..<layoutNodes.count {
            let layoutNode = layoutNodes[layoutIndex]
            let width1 = layoutNode.nameLabelWidth + layoutNode.nameLabelPaddingLeft + layoutNode.nameLabelPaddingRight
            let width2 = layoutNode.iconWidth + layoutNode.iconPaddingLeft + layoutNode.iconPaddingRight
            result += max(width1, width2)
        }
        return result
    }
    
    
    func handleSelectedIndex(_ index: Int) {
        print("MagicalSegmentedPickerViewModel => handleSelectedIndex(\(index))")
    }
    
}
