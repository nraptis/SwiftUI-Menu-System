//
//  ToolInterfaceViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/17/24.
//

import Foundation
import Observation
import Combine

@Observable class ToolInterfaceViewModel {
    
    //
    // So, per this thought, we want the category for ALL POSSIBLE rows...
    // ONLY re-calculate it when the WIDTH OR SAFE AREA changes... (That could be frequent)
    // ...
    //
    
    @ObservationIgnored weak var jiggleViewController: JiggleViewController?
    
    struct RowBluePrint {
        
        var configuration: ToolRowConfiguration
        var nodes: [ToolNode]
        var centerPinnedElement: ToolInterfaceElement?
        
        init(nodes: [ToolNode], configuration: ToolRowConfiguration, centerPinnedElement: ToolInterfaceElement? = nil) {
            self.nodes = nodes
            self.configuration = configuration
            self.centerPinnedElement = centerPinnedElement
            
            
            SANITY_CHECK(configuration: configuration)
        }
        
        func SANITY_CHECK(configuration: ToolRowConfiguration) {
            var nodeIndex = 0
            while nodeIndex < nodes.count {
                
                if nodeIndex == 0 {
                    if nodes.count == 1 {
                        if nodes[nodeIndex].neighborTypeLeft != nil {
                            print("@Nodes @[\(configuration)] @ \(nodeIndex), expected neighborTypeLeft as NIL, got \(nodes[nodeIndex].neighborTypeLeft!) [\(nodes.count) node case]")
                        }
                        if nodes[nodeIndex].neighborTypeRight != nil {
                            print("@Nodes @[\(configuration)] @ \(nodeIndex), expected neighborTypeRight as NIL, got \(nodes[nodeIndex].neighborTypeRight!) [\(nodes.count) node case]")
                        }
                    } else {
                        let nextNode = nodes[nodeIndex + 1]
                        if nodes[nodeIndex].neighborTypeLeft != nil {
                            print("@Nodes @[\(configuration)] @ \(nodeIndex), expected neighborTypeLeft as NIL, got \(String(describing: nodes[nodeIndex].neighborTypeLeft)) [\(nodes.count) node case]")
                        }
                        if nodes[nodeIndex].neighborTypeRight != nextNode.type {
                            print("@Nodes @[\(configuration)] @ \(nodeIndex), expected neighborTypeRight as \(nextNode.type), got \(String(describing: nodes[nodeIndex].neighborTypeRight)) [\(nodes.count) node case]")
                        }
                    }
                    
                } else if nodeIndex == (nodes.count - 1) {
                    let previousNode = nodes[nodeIndex - 1]
                    if nodes[nodeIndex].neighborTypeLeft != previousNode.type {
                        print("@Nodes @[\(configuration)] @ \(nodeIndex), expected previousNode as \(previousNode.type), got \(String(describing: nodes[nodeIndex].neighborTypeLeft)) [\(nodes.count) node case]")
                    }
                    if nodes[nodeIndex].neighborTypeRight != nil {
                        print("@Nodes @[\(configuration)] @ \(nodeIndex), expected neighborTypeRight as NIL, got \(nodes[nodeIndex].neighborTypeRight!) [\(nodes.count) node case]")
                    }
                    
                } else {
                    let previousNode = nodes[nodeIndex - 1]
                    let nextNode = nodes[nodeIndex + 1]
                    if nodes[nodeIndex].neighborTypeLeft != previousNode.type {
                        print("@Nodes @[\(configuration)] @ \(nodeIndex), expected previousNode as \(previousNode.type), got \(String(describing: nodes[nodeIndex].neighborTypeLeft)) [\(nodes.count) node case]")
                    }
                    if nodes[nodeIndex].neighborTypeRight != nextNode.type {
                        print("@Nodes @[\(configuration)] @ \(nodeIndex), expected neighborTypeRight as \(nextNode.type), got \(String(describing: nodes[nodeIndex].neighborTypeRight)) [\(nodes.count) node case]")
                    }
                }
                
                nodeIndex += 1
            }
        }
        
