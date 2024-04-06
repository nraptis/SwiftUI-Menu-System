//
//  ToolInterfaceViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/17/24.
//

import Foundation
import Observation

@Observable class ToolInterfaceViewModel {
    
    //
    // So, per this thought, we want the category for ALL POSSIBLE rows...
    // ONLY re-calculate it when the WIDTH OR SAFE AREA changes... (That could be frequent)
    // ...
    //
    
    @ObservationIgnored var allPossibleRowConfigurations = [[ToolNode]]()
    @ObservationIgnored var rowStackingCategoryCalculators = [RowStackingCategoryCalculator]()
    @ObservationIgnored var checkLayoutStackingCategories = ToolInterfaceLayoutStackingCategory.getAllInPriorityOrderExceptLeast()
    
    
    var layoutStackingCategory = ToolInterfaceLayoutStackingCategory.allVerticalSmall
    var layoutSchemeFlavorSliders = LayoutSchemeFlavor.stackedSmall
    
    func calculatelayoutStackingCategory(width: Int,
                                         height: Int,
                                         safeAreaLeft: Int,
                                         safeAreaRight: Int) {
        
        for rowStackingCategoryCalculator in rowStackingCategoryCalculators {
            rowStackingCategoryCalculator.measure(width: width,
                                                  height: height,
                                                  safeAreaLeft: safeAreaLeft,
                                                  safeAreaRight: safeAreaRight)
        }
        
        var _layoutStackingCategory = ToolInterfaceLayoutStackingCategory.allVerticalSmall
        for layoutStackingCategory in checkLayoutStackingCategories {
        
            var isSupported = true
            for rowStackingCategoryCalculator in rowStackingCategoryCalculators {
                
                if rowStackingCategoryCalculator.doesSupportLayoutStackingCategory(layoutStackingCategory: layoutStackingCategory,
                                                                                   width: width,
                                                                                   height: height,
                                                                                   safeAreaLeft: safeAreaLeft,
                                                                                   safeAreaRight: safeAreaRight) == false {
                    isSupported = false
                    break
                }
            }
            
            if isSupported {
                _layoutStackingCategory = layoutStackingCategory
                break
            }
            
        }
        
        layoutStackingCategory = _layoutStackingCategory
        layoutStackingCategory = _layoutStackingCategory
        
        var _layoutSchemeFlavorSliders = LayoutSchemeFlavor.getMax()
        
        for rowStackingCategoryCalculator in rowStackingCategoryCalculators {
            let layoutSchemeFlavor = rowStackingCategoryCalculator.computeSliderLayoutSchemeFlavor(width: width,
                                                                                                   height: height,
                                                                                                   safeAreaLeft: safeAreaLeft,
                                                                                                   safeAreaRight: safeAreaRight)
            if layoutSchemeFlavor < _layoutSchemeFlavorSliders {
                _layoutSchemeFlavorSliders = layoutSchemeFlavor
            }
        }
        layoutSchemeFlavorSliders = _layoutSchemeFlavorSliders
    }
    
    var rowsTop = [ToolRow]()
    var rowsBottom = [ToolRow]()
    var rowsDraggable = [ToolRow]()
    
    var toolNodeBaseID = UInt16(0)
    func getToolNodeID() -> UInt16 {
        toolNodeBaseID += 1
        return toolNodeBaseID
    }
    
