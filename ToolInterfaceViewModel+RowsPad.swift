//
//  ToolInterfaceViewModel+RowsPad.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/16/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
//case top_Primary
//case top_Secondary1
//case top_Secondary2

//case bottom_Secondary2
//case bottom_Secondary1
//case bottom_Primary
    
    /*

     MagicalTextIconButtonViewModel+SendBackWeightRing
     MagicalTextIconButtonViewModel+SendBackwardWeightRing

     MagicalTextIconButtonViewModel+SelectNextWeightRing
     MagicalTextIconButtonViewModel+SelectPreviousWeightRing

     MagicalTextIconButtonViewModel+SelectNextWeightRingPoint
     MagicalTextIconButtonViewModel+SelectPreviousWeightRingPoint

     MagicalTextIconButtonViewModel+SendForwardWeightRing
     MagicalTextIconButtonViewModel+SendFrontWeightRing


     MagicalTextIconButtonViewModel+ResetSwivelCamera

     MagicalTextIconButtonViewModel+ResetWeightGraph


     MagicalTextIconButtonViewModel+RemoveWeightRingPoint

     MagicalCheckBoxViewModel+RemoveWeightRingPoints


     MagicalCheckBoxViewModel+WeightCurveGraphEnabled

     MagicalTextIconButtonViewModel+FreezeOffAllWeightRing
     MagicalTextIconButtonViewModel+FreezeOnSelectedWeightRing
     MagicalTextIconButtonViewModel+FreezeOnAllUnselectedWeightRing
     */
    
    func getRowBluePrint_Top_Primary_Pad(toolConfigurationIdiom: ToolConfigurationIdiom) -> RowBluePrint? {
        switch toolConfigurationIdiom {
        case .viewGyro, .viewContinuous,
                .viewAnimationBounce, .viewAnimationWobble, .viewAnimationTwist:
            return getRowBluePrint_Top_Primary_Standard_Pad()
        case .zoom:
            return getRowBluePrint_Top_Primary_Zoom_Pad()
        case .weightsAffineRegular, .weightsAffineSwivel, .weightsAffineSplit,
                .weightsPointsRegular, .weightsPointsSwivel, .weightsPointsSplit,
                .weightsCentersRegular, .weightsCentersSwivel, .weightsCentersSplit:
            return getRowBluePrint_Top_Primary_Weights_Pad()
        default:
            return getRowBluePrint_Bottom_Primary_Standard_Pad()
        }
    }
    
    func getRowBluePrint_Top_Weights_Pad(toolConfigurationIdiom: ToolConfigurationIdiom) -> RowBluePrint? {
        return getRowBluePrint_Top_Primary_Standard_Pad()
    }
    
    func getRowBluePrint_Top_Secondary1_Pad(toolConfigurationIdiom: ToolConfigurationIdiom) -> RowBluePrint? {
        
        switch toolConfigurationIdiom {
        case .zoom:
            return getRowBluePrint_Top_Secondary1_Empty()
        case .weightsAffineRegular, .weightsAffineSwivel, .weightsAffineSplit:
            return getRowBluePrint_Top_Secondary1_Weights_Affine_NoSwivel_Pad()
        case .weightsPointsRegular, .weightsPointsSwivel, .weightsPointsSplit:
            return getRowBluePrint_Top_Secondary1_Weights_Affine_NoSwivel_Pad()
        case .weightsCentersRegular, .weightsCentersSwivel, .weightsCentersSplit:
            return getRowBluePrint_Top_Secondary1_Weights_Affine_NoSwivel_Pad()
        case .points:
            return getRowBluePrint_Top_Secondary1_Points_Pad()
        default:
            return getRowBluePrint_Top_Secondary1_Jiggles_Pad()
        }
    }
    
    func getRowBluePrint_Top_Secondary2_Pad(toolConfigurationIdiom: ToolConfigurationIdiom) -> RowBluePrint? {
        switch toolConfigurationIdiom {
        case .zoom:
            return getRowBluePrint_Top_Secondary2_Empty()
        case .weightsAffineRegular, .weightsAffineSwivel, .weightsAffineSplit:
            return getRowBluePrint_Top_Secondary2_Weights_Affine_NoSwivel_Pad()
        case .weightsPointsRegular, .weightsPointsSwivel, .weightsPointsSplit:
            return getRowBluePrint_Top_Secondary2_Weights_Affine_NoSwivel_Pad()
        case .weightsCentersRegular, .weightsCentersSwivel, .weightsCentersSplit:
            return getRowBluePrint_Top_Secondary2_Weights_Affine_NoSwivel_Pad()
        case .points:
            return getRowBluePrint_Top_Secondary2_Points_Pad()
        default:
            return getRowBluePrint_Top_Secondary2_Jiggles_Pad()
        }
    }
    
    func getRowBluePrint_Bottom_Secondary2_Pad(toolConfigurationIdiom: ToolConfigurationIdiom) -> RowBluePrint? {
        switch toolConfigurationIdiom {
        case .weightsAffineRegular, .weightsAffineSwivel, .weightsAffineSplit:
            return getRowBluePrint_Bottom_Secondary2_Weights_Affine_NoSwivel_Pad()
        case .weightsPointsRegular, .weightsPointsSwivel, .weightsPointsSplit:
            return getRowBluePrint_Bottom_Secondary2_Weights_Affine_NoSwivel_Pad()
        case .weightsCentersRegular, .weightsCentersSwivel, .weightsCentersSplit:
            return getRowBluePrint_Bottom_Secondary2_Weights_Affine_NoSwivel_Pad()
        case .points:
            return getRowBluePrint_Bottom_Secondary2_Points_Pad()
        default:
            return getRowBluePrint_Bottom_Secondary2_Jiggles_Pad()
        }
    }
    
    func getRowBluePrint_Bottom_Secondary1_Pad(toolConfigurationIdiom: ToolConfigurationIdiom) -> RowBluePrint? {
        switch toolConfigurationIdiom {
        case .weightsAffineRegular, .weightsAffineSwivel, .weightsAffineSplit:
            return getRowBluePrint_Bottom_Secondary1_Weights_Affine_NoSwivel_Pad()
        case .weightsPointsRegular, .weightsPointsSwivel, .weightsPointsSplit:
            return getRowBluePrint_Bottom_Secondary1_Weights_Points_NoSwivel_Pad()
        case .weightsCentersRegular, .weightsCentersSwivel, .weightsCentersSplit:
            return getRowBluePrint_Bottom_Secondary1_Weights_Center_NoSwivel_Pad()
        case .points:
            return getRowBluePrint_Bottom_Secondary1_Points_Pad()
        default:
            return getRowBluePrint_Bottom_Secondary1_Jiggles_Pad()
        }
    }
    
    func getRowBluePrint_Bottom_Primary_Pad(toolConfigurationIdiom: ToolConfigurationIdiom) -> RowBluePrint? {
        switch toolConfigurationIdiom {
        case .viewGyro, .viewContinuous,
                .viewAnimationBounce, .viewAnimationWobble, .viewAnimationTwist:
            return getRowBluePrint_Bottom_Primary_View_Pad()
        case .zoom:
            return getRowBluePrint_Bottom_Primary_Zoom_Pad()
        case .weightsAffineRegular, .weightsAffineSwivel, .weightsAffineSplit,
                .weightsPointsRegular, .weightsPointsSwivel, .weightsPointsSplit,
                .weightsCentersRegular, .weightsCentersSwivel, .weightsCentersSplit:
            return getRowBluePrint_Bottom_Primary_Weights_Pad()
        default:
            return getRowBluePrint_Bottom_Primary_Standard_Pad()
        }
    }
    
    func getRowBluePrint_Top_Primary_Standard_Pad() -> RowBluePrint {
        let nodes = [getMainMenuTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
                     getSpacerToolNode(defaultWidth: 0, neighborTypeLeft: .textIconButton, neighborTypeRight: .checkBox),
                     getDarkModeEnabledCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_Standard, centerPinnedElement: nil)
    }
    
    func getRowBluePrint_Top_Primary_Zoom_Pad() -> RowBluePrint {
        let nodes = [getMainMenuTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
                     getSpacerToolNode(defaultWidth: 0, neighborTypeLeft: .textIconButton, neighborTypeRight: .checkBox),
                     getDarkModeEnabledCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_Zoom, centerPinnedElement: nil)
    }
    
    func getRowBluePrint_Top_Primary_Weights_Pad() -> RowBluePrint {
        let centerPinnedNode = getBouncePowerSliderToolNode(widthCategory: .halfWidthLeft,
                                                            neighborTypeLeft: .spacer, neighborTypeRight: .spacer)
        let nodes = [getMainMenuTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
                     getSpacerToolNode(defaultWidth: 0, neighborTypeLeft: .textIconButton, neighborTypeRight: .slider),
                     
                     
                     centerPinnedNode,
                     
                     //getDisplayModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getSpacerToolNode(defaultWidth: 0, neighborTypeLeft: .slider, neighborTypeRight: .checkBox),
                     
                     getDarkModeEnabledCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_Weights, centerPinnedElement: nil)
    }

    func getRowBluePrint_Top_Secondary1_Jiggles_Pad() -> RowBluePrint {
        let nodes = [getSelectPreviousJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
                     getSelectNextJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .dividerSpacerDivider),
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     getFreezeOnAllUnselectedJiggleTextIconButtonToolNode(neighborTypeLeft: .divider, neighborTypeRight: .textIconButton),
                     getFreezeOnSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Jiggles)
    }
    
    func getRowBluePrint_Top_Secondary1_Points_Pad() -> RowBluePrint {
        let nodes = [getSelectPreviousPointTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
                     getSelectNextPointTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .dividerSpacerDivider),
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     getFreezeOnAllUnselectedJiggleTextIconButtonToolNode(neighborTypeLeft: .divider, neighborTypeRight: .textIconButton),
                     getFreezeOnSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Points)
    }
    
    func getRowBluePrint_Top_Secondary1_Weights_Affine_NoSwivel_Pad() -> RowBluePrint {
        let nodes = [getSelectPreviousJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
                     getSelectNextJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .dividerSpacerDivider),
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     getSelectPreviousWeightRingTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getSelectNextWeightRingTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getBounceSpeedSliderToolNode(widthCategory: .halfWidthRight, neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getFreezeOnAllUnselectedWeightRingTextIconButtonToolNode(neighborTypeLeft: .divider, neighborTypeRight: .textIconButton),
                     getFreezeOnSelectedWeightRingTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Weights_Affine)
    }
    
    func getRowBluePrint_Top_Secondary2_Jiggles_Pad() -> RowBluePrint {
        let nodes = [getSendBackJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
                     getSendBackwardJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     getSendForwardJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     getSendFrontJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .dividerSpacerDivider),
                     
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     
                     getFreezeOffAllJiggleTextIconButtonToolNode(neighborTypeLeft: .dividerSpacerDivider, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_Jiggles)
    }
    
    func getRowBluePrint_Top_Secondary2_Points_Pad() -> RowBluePrint {
        let nodes = [getMainMenuTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .dividerSpacerDivider),
            
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     
                     getFreezeOffAllJiggleTextIconButtonToolNode(neighborTypeLeft: .dividerSpacerDivider, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Points)
    }
    
    func getRowBluePrint_Top_Secondary2_Weights_Affine_NoSwivel_Pad() -> RowBluePrint {
        let nodes = [getSendBackwardWeightRingTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
                     
                     getSendBackwardWeightRingTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .dividerSpacerDivider),
                     getSendForwardWeightRingTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     getSendFrontWeightRingTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     
                     getFreezeOffAllWeightRingTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                    
                    /*
                     getExitRecordModeTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     getResetCenterWeightGeometryTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     getResetSwivelFrontTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     getResetSwivelBackTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     getResetSwivelLeftTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     getResetSwivelRightTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     getResetSwivelTiltTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     getIncreaseJigglePointsTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     getIncreaseWeightRingPointsTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                    */
                     
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_Weights_Affine)
    }
    
    func getRowBluePrint_Bottom_Secondary2_Jiggles_Pad() -> RowBluePrint {
        let nodes = [getCloneJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
                     getRemoveJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .dividerSpacerDivider),
                     
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     
                     getFlipHorizontalJiggleTextIconButtonToolNode(neighborTypeLeft: .dividerSpacerDivider, neighborTypeRight: .textIconButton),
                     getFlipVerticalJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .dividerSpacerDivider),
                     
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     
                     getResetCenterJiggleTextIconButtonToolNode(neighborTypeLeft: .dividerSpacerDivider, neighborTypeRight: nil)
                     
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Jiggles)
    }
    
    func getRowBluePrint_Bottom_Secondary2_Points_Pad() -> RowBluePrint {
        let nodes = [getRemovePointsCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRemovePointTextIconButtonToolNode(neighborTypeLeft: .checkBox, neighborTypeRight: .dividerSpacerDivider),
                     
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     
                     getResetCenterJiggleTextIconButtonToolNode(neighborTypeLeft: .dividerSpacerDivider, neighborTypeRight: nil)
                     
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Points)
    }
    
    func getRowBluePrint_Bottom_Secondary2_Weights_Affine_NoSwivel_Pad() -> RowBluePrint {
        let nodes = [getCloneWeightRingTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRemoveWeightRingTextIconButtonToolNode(neighborTypeLeft: .checkBox, neighborTypeRight: .dividerSpacerDivider),
                     
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     
                     getFlipHorizontalWeightRingTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getFlipVerticalWeightRingTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getResetCenterWeightRingTextIconButtonToolNode(neighborTypeLeft: .dividerSpacerDivider, neighborTypeRight: nil),
                     getWeightCurveGraphEnabledCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil)
                     
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Points)
    }
    
    func getRowBluePrint_Bottom_Secondary1_Jiggles_Pad() -> RowBluePrint {
        let nodes = [getCreateJigglesStandardCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: .checkBox),
                     getCreateJigglesDrawingCheckBoxNode(neighborTypeLeft: .checkBox, neighborTypeRight: .spacer),
                     
                     getSpacerToolNode(defaultWidth: 0, neighborTypeLeft: .checkBox, neighborTypeRight: .textIconButton),

                     getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .textIconButton),
                     getResetZoomTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Jiggles)
    }
    
    func getRowBluePrint_Bottom_Secondary1_Points_Pad() -> RowBluePrint {
        let nodes = [getCreatePointsCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: .checkBox),
                     getMainMenuTextIconButtonToolNode(neighborTypeLeft: .checkBox, neighborTypeRight: .dividerSpacerDivider),

                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     
                     getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .textIconButton),
                     getResetZoomTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Points)
    }
    
    func getRowBluePrint_Bottom_Secondary1_Weights_Affine_NoSwivel_Pad() -> RowBluePrint {
        let nodes = [getCreateWeightRingsStandardCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: .checkBox),
                     getCreateWeightRingsDrawingCheckBoxNode(neighborTypeLeft: .checkBox, neighborTypeRight: .dividerSpacerDivider),
                     
                     getGenerateTopographyTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .checkBox, neighborTypeRight: .textIconButton),
                     
                     getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .textIconButton),
                     getResetZoomTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Weights_Affine)
    }
    
    func getRowBluePrint_Bottom_Secondary1_Weights_Points_NoSwivel_Pad() -> RowBluePrint {
        let nodes = [getCreatePointsCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: .checkBox),
                     getMainMenuTextIconButtonToolNode(neighborTypeLeft: .checkBox, neighborTypeRight: .dividerSpacerDivider),

                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     
                     getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .textIconButton),
                     getResetZoomTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Weights_Points)
    }
    
    func getRowBluePrint_Bottom_Secondary1_Weights_Center_NoSwivel_Pad() -> RowBluePrint {
        let nodes = [getCreatePointsCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: .checkBox),
                     getMainMenuTextIconButtonToolNode(neighborTypeLeft: .checkBox, neighborTypeRight: .dividerSpacerDivider),
                     
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     
                     getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .textIconButton),
                     getResetZoomTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Weights_Center)
    }
    
    func getRowBluePrint_Bottom_Primary_Standard_Pad() -> RowBluePrint {
        let centerPinnedNode = getDocumentModeSegmentToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .spacer)
        let nodes = [getUndoTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
                     getRedoTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .spacer),
                     getSpacerToolNode(defaultWidth: 0, neighborTypeLeft: .textIconButton, neighborTypeRight: .segment),
                     
                     centerPinnedNode,
                     
                     getSpacerToolNode(defaultWidth: 0, neighborTypeLeft: .segment, neighborTypeRight: .checkBox),
                     
                     getZoomEnabledCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_Standard, centerPinnedElement: centerPinnedNode.element)
    }
    
    func getRowBluePrint_Bottom_Primary_Zoom_Pad() -> RowBluePrint {
        let nodes = [getExitZoomModeTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .dividerSpacerDivider),
                     
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .checkBox),
                     
                     getZoomEnabledCheckBoxNode(neighborTypeLeft: .dividerSpacerDivider, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_Zoom)
    }
    
    func getRowBluePrint_Bottom_Primary_Weights_Pad() -> RowBluePrint {
        let centerPinnedNode = getWeightModeSegmentToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .spacer)
        let nodes = [getExitWeightModeTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
                     getUndoTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     getRedoTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .spacer),
                     getSpacerToolNode(defaultWidth: 0, neighborTypeLeft: .checkBox, neighborTypeRight: .segment),
                     centerPinnedNode,
                     getSpacerToolNode(defaultWidth: 0, neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     
                     getZoomEnabledCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_Weights, centerPinnedElement: centerPinnedNode.element)
    }
    
    func getRowBluePrint_Bottom_Primary_View_Pad() -> RowBluePrint {
        let centerPinnedNode = getAutoLoopEnabledCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        let nodes = [getExitViewModeTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
                     getUndoTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     getRedoTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .spacer),
                     getSpacerToolNode(defaultWidth: 0, neighborTypeLeft: .textIconButton, neighborTypeRight: .checkBox),
                     
                     getGyroscopeEnabledCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     centerPinnedNode,
                     
                     getSpacerToolNode(defaultWidth: 0, neighborTypeLeft: .checkBox, neighborTypeRight: .segment),
                     
                     getZoomEnabledCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_View, centerPinnedElement: centerPinnedNode.element)
    }
    
    /*
    func getRowBluePrint_Top_Secondary2_Jiggles_Pad() -> RowBluePrint {
        let nodes = [getSend
            
            
            getSelectPreviousJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
                     getSelectNextJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     getFlipHorizontalJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     getFlipVerticalJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .dividerSpacerDivider),
                     
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     
                     getFreezeOffAllJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Jiggles)
    }
    */
    
    /*
    func getRowMainControlsBluePrintPad(idiom: ToolRowIdiom) -> RowBluePrint? {
        switch idiom {
        case .unknown:
            return getRowBluePrintJunkTest()
        case .record:
            return getRowBluePrintJunkTest()
        case .viewGyro:
            return getRowBluePrintJunkTest()
        case .viewContinuous:
            return getRowBluePrintMainControlsViewPad()
        case .viewAnimationBounce, .viewAnimationWobble, .viewAnimationTwist:
            return getRowBluePrintMainControlsViewPad()
        case .zoom:
            return getRowBluePrintMainControlsZoom()
        case .jiggles, .points:
            return getRowBluePrintMainControlsStandardPad()
        case .weightsAffineRegular, .weightsAffineSwivel, .weightsAffineSplit,
                .weightsPointsRegular, .weightsPointsSwivel, .weightsPointsSplit,
            .weightsCentersRegular, .weightsCentersSwivel, .weightsCentersSplit:
            return getRowBluePrintMainControlsWeightsPad()
        }
    }
    
    
    
    func getRowBluePrintToolSecondaryControlsJigglePad() -> RowBluePrint {
        let nodes = [getSelectPreviousJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
                     getSelectNextJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     getFlipHorizontalJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     getFlipVerticalJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .dividerSpacerDivider),
                     
                     getDividerSpacerDividerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     
                     getFreezeOffAllJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .toolSecondaryControlsJiggles)
    }
    
    //getRowToolControlsBlueprintPad
    
    func getRowBluePrintMainControlsStandardPad() -> RowBluePrint {
        
    }
    
    
    
    func getRowBluePrintMainControlsViewPad() -> RowBluePrint {
        
    }
    */
    
}