        init(nodes: [ToolNode], configuration: ToolRowConfiguration) {
            self.nodes = nodes
            self.configuration = configuration
            self.centerPinnedElement = nil
        }
        
        func getCenterPinnedNode() -> ToolNode? {
            for node in nodes {
                if node.element == centerPinnedElement {
                    return node
                }
            }
            return nil
        }
    }
    
    func getRow(slot: ToolRowSlot) -> ToolRow? {
        if Device.isPad {
            for row in rowsDraggable {
                if row.slot == slot {
                    return row
                }
            }
        } else {
            for row in rowsTop {
                if row.slot == slot {
                    return row
                }
            }
            for row in rowsBottom {
                if row.slot == slot {
                    return row
                }
            }
        }
        for row in rowsGraphSideMenu {
            if row.slot == slot {
                return row
            }
        }
        return nil
    }
    
    private func getRow(rowBluePrint: RowBluePrint?, slot: ToolRowSlot, width: Int, height: Int) -> ToolRow {
        let result = ToolRow(slot: slot)
        if let rowBluePrint = rowBluePrint {
            result.configuration = rowBluePrint.configuration
            result.setNodes(rowBluePrint.nodes,
                            animated: false,
                            reversed: false, width: width,
                            height: height,
                            layoutStackingCategory: layoutStackingCategory,
                            sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders,
                            centerPinnedElement: rowBluePrint.centerPinnedElement)
        } else {
            result.configuration = .empty
            result.setNodes([],
                            animated: false,
                            reversed: false, width: width,
                            height: height,
                            layoutStackingCategory: layoutStackingCategory,
                            sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders,
                            centerPinnedElement: nil)
        }
        return result
    }
    
    @ObservationIgnored var allPossibleRowBluePrints = [RowBluePrint]()
    @ObservationIgnored var rowStackingCategoryCalculators = [RowStackingCategoryCalculator]()
    @ObservationIgnored var checkLayoutStackingCategories = ToolInterfaceLayoutStackingCategory.getAllInPriorityOrderExceptLeast()
    
    @ObservationIgnored var layoutStackingCategory = ToolInterfaceLayoutStackingCategory.allVerticalSmall
    @ObservationIgnored var layoutStackingCategoryGraphSideMenu = ToolInterfaceLayoutStackingCategory.large(.init(isSegmentLong: false, isCheckBoxLong: false, isTextIconButtonLong: false))
    
    @ObservationIgnored var layoutSchemeFlavorSliders = LayoutSchemeFlavor.stackedSmall
    