    let orientation: Orientation
    weak var jiggleViewModel: JiggleViewModel!
    init(orientation: Orientation, jiggleViewModel: JiggleViewModel) {
        self.orientation = orientation
        self.jiggleViewModel = jiggleViewModel
        
        self.rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        
        let row1 = ToolRow(toolInterfaceRow: .topBarTop1)
        row1.setNodes([

            getPointBreakTangentButtonToolNode(neighborTypeLeft: .iconButton, neighborTypeRight: .dividerSpacerDivider),
            getDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .spacer),
            getSpacerToolNode(defaultWidth: 12, neighborTypeLeft: .divider, neighborTypeRight: .segment),
            getDocumentModeSegmentToolNode(neighborTypeLeft: .divider, neighborTypeRight: .checkBox),
            getStereoscopic3DEnabledCheckBoxNode(neighborTypeLeft: .segment, neighborTypeRight: .dividerSpacerDivider),
            getDividerSpacerDividerToolNode(neighborTypeLeft: .checkBox, neighborTypeRight: .textIconButton),
            getMainMenuButtonToolNode(neighborTypeLeft: .dividerSpacerDivider, neighborTypeRight: .iconButton),
            getPhoneCollapseTopToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil)
            
                      ],
                      animated: false, reversed: false,
                      width: rowWidth, height: rowHeight,
                      safeAreaLeft: safeAreaLeft, safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory, sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
        rowsDraggable.append(row1)
        rowsTop.append(row1)
        
        
        let row2 = ToolRow(toolInterfaceRow: .topBarTop2)
        row2.setNodes([
            getJigglePowerSliderToolNode(widthCategory: .halfWidthLeft,
                                         neighborTypeLeft: nil,
                                         neighborTypeRight: .slider),
            getDividerSpacerDividerToolNode(neighborTypeLeft: .slider, neighborTypeRight: .textIconButton),
            getDocumentModeSegmentToolNode(neighborTypeLeft: .dividerSpacerDivider, neighborTypeRight: .iconButton),
            getMainMenuButtonToolNode(neighborTypeLeft: .segment, neighborTypeRight: nil),
        ],
        
                      animated: false, reversed: false,
                      width: rowWidth, height: rowHeight,
                      safeAreaLeft: safeAreaLeft, safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory, sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
        
        rowsDraggable.append(row2)
        rowsTop.append(row2)
        
        let row3 = ToolRow(toolInterfaceRow: .topBarTop3)
        row3.setNodes([
            getJigglePowerSliderToolNode(widthCategory: .fullWidth,
                                         neighborTypeLeft: nil,
                                         neighborTypeRight: nil),
        ],
        
                      animated: false, reversed: false,
                      width: rowWidth, height: rowHeight,
                      safeAreaLeft: safeAreaLeft, safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory, sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
        rowsDraggable.append(row3)
        rowsTop.append(row3)
        
        let row4 = ToolRow(toolInterfaceRow: .topBarTop4)
        row4.setNodes([
            getJiggleSpeedSliderToolNode(widthCategory: .fullWidth,
                                         neighborTypeLeft: nil,
                                         neighborTypeRight: nil),
        ],
                      animated: false, reversed: false,
                      width: rowWidth, height: rowHeight,
                      safeAreaLeft: safeAreaLeft, safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory, sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
        rowsDraggable.append(row4)
        //rowsTop.append(row4)
        
        
        let row5 = ToolRow(toolInterfaceRow: .topBarTop5)
        row5.setNodes([
            getDocumentModeSegmentToolNode(neighborTypeLeft: nil,
                                           neighborTypeRight: .spacer),
            getSpacerToolNode(defaultWidth: 12,
                              neighborTypeLeft: .segment,
                              neighborTypeRight: .slider),
            getJiggleSpeedSliderToolNode(widthCategory: .halfWidthRight,
                                         neighborTypeLeft: .spacer,
                                         neighborTypeRight: nil),
        ],
                      animated: false, reversed: false,
                      width: rowWidth, height: rowHeight,
                      safeAreaLeft: safeAreaLeft, safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory, sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
        rowsDraggable.append(row5)
        //rowsTop.append(row5)
        
        
        
        let row6 = ToolRow(toolInterfaceRow: .topBarTop6)
        row6.setNodes([
            getPointBreakTangentButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
            getMainMenuButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .divider),
            getDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .spacer),
            getSpacerToolNode(defaultWidth: 8, neighborTypeLeft: .divider, neighborTypeRight: .segment),
            getDocumentModeSegmentToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .spacer),
            getSpacerToolNode(defaultWidth: 8, neighborTypeLeft: .segment, neighborTypeRight: .textIconButton),
            getMainMenuButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),
        ],
                      animated: false, reversed: false,
                      width: rowWidth, height: rowHeight,
                      safeAreaLeft: safeAreaLeft, safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory, sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
        rowsDraggable.append(row6)
        //rowsTop.append(row6)
        
        
        let row7 = ToolRow(toolInterfaceRow: .topBarTop7)
        row7.setNodes([
            getStereoscopic3DEnabledCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
            getSpacerToolNode(defaultWidth: 8, neighborTypeLeft: .checkBox, neighborTypeRight: .checkBox),
            getZoomEnabledCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: .checkBox),
            getStereoscopic3DEnabledCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: .dividerSpacerDivider),
            getDividerSpacerDividerToolNode(neighborTypeLeft: .checkBox, neighborTypeRight: .textIconButton),
            getMainMenuButtonToolNode(neighborTypeLeft: .dividerSpacerDivider, neighborTypeRight: nil),
        ],
                      animated: false, reversed: false,
                      width: rowWidth, height: rowHeight,
                      safeAreaLeft: safeAreaLeft, safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory, sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
        rowsDraggable.append(row7)
        rowsBottom.append(row7)
        
        
        let row8 = ToolRow(toolInterfaceRow: .topBarTop8)
        row8.setNodes([
            getStereoscopic3DEnabledCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: .checkBox),
            getZoomEnabledCheckBoxNode(neighborTypeLeft: .checkBox, neighborTypeRight: .checkBox),
            
            getSpacerToolNode(defaultWidth: 6, neighborTypeLeft: .checkBox, neighborTypeRight: .divider),
            getDividerToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .textIconButton),
            
            getPointBreakTangentButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
            getMainMenuButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .divider),
            
                      ],
                      animated: false,
                      reversed: false,
                      width: rowWidth,
                      height: rowHeight,
                      safeAreaLeft: safeAreaLeft,
                      safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory,
                      sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
        rowsDraggable.append(row8)
        rowsBottom.append(row8)
        
        let row9 = ToolRow(toolInterfaceRow: .topBarTop9)
        row9.setNodes([
            getEditModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: .dividerSpacerDivider),
            getDividerSpacerDividerToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .textIconButton),
            getMainMenuButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .dividerSpacerDivider),
            getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
            getPointBreakTangentButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
            getPointBreakTangentButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
                      ],
                      animated: false,
                      reversed: false,
                      width: rowWidth,
                      height: rowHeight,
                      safeAreaLeft: safeAreaLeft,
                      safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory,
                      sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
        rowsDraggable.append(row9)
        rowsBottom.append(row9)
        
        
        
        // TODO: These need to be clones, not the original nodes.
        for row in rowsDraggable {
            allPossibleRowConfigurations.append(row.nodes)
        }
        
        for possibleRowConfiguration in allPossibleRowConfigurations {
            let rowStackingCategoryCalculator = RowStackingCategoryCalculator(orientation: orientation,
                                                                              nodes: possibleRowConfiguration)
            rowStackingCategoryCalculators.append(rowStackingCategoryCalculator)
        }
    }
    
    func getSpacerToolNode(defaultWidth: Int,
                           neighborTypeLeft: ToolInterfaceElementType?,
                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        ToolNode(id: getToolNodeID(),
                 element: .spacer,
                 flex: .spacer(.init(defaultWidth: defaultWidth)),
                 toolInterfaceViewModel: self,
                 magicalViewModel: MagicalViewModel(jiggleViewModel: jiggleViewModel,
                                                    toolInterfaceViewModel: self),
                 neighborTypeLeft: neighborTypeLeft,
                 neighborTypeRight: neighborTypeRight)
    }
    
    var rowWidth = 320
    var rowHeight = 44
    var safeAreaLeft = 0
    var safeAreaRight = 0
    
    func layoutAllRowsPhone(rowWidth: Int, rowHeight: Int, safeAreaLeft: Int, safeAreaRight: Int) {

        if rowWidth != self.rowWidth ||
            rowHeight != self.rowHeight ||
            safeAreaLeft != self.safeAreaLeft ||
            safeAreaRight != self.safeAreaRight {
            
            self.rowWidth = rowWidth
            self.rowHeight = rowHeight
            self.safeAreaLeft = safeAreaLeft
            self.safeAreaRight = safeAreaRight
            
            for row in rowsTop { row.layout(width: rowWidth, 
                                            height: rowHeight,
                                            safeAreaLeft: safeAreaLeft,
                                            safeAreaRight: safeAreaRight,
                                            layoutStackingCategory: layoutStackingCategory,
                                            sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders) }
            
            for row in rowsBottom { row.layout(width: rowWidth,
                                               height: rowHeight,
                                               safeAreaLeft: safeAreaLeft,
                                               safeAreaRight: safeAreaRight,
                                               layoutStackingCategory: layoutStackingCategory,
                                               sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders) }
        }
    }
    
    func layoutAllRowsTablet(rowWidth: Int, rowHeight: Int, safeAreaLeft: Int, safeAreaRight: Int) {

        if rowWidth != self.rowWidth ||
            rowHeight != self.rowHeight ||
            safeAreaLeft != self.safeAreaLeft ||
            safeAreaRight != self.safeAreaRight {
            
            self.rowWidth = rowWidth
            self.rowHeight = rowHeight
            self.safeAreaLeft = safeAreaLeft
            self.safeAreaRight = safeAreaRight
            
            for row in rowsDraggable { row.layout(width: rowWidth,
                                                  height: rowHeight,
                                                  safeAreaLeft: safeAreaLeft,
                                                  safeAreaRight: safeAreaRight,
                                                  layoutStackingCategory: layoutStackingCategory,
                                                  sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders) }
        }
    }
    
    func handleSelectedJiggleDidChange() {
        if Device.isPad {
            for row in rowsDraggable { handleSelectedJiggleDidChange(row: row) }
        } else {
            for row in rowsTop { handleSelectedJiggleDidChange(row: row) }
            for row in rowsBottom { handleSelectedJiggleDidChange(row: row) }
        }
    }
    
    func handleSelectedJiggleDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .sliderJigglePowerAmount {
                node.magicalViewModel.refresh()
            }
            if node.element == .sliderJiggleSpeedAmount {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handleDocumentModeDidChange() {
        if Device.isPad {
            for row in rowsDraggable { handleDocumentModeDidChange(row: row) }
        } else {
            for row in rowsTop { handleDocumentModeDidChange(row: row) }
            for row in rowsBottom { handleDocumentModeDidChange(row: row) }
        }
    }
    
    func handleDocumentModeDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .segmentDocumentMode {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func handleEditModeDidChange() {
        if Device.isPad {
            for row in rowsDraggable { handleEditModeDidChange(row: row) }
        } else {
            for row in rowsTop { handleEditModeDidChange(row: row) }
            for row in rowsBottom { handleEditModeDidChange(row: row) }
        }
    }
    
    func handleEditModeDidChange(row: ToolRow) {
        for node in row.nodes {
            if node.element == .segmentEditMode {
                node.magicalViewModel.refresh()
            }
        }
    }
    
    func replaceTopToolbarA() {
        print("replaceTopToolbarA()")
        
        let row1 = rowsDraggable[0]
        row1.setNodes([
            getMainMenuButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
            getPointBreakTangentButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .divider),
            getDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .spacer),
            getSpacerToolNode(defaultWidth: 8, neighborTypeLeft: .divider, neighborTypeRight: .segment),
            getDocumentModeSegmentToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .spacer),
            getSpacerToolNode(defaultWidth: 8, neighborTypeLeft: .divider, neighborTypeRight: .segment),
                       ],
                      animated: true,
                      reversed: false, 
                      width: rowWidth,
                      height: rowHeight,
                      safeAreaLeft: safeAreaLeft,
                      safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory,
                      sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
        
    }
    
    func replaceTopToolbarB() {
        print("replaceTopToolbarB()")
        
        let row1 = rowsDraggable[0]
        row1.setNodes([
            getPointBreakTangentButtonToolNode(neighborTypeLeft: .iconButton, neighborTypeRight: .dividerSpacerDivider),
            getDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .spacer),
            getSpacerToolNode(defaultWidth: 12, neighborTypeLeft: .divider, neighborTypeRight: .segment),
            getEditModeSegmentToolNode(neighborTypeLeft: .divider, neighborTypeRight: .checkBox),
            getStereoscopic3DEnabledCheckBoxNode(neighborTypeLeft: .segment, neighborTypeRight: .dividerSpacerDivider),
            getDividerSpacerDividerToolNode(neighborTypeLeft: .checkBox, neighborTypeRight: .textIconButton),
            getMainMenuButtonToolNode(neighborTypeLeft: .dividerSpacerDivider, neighborTypeRight: nil)
        ],
                      animated: true,
                      reversed: false,
                      width: rowWidth,
                      height: rowHeight,
                      safeAreaLeft: safeAreaLeft,
                      safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory,
                      sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
    }
    
    
    func replaceBottom3ToolbarsA() {
        print("replaceBottom3ToolbarsA()")
    }
    
    func replaceBottom3ToolbarsB() {
        print("replaceBottom3ToolbarsB()")
    }
    
}