    func calculatelayoutStackingCategory(width: Int,
                                         height: Int) {
        
        var _layoutStackingCategory = ToolInterfaceLayoutStackingCategory.allVerticalSmall
        for layoutStackingCategory in checkLayoutStackingCategories {
        
            var isSupported = true
            for rowStackingCategoryCalculator in rowStackingCategoryCalculators {
                
                if rowStackingCategoryCalculator.doesSupportLayoutStackingCategory(layoutStackingCategory: layoutStackingCategory,
                                                                                   width: width,
                                                                                   height: height) == false {
                    print("*NOT* Supporter: \(layoutStackingCategory)")
                    isSupported = false
                    break
                }
            }
            
            if isSupported {
                print("IS Supporter: \(layoutStackingCategory)")
                _layoutStackingCategory = layoutStackingCategory
                break
            }
            
        }
        
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
    
    @ObservationIgnored var toolConfigurationIdiomPrevious = ToolConfigurationIdiom.unknown
    @ObservationIgnored var toolConfigurationIdiomCurrent = ToolConfigurationIdiom.unknown
    
    
    @ObservationIgnored var rowsTop = [ToolRow]()
    @ObservationIgnored var rowsBottom = [ToolRow]()
    @ObservationIgnored var rowsDraggable = [ToolRow]()
    @ObservationIgnored var rowsGraphSideMenu = [ToolRow]()
    
    
    @ObservationIgnored var toolNodeBaseID = UInt16(0)
    func getToolNodeID() -> UInt16 {
        toolNodeBaseID += 1
        return toolNodeBaseID
    }
    
    @ObservationIgnored let orientation: Orientation
    @ObservationIgnored weak var jiggleViewModel: JiggleViewModel!
    init(orientation: Orientation, jiggleViewModel: JiggleViewModel) {
        self.orientation = orientation
        self.jiggleViewModel = jiggleViewModel
        
        self.rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        
        
        
        let idiom = calculateToolConfigurationIdiom()
        toolConfigurationIdiomPrevious = idiom
        toolConfigurationIdiomCurrent = idiom
        
        if Device.isPad {
            
            let bluePrintTopPrimary = getRowBluePrint_Top_Primary_Pad(toolConfigurationIdiom: idiom)
            let rowTopPrimary = getRow(rowBluePrint: bluePrintTopPrimary,
                                       slot: .top_Primary,
                                       width: rowWidth,
                                       height: rowHeight)
            rowsDraggable.append(rowTopPrimary)
            
            let bluePrintTopSecondary1 = getRowBluePrint_Top_Secondary1_Pad(toolConfigurationIdiom: idiom)
            let rowTopSecondary1 = getRow(rowBluePrint: bluePrintTopSecondary1,
                                          slot: .top_Secondary1,
                                          width: rowWidth,
                                          height: rowHeight)
            rowsDraggable.append(rowTopSecondary1)
            
            let bluePrintTopSecondary2 = getRowBluePrint_Top_Secondary2_Pad(toolConfigurationIdiom: idiom)
            let rowTopSecondary2 = getRow(rowBluePrint: bluePrintTopSecondary2,
                                          slot: .top_Secondary2,
                                          width: rowWidth,
                                          height: rowHeight)
            rowsDraggable.append(rowTopSecondary2)
            
            let bluePrintBottomSecondary2 = getRowBluePrint_Bottom_Secondary2_Pad(toolConfigurationIdiom: idiom)
            let rowBottomSecondary2 = getRow(rowBluePrint: bluePrintBottomSecondary2,
                                             slot: .bottom_Secondary2,
                                             width: rowWidth,
                                             height: rowHeight)
            rowsDraggable.append(rowBottomSecondary2)
            
            let bluePrintBottomSecondary1 = getRowBluePrint_Bottom_Secondary1_Pad(toolConfigurationIdiom: idiom)
            let rowBottomSecondary1 = getRow(rowBluePrint: bluePrintBottomSecondary1,
                                             slot: .bottom_Secondary1,
                                             width: rowWidth,
                                             height: rowHeight)
            rowsDraggable.append(rowBottomSecondary1)
            
            let bluePrintBottomPrimary = getRowBluePrint_Bottom_Primary_Pad(toolConfigurationIdiom: idiom)
            let rowBottomPrimary = getRow(rowBluePrint: bluePrintBottomPrimary,
                                          slot: .bottom_Primary,
                                          width: rowWidth,
                                          height: rowHeight)
            rowsDraggable.append(rowBottomPrimary)
        }
       
        
        
        /*
        
        let rowGraphSide1 = ToolRow()
        rowGraphSide1.setNodes([
            getSpacerToolNode(defaultWidth: 0),
            getResetWeightGraphTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .spacer),
            getSpacerToolNode(defaultWidth: 0),
                      ],
                      animated: false,
                      reversed: false,
                      width: rowWidth,
                      height: rowHeight,
                      safeAreaLeft: safeAreaLeft,
                      safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory,
                      sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
        rowsGraphSideMenu.append(rowGraphSide1)
        
        let rowGraphSide2 = ToolRow()
        rowGraphSide2.setNodes([
            getCloseWeightGraphTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                      ],
                      animated: false,
                      reversed: false,
                      width: rowWidth,
                      height: rowHeight,
                      safeAreaLeft: safeAreaLeft,
                      safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory,
                      sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
        rowsGraphSideMenu.append(rowGraphSide2)
        
        let rowGraphSide3 = ToolRow()
        rowGraphSide3.setNodes([
            getBreakManualWeightGraphTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                      ],
                      animated: false,
                      reversed: false,
                      width: rowWidth,
                      height: rowHeight,
                      safeAreaLeft: safeAreaLeft,
                      safeAreaRight: safeAreaRight,
                      layoutStackingCategory: layoutStackingCategory,
                      sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders)
        rowsGraphSideMenu.append(rowGraphSide3)
         
        */
        
        // TODO: These need to be clones, not the original nodes.
        if Device.isPad {
            //allPossibleRowBluePrints.append(getRowBluePrintMainControlsStandardPad())
            //allPossibleRowBluePrints.append(getRowBluePrintMainControlsViewPad())
            //allPossibleRowBluePrints.append(getRowBluePrintMainControlsWeightsPad())
            
        } else {
            
        }
        
        for possibleRowBluePrint in allPossibleRowBluePrints {
            let rowStackingCategoryCalculator = RowStackingCategoryCalculator(orientation: orientation,
                                                                              rowBluePrint: possibleRowBluePrint)
            rowStackingCategoryCalculators.append(rowStackingCategoryCalculator)
        }
        
        publisherLinkUp()
    }
    
    var zoomEnabledUpdateCancellable: AnyCancellable?
    var resetZoomActiveUpdateCancellable: AnyCancellable?
    var weightCurveGraphEnabledUpdateCancellable: AnyCancellable?
    var jigglesDidChangeCancellable: AnyCancellable?
    var createJigglesStandardUpdateCancellable: AnyCancellable?
    var createJigglesDrawingUpdateCancellable: AnyCancellable?
    var createPointsUpdateCancellable: AnyCancellable?
    var removePointsUpdateCancellable: AnyCancellable?
    var createWeightRingsStandardUpdateCancellable: AnyCancellable?
    var createWeightRingsDrawingUpdateCancellable: AnyCancellable?
    var createWeightRingPointsUpdateCancellable: AnyCancellable?
    var removeWeightRingPointsUpdateCancellable: AnyCancellable?
    var selectedJiggleDataUpdateCancellable: AnyCancellable?
    
    func publisherLinkUp() {
        
        jigglesDidChangeCancellable = jiggleViewModel
            .jiggleDocument
            .jigglesDidChangePublisher
            .sink { [weak self] in
                print("Jiggles Changed...!!!")
                if let self = self {
                    self.handleJigglesDidChange()
                }
            }
        
        zoomEnabledUpdateCancellable = jiggleViewModel
            .zoomEnabledUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleZoomEnabledDidChange()
                }
            }
        
        resetZoomActiveUpdateCancellable = jiggleViewModel
            .resetZoomActiveUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleResetZoomActiveDidChange()
                }
            }
        
        weightCurveGraphEnabledUpdateCancellable = jiggleViewModel
            .weightCurveGraphEnabledUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleWeightCurveGraphEnabledDidChange()
                }
            }
        
        selectedJiggleDataUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .selectedJiggleDataUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleSelectedJiggleDidChange()
                }
            }
        
        createJigglesStandardUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createJigglesStandardUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreateJiggleStandardDidChange()
                }
            }
        
        createJigglesDrawingUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createJigglesDrawingUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreateJiggleDrawingDidChange()
                }
            }
        
        createPointsUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createPointsUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreatePointsDidChange()
                }
            }
        
        removePointsUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .removePointsUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleRemovePointsDidChange()
                }
            }
        
        createWeightRingsStandardUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createWeightRingsStandardUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreateWeightRingsStandardDidChange()
                }
            }
        
        createWeightRingsDrawingUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createWeightRingsDrawingUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreateWeightRingsDrawingDidChange()
                }
            }
        
        createWeightRingPointsUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createWeightRingPointsUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreateWeightRingPointsDidChange()
                }
            }
        
        removeWeightRingPointsUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .removeWeightRingPointsUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleRemoveWeightRingPointsDidChange()
                }
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
                                            layoutStackingCategory: layoutStackingCategory,
                                            sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders) }
            
            for row in rowsBottom { row.layout(width: rowWidth,
                                               height: rowHeight,
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
                                                  layoutStackingCategory: layoutStackingCategory,
                                                  sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders) }
        }
    }
    
    func replaceTopToolbarA() {
        print("replaceTopToolbarA()")
        
        let row1 = rowsDraggable[0]
        row1.setNodes([
            getCloneJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
            getCloneJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .divider),
            getDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .spacer),
            getSpacerToolNode(defaultWidth: 8, neighborTypeLeft: .divider, neighborTypeRight: .segment),
            getDocumentModeSegmentToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .spacer),
            getSpacerToolNode(defaultWidth: 8, neighborTypeLeft: .divider, neighborTypeRight: .segment),
                       ],
                      animated: true,
                      reversed: false, 
                      width: rowWidth,
                      height: rowHeight,
                      layoutStackingCategory: layoutStackingCategory,
                      sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders,
                      centerPinnedElement: nil)
        
    }
    
    func replaceTopToolbarB() {
        print("replaceTopToolbarB()")
        
        let row1 = rowsDraggable[0]
        row1.setNodes([
            getCloneJiggleTextIconButtonToolNode(neighborTypeLeft: .iconButton, neighborTypeRight: .dividerSpacerDivider),
            getDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .spacer),
            getSpacerToolNode(defaultWidth: 12, neighborTypeLeft: .divider, neighborTypeRight: .segment),
            getZoomEnabledCheckBoxNode(neighborTypeLeft: .segment, neighborTypeRight: .dividerSpacerDivider),
            getDividerSpacerDividerToolNode(neighborTypeLeft: .checkBox, neighborTypeRight: .textIconButton),
            getCloneJiggleTextIconButtonToolNode(neighborTypeLeft: .dividerSpacerDivider, neighborTypeRight: nil)
        ],
                      animated: true,
                      reversed: false,
                      width: rowWidth,
                      height: rowHeight,
                      layoutStackingCategory: layoutStackingCategory,
                      sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders,
                      centerPinnedElement: nil)
    }
    
    
    func replaceBottom3ToolbarsA() {
        print("replaceBottom3ToolbarsA()")
    }
    
    func replaceBottom3ToolbarsB() {
        print("replaceBottom3ToolbarsB()")
    }
    
    func getRowBluePrintEmpty() -> RowBluePrint {
        RowBluePrint(nodes: [], configuration: .empty)
    }
    
    func getRowBluePrint_Top_Secondary1_Empty() -> RowBluePrint {
        return RowBluePrint(nodes: [], configuration: .top_Secondary1_Empty)
    }
    
    func getRowBluePrint_Top_Secondary2_Empty() -> RowBluePrint {
        return RowBluePrint(nodes: [], configuration: .top_Secondary2_Empty)
    }
    
    func getRowBluePrint_Bottom_Secondary2_Empty() -> RowBluePrint {
        return RowBluePrint(nodes: [], configuration: .bottom_Secondary2_Empty)
    }
    
    func getRowBluePrint_Bottom_Secondary1_Empty() -> RowBluePrint {
        return RowBluePrint(nodes: [], configuration: .bottom_Secondary1_Empty)
    }
    
    func getRowBluePrintJunkTest(toolRowConfiguration: ToolRowConfiguration) -> RowBluePrint {
        let nodes = [
            getWeightCurveGraphEnabledCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: .checkBox),
            getGyroscopeEnabledCheckBoxNode(neighborTypeLeft: .checkBox, neighborTypeRight: .spacer),
            getSpacerToolNode(defaultWidth: 0, neighborTypeLeft: .checkBox, neighborTypeRight: .textIconButton),
            getFlipVerticalJiggleTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .textIconButton),
            getFlipHorizontalJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
            getSendBackJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
            getSendBackwardJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
            getSendForwardJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
            getSendFrontWeightRingTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: toolRowConfiguration, centerPinnedElement: nil)
    }
    
    func calculateToolConfigurationIdiom() -> ToolConfigurationIdiom {
        if let jiggleViewModel = jiggleViewModel {
            if jiggleViewModel.isZoomEnabled {
                return .zoom
            } else {
                switch jiggleViewModel.jiggleDocument.documentMode {
                case .view:
                    
                    switch jiggleViewModel.jiggleDocument.animationMode {
                        
                    case .bounce:
                        return .viewAnimationBounce
                    case .wobble:
                        return .viewAnimationWobble
                    case .twist:
                        return .viewAnimationTwist
                    }
                    
                case .jiggles:
                    return .jiggles
                case .points:
                    return .points
                case .weights:
                    switch jiggleViewModel.jiggleDocument.weightMode {
                        
                    case .affine:
                        switch jiggleViewModel.displayMode {
                        case .regular:
                            return .weightsAffineRegular
                        case .swivel:
                            return .weightsAffineSwivel
                        case .split:
                            return .weightsAffineSplit
                        }
                    case .points:
                        switch jiggleViewModel.displayMode {
                        case .regular:
                            return .weightsPointsRegular
                        case .swivel:
                            return .weightsPointsSwivel
                        case .split:
                            return .weightsPointsSplit
                        }
                    case .centers:
                        switch jiggleViewModel.displayMode {
                        case .regular:
                            return .weightsCentersRegular
                        case .swivel:
                            return .weightsCentersSwivel
                        case .split:
                            return .weightsCentersSplit
                        }
                    }
                }
            }
        } else {
            return .unknown
        }
    }
    
    func updateRow(slot: ToolRowSlot?, rowBluePrint: RowBluePrint?, reversed: Bool) {
        
        guard let slot = slot else {
            return
        }
        guard let row = getRow(slot: slot) else {
            return
        }
        
        if let rowBluePrint = rowBluePrint {
            if row.configuration != rowBluePrint.configuration {
                row.configuration = rowBluePrint.configuration
                row.setNodes(rowBluePrint.nodes,
                             animated: true,
                             reversed: reversed,
                             width: rowWidth,
                             height: rowHeight,
                             layoutStackingCategory: layoutStackingCategory,
                             sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders,
                             centerPinnedElement: rowBluePrint.centerPinnedElement)
            }
        } else {
            row.configuration = .unknown
            row.setNodes([], animated: true,
                         reversed: reversed,
                         width: rowWidth,
                         height: rowHeight,
                         layoutStackingCategory: layoutStackingCategory, 
                         sliderLayoutSchemeFlavor: layoutSchemeFlavorSliders,
                         centerPinnedElement: nil)
        }
    }
    
    
    var isBlocked: Bool {
        
        if isBlockedExceptForHistory {
            return true
        }
        
        if let jiggleViewController = jiggleViewModel.jiggleViewController {
            if jiggleViewController.enqueuedHistoryState !== nil {
                print("Action Blocked - jiggleViewController.enqueuedHistoryState")
                return true
            }
        }
        return false
    }
    
    var isBlockedExceptForHistory: Bool {
        
        switch jiggleViewModel._storedDocumentModeTransitionState {
        case .pendingRemesh:
            print("Action Blocked - pendingRemesh")
            return true
        case .pendingTransition:
            print("Action Blocked - pendingTransition")
            return true
        default:
            break
        }
        
        if jiggleViewModel._storedDisplayTransition.isActive {
            print("Action Blocked - jiggleViewModel._storedDisplayTransition.isActive")
            return true
        }
        
        if let jiggleViewController = jiggleViewModel.jiggleViewController {
            
            if jiggleViewController._storedDocumentModeTransitionTick > 0 {
                print("Action Blocked - _storedDocumentModeTransitionTick = \(jiggleViewController._storedDocumentModeTransitionTick)")
                return true
            }
            
            if jiggleViewController._storedInterfaceActionTick > 0 {
                print("Action Blocked - _storedInterfaceActionTick = \(jiggleViewController._storedInterfaceActionTick)")
                return true
            }
            
            if jiggleViewController._storedExpandAndCollapsePhoneMenusAction.isActive {
                print("Action Blocked - _storedExpandAndCollapsePhoneMenusAction.isActive")
                return true
            }
            
            if jiggleViewController._storedEnterGraphModeDueToDocumentModeAction.isActive {
                print("Action Blocked - _storedEnterGraphModeDueToDocumentModeAction.isActive")
                return true
            }
            
            if jiggleViewController._storedExitGraphModeDueToDocumentModeAction.isActive {
                print("Action Blocked - _storedExitGraphModeDueToDocumentModeAction.isActive")
                return true
            }
            
            if jiggleViewController._storedPhoneUpdateDisplayFrameAction.isActive {
                print("Action Blocked - _storedPhoneUpdateDisplayFrameAction.isActive")
                return true
            }
            
            if jiggleViewController.isEnteringOrExitingGraphMode {
                print("Action Blocked - jiggleViewController.isEnteringOrExitingGraphMode")
                return true
            }
            if jiggleViewController.isEnteringOrExitingGraphMode {
                print("Action Blocked - jiggleViewController.isEnteringOrExitingGraphMode")
                return true
            }
            if jiggleViewController.phoneIsExpandOrCollapseAnimationActive {
                print("Action Blocked - jiggleViewController.phoneIsExpandOrCollapseAnimationActive")
                return true
            }
        }
        
        if jiggleViewModel.isDisplayTransitionActive {
            print("Action Blocked - jiggleViewModel.isDisplayTransitionActive")
            return true
        }
        
        if jiggleViewModel.isWeightCurveTransitionActive {
            print("Action Blocked - jiggleViewModel.isWeightCurveTransitionActive")
            return true
        }
        
        if jiggleViewModel.actionBlocker.isBlocked {
            print("Action Blocked - jiggleViewModel.actionBlocker.isBlocked")
            return true
        }
        
        return false
    }
    
    var isBlockedAnyTransition: Bool {
        
        switch jiggleViewModel._storedDocumentModeTransitionState {
        case .pendingRemesh:
            print("Action Blocked - pendingRemesh")
            return true
        case .pendingTransition:
            print("Action Blocked - pendingTransition")
            return true
        default:
            break
        }
        
        if let jiggleViewController = jiggleViewModel.jiggleViewController {
            if jiggleViewController.isEnteringOrExitingGraphMode {
                print("Action Blocked - jiggleViewController.isEnteringOrExitingGraphMode")
                return true
            }
            if jiggleViewController.isEnteringOrExitingGraphMode {
                print("Action Blocked - jiggleViewController.isEnteringOrExitingGraphMode")
                return true
            }
            if jiggleViewController.phoneIsExpandOrCollapseAnimationActive {
                print("Action Blocked - jiggleViewController.phoneIsExpandOrCollapseAnimationActive")
                return true
            }
        }
        
        if jiggleViewModel.isDisplayTransitionActive {
            print("Action Blocked - jiggleViewModel.isDisplayTransitionActive")
            return true
        }
        
        if jiggleViewModel.isWeightCurveTransitionActive {
            print("Action Blocked - jiggleViewModel.isWeightCurveTransitionActive")
            return true
        }
        
        return false
    }
    
}
